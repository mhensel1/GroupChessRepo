package edu.ycp.cs320.booksdb.persist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.ycp.cs320.booksdb.model.User;
import edu.ycp.cs320.booksdb.model.Game;
import edu.ycp.cs320.booksdb.model.gameUser;
import edu.ycp.cs320.booksdb.model.Pair;
import edu.ycp.cs320.booksdb.model.Piece;

public class DerbyDatabase implements IDatabase {
	static {
		try {
			Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
		} catch (Exception e) {
			throw new IllegalStateException("Could not load Derby driver");
		}
	}
	
	private interface Transaction<ResultType> {
		public ResultType execute(Connection conn) throws SQLException;
	}

	private static final int MAX_ATTEMPTS = 10;

	
	// transaction that retrieves a Game, and its User by Title
	@Override
	public List<Pair<User, Game>> findUserAndGameByID(final int id) {
		return executeTransaction(new Transaction<List<Pair<User,Game>>>() {
			@Override
			public List<Pair<User, Game>> execute(Connection conn) throws SQLException {
				PreparedStatement stmt = null;
				ResultSet resultSet = null;
				
				try {
					stmt = conn.prepareStatement(
							"select users.*, games.* " +
							"  from  users, games, gameUsers " +
							"  where games.game_id = ? " +
							"    and users.user_id = gameUsers.user_id " +
							"    and games.game_id = gameUsers.game_id"
					);
					stmt.setInt(1, id);
					
					List<Pair<User, Game>> result = new ArrayList<Pair<User,Game>>();
					
					resultSet = stmt.executeQuery();
					
					// for testing that a result was returned
					Boolean found = false;
					
					while (resultSet.next()) {
						found = true;
						
						User user = new User();
						loadAuthor(user, resultSet, 1);
						Game game = new Game();
						loadBook(game, resultSet, 4);
						
						result.add(new Pair<User, Game>(user, game));
					}
					
					// check if the title was found
					if (!found) {
						System.out.println("<" + id + "> was not found in the games table");
					}
					
					return result;
				} finally {
					DBUtil.closeQuietly(resultSet);
					DBUtil.closeQuietly(stmt);
				}
			}
		});
	}
	
	
	// transaction that retrieves a list of Books with their Authors, given User's last name
	@Override
	public List<Pair<User, Game>> findAuthorAndBookByAuthorLastName(final String lastName) {
		return executeTransaction(new Transaction<List<Pair<User,Game>>>() {
			@Override
			public List<Pair<User, Game>> execute(Connection conn) throws SQLException {
				PreparedStatement stmt = null;
				ResultSet resultSet = null;

				// try to retrieve Authors and Books based on User's last name, passed into query
				try {
					stmt = conn.prepareStatement(
							"select users.*, games.* " +
							"  from  users, games, bookAuthors " +
							"  where users.lastname = ? " +
							"    and users.author_id = bookAuthors.author_id " +
							"    and games.book_id     = bookAuthors.book_id "   +
							"  order by games.title asc, games.published asc"
					);
					stmt.setString(1, lastName);
					
					// establish the list of (User, Game) Pairs to receive the result
					List<Pair<User, Game>> result = new ArrayList<Pair<User,Game>>();
					
					// execute the query, get the results, and assemble them in an ArrayLsit
					resultSet = stmt.executeQuery();
					while (resultSet.next()) {
						User user = new User();
						loadAuthor(user, resultSet, 1);
						Game game = new Game();
						loadBook(game, resultSet, 4);
						
						result.add(new Pair<User, Game>(user, game));
					}
					
					return result;
				} finally {
					DBUtil.closeQuietly(resultSet);
					DBUtil.closeQuietly(stmt);
				}
			}
		});
	}
	
	
	// transaction that retrieves all Books in Library, with their respective Authors
	@Override
	public List<Pair<User, Game>> findAllGamesWithUsers() {
		return executeTransaction(new Transaction<List<Pair<User,Game>>>() {
			@Override
			public List<Pair<User, Game>> execute(Connection conn) throws SQLException {
				PreparedStatement stmt = null;
				ResultSet resultSet = null;
				
				try {
					stmt = conn.prepareStatement(
							"select users.*, games.* " +
							"  from users, games, gameUsers " +
							"  where users.user_id = gameUsers.user_id " +
							"    and games.game_id     = gameUsers.game_id "
					);
					
					List<Pair<User, Game>> result = new ArrayList<Pair<User,Game>>();
					
					resultSet = stmt.executeQuery();
					
					// for testing that a result was returned
					Boolean found = false;
					
					while (resultSet.next()) {
						found = true;
						
						User user = new User();
						loadAuthor(user, resultSet, 1);
						Game game = new Game();
						loadBook(game, resultSet, 4);
						
						result.add(new Pair<User, Game>(user, game));
					}
					
					// check if any games were found
					if (!found) {
						System.out.println("No games were found in the database");
					}
					
					return result;
				} finally {
					DBUtil.closeQuietly(resultSet);
					DBUtil.closeQuietly(stmt);
				}
			}
		});
	}	
	
	
	// transaction that retrieves all Authors in Library
	@Override
	public List<User> findAllUsers() {
		return executeTransaction(new Transaction<List<User>>() {
			@Override
			public List<User> execute(Connection conn) throws SQLException {
				PreparedStatement stmt = null;
				ResultSet resultSet = null;
				
				try {
					stmt = conn.prepareStatement(
							"select * from users "
					);
					
					List<User> result = new ArrayList<User>();
					
					resultSet = stmt.executeQuery();
					
					// for testing that a result was returned
					Boolean found = false;
					
					while (resultSet.next()) {
						found = true;
						
						User user = new User();
						loadAuthor(user, resultSet, 1);
						
						result.add(user);
					}
					
					// check if any users were found
					if (!found) {
						System.out.println("No users were found in the database");
					}
					
					return result;
				} finally {
					DBUtil.closeQuietly(resultSet);
					DBUtil.closeQuietly(stmt);
				}
			}
		});
	}
	
	
	// transaction that inserts new Game into the Books table
	// also first inserts new User into Authors table, if necessary
	// and then inserts entry into BookAuthors junction table
	@Override
	public Integer insertNewUserIntoUserTable(final String username, final String password) {
		return executeTransaction(new Transaction<Integer>() {
			@Override
			public Integer execute(Connection conn) throws SQLException {
				PreparedStatement stmt1 = null;
				PreparedStatement stmt2 = null;
				PreparedStatement stmt3 = null;
				PreparedStatement stmt4 = null;
				PreparedStatement stmt5 = null;
				PreparedStatement stmt6 = null;				
				
				ResultSet resultSet1 = null;
				ResultSet resultSet3 = null;
				ResultSet resultSet5 = null;				
				
				// for saving author ID and book ID
				Integer user_id = -1;

				// try to retrieve user_id (if it exists) from DB, for User's info passed into query
				try {
					stmt1 = conn.prepareStatement(
							"select user_id from users " +
							"  where username = ? and password = ? "
					);
					stmt1.setString(1, username);
					stmt1.setString(2, password);
					
					// execute the query, get the result
					resultSet1 = stmt1.executeQuery();

					
					// if User was found then save author_id					
					if (resultSet1.next())
					{
						user_id = resultSet1.getInt(1);
						System.out.println("User <" + username + ", " + password + "> found with ID: " + user_id);						
					}
					else
					{
						System.out.println("User <" + username + ", " + password + "> not found");
				
						// if the User is new, insert new User into Authors table
						if (user_id <= 0) {
							// prepare SQL insert statement to add User to Authors table
							stmt2 = conn.prepareStatement(
									"insert into users (password, username) " +
									"  values(?, ?) "
							);
							stmt2.setString(1, password);
							stmt2.setString(2, username);
							
							// execute the update
							stmt2.executeUpdate();
							
							System.out.println("New User <" + username + ", " + password + "> inserted in Users table");						
						
							
						}
					}
					
					/*
					// now insert new Game into Books table
					// prepare SQL insert statement to add new Game to Books table
					stmt4 = conn.prepareStatement(
							"insert into games (title, isbn, published) " +
							"  values(?, ?, ?) "
					);
					stmt4.setString(1, title);
					stmt4.setString(2, isbn);
					stmt4.setInt(3, published);
					
					// execute the update
					stmt4.executeUpdate();
					
					System.out.println("New book <" + title + "> inserted into Books table");					

					// now retrieve book_id for new Game, so that we can set up gameUser entry
					// and return the book_id, which the DB auto-generates
					// prepare SQL statement to retrieve book_id for new Game
					stmt5 = conn.prepareStatement(
							"select book_id from games " +
							"  where title = ? and isbn = ? and published = ? "
									
					);
					stmt5.setString(1, title);
					stmt5.setString(2, isbn);
					stmt5.setInt(3, published);

					// execute the query
					resultSet5 = stmt5.executeQuery();
					
					// get the result - there had better be one
					if (resultSet5.next())
					{
						book_id = resultSet5.getInt(1);
						System.out.println("New book <" + title + "> ID: " + book_id);						
					}
					else	// really should throw an exception here - the new book should have been inserted, but we didn't find it
					{
						System.out.println("New book <" + title + "> not found in Books table (ID: " + book_id);
					}
					
					// now that we have all the information, insert entry into BookAuthors table
					// which is the junction table for Books and Authors
					// prepare SQL insert statement to add new Game to Books table
					stmt6 = conn.prepareStatement(
							"insert into bookAuthors (book_id, author_id) " +
							"  values(?, ?) "
					);
					stmt6.setInt(1, book_id);
					stmt6.setInt(2, author_id);
					
					// execute the update
					stmt6.executeUpdate();
					
					System.out.println("New entry for book ID <" + book_id + "> and author ID <" + author_id + "> inserted into BookAuthors junction table");						
					
					System.out.println("New book <" + title + "> inserted into Books table");					
					*/
					return user_id;
					
				} finally {
					DBUtil.closeQuietly(resultSet1);
					DBUtil.closeQuietly(stmt1);
					DBUtil.closeQuietly(stmt2);					
					DBUtil.closeQuietly(resultSet3);
					DBUtil.closeQuietly(stmt3);					
					DBUtil.closeQuietly(stmt4);
					DBUtil.closeQuietly(resultSet5);
					DBUtil.closeQuietly(stmt5);
					DBUtil.closeQuietly(stmt6);
				}
			}
		});
	}
	
	
	// transaction that deletes Game (and possibly its User) from Library
	@Override
	public List<User> removeBookByTitle(final String title) {
		return executeTransaction(new Transaction<List<User>>() {
			@Override
			public List<User> execute(Connection conn) throws SQLException {
				PreparedStatement stmt1 = null;
				PreparedStatement stmt2 = null;
				PreparedStatement stmt3 = null;
				PreparedStatement stmt4 = null;
				PreparedStatement stmt5 = null;
				PreparedStatement stmt6 = null;							
				
				ResultSet resultSet1    = null;			
				ResultSet resultSet2    = null;
				ResultSet resultSet5    = null;
				
				try {
					// first get the User(s) of the Game to be deleted
					// just in case it's the only Game by this User
					// in which case, we should also remove the User(s)
					stmt1 = conn.prepareStatement(
							"select users.* " +
							"  from  users, games, bookAuthors " +
							"  where games.title = ? " +
							"    and users.author_id = bookAuthors.author_id " +
							"    and games.book_id     = bookAuthors.book_id"
					);
					
					// get the Game's User(s)
					stmt1.setString(1, title);
					resultSet1 = stmt1.executeQuery();
					
					// assemble list of Authors from query
					List<User> users = new ArrayList<User>();					
				
					while (resultSet1.next()) {
						User user = new User();
						loadAuthor(user, resultSet1, 1);
						users.add(user);
					}
					
					// check if any Authors were found
					// this shouldn't be necessary, there should not be a Game in the DB without an User
					if (users.size() == 0) {
						System.out.println("No author was found for title <" + title + "> in the database");
					}
										
					// now get the Game(s) to be deleted
					// we will need the book_id to remove associated entries in BookAuthors (junction table)
				
					stmt2 = conn.prepareStatement(
							"select games.* " +
							"  from  games " +
							"  where games.title = ? "
					);
					
					// get the Game(s)
					stmt2.setString(1, title);
					resultSet2 = stmt2.executeQuery();
					
					// assemble list of Books from query
					List<Game> games = new ArrayList<Game>();					
				
					while (resultSet2.next()) {
						Game game = new Game();
						loadBook(game, resultSet2, 1);
						games.add(game);
					}
					
					// first delete entries in BookAuthors junction table
					// can't delete entries in Books or Authors tables while they have foreign keys in junction table
					// prepare to delete the junction table entries (bookAuthors)
					stmt3 = conn.prepareStatement(
							"delete from bookAuthors " +
							"  where book_id = ? "
					);
					
					// delete the junction table entries from the DB for this title
					// this works if there are not multiple games with the same name
					stmt3.setInt(1, games.get(0).getGameId());
					stmt3.executeUpdate();
					
					System.out.println("Deleted junction table entries for book(s) <" + title + "> from DB");									
					
					// now delete entries in Books table for this title
					stmt4 = conn.prepareStatement(
							"delete from games " +
							"  where title = ? "
					);
					
					// delete the Game entries from the DB for this title
					stmt4.setString(1, title);
					stmt4.executeUpdate();
					
					System.out.println("Deleted book(s) with title <" + title + "> from DB");									
					
					// now check if the User(s) have any Books remaining in the DB
					// only need to check if there are any entries in junction table that have this author ID
					for (int i = 0; i < users.size(); i++) {
						// prepare to find Books for this User
						stmt5 = conn.prepareStatement(
								"select games.book_id from games, bookAuthors " +
								"  where bookAuthors.author_id = ? "
						);
						
						// retrieve any remaining games for this User
						stmt5.setInt(1, games.get(i).getGameId());
						resultSet5 = stmt5.executeQuery();						

						// if nothing returned, then delete User
						if (!resultSet5.next()) {
							stmt6 = conn.prepareStatement(
								"delete from users " +
								"  where author_id = ?"
							);
							
							// delete the User from DB
							stmt6.setInt(1, users.get(i).getUserId());
							stmt6.executeUpdate();
							
							System.out.println("Deleted author <" + users.get(i).getPassword() + ", " + users.get(i).getUsername() + "> from DB");
							
							// we're done with this, so close it, since we might have more to do
							DBUtil.closeQuietly(stmt6);
						}
						
						// we're done with this, so close it since we might have more to do
						DBUtil.closeQuietly(resultSet5);
						DBUtil.closeQuietly(stmt5);
					}
					return users;
				} finally {
					DBUtil.closeQuietly(resultSet1);
					DBUtil.closeQuietly(resultSet2);
					
					DBUtil.closeQuietly(stmt1);
					DBUtil.closeQuietly(stmt2);
					DBUtil.closeQuietly(stmt3);					
					DBUtil.closeQuietly(stmt4);					
				}
			}
		});
	}
	
	
	// wrapper SQL transaction function that calls actual transaction function (which has retries)
	public<ResultType> ResultType executeTransaction(Transaction<ResultType> txn) {
		try {
			return doExecuteTransaction(txn);
		} catch (SQLException e) {
			throw new PersistenceException("Transaction failed", e);
		}
	}
	
	// SQL transaction function which retries the transaction MAX_ATTEMPTS times before failing
	public<ResultType> ResultType doExecuteTransaction(Transaction<ResultType> txn) throws SQLException {
		Connection conn = connect();
		
		try {
			int numAttempts = 0;
			boolean success = false;
			ResultType result = null;
			
			while (!success && numAttempts < MAX_ATTEMPTS) {
				try {
					result = txn.execute(conn);
					conn.commit();
					success = true;
				} catch (SQLException e) {
					if (e.getSQLState() != null && e.getSQLState().equals("41000")) {
						// Deadlock: retry (unless max retry count has been reached)
						numAttempts++;
					} else {
						// Some other kind of SQLException
						throw e;
					}
				}
			}
			
			if (!success) {
				throw new SQLException("Transaction failed (too many retries)");
			}
			
			// Success!
			
			return result;
		} finally {
			DBUtil.closeQuietly(conn);
		}
	}

	// TODO: Here is where you name and specify the location of your Derby SQL database
	// TODO: Change it here and in SQLDemo.java under CS320_LibraryExample_Lab06->edu.ycp.cs320.sqldemo
	// TODO: DO NOT PUT THE DB IN THE SAME FOLDER AS YOUR PROJECT - that will cause conflicts later w/Git
	private Connection connect() throws SQLException {
		Connection conn = DriverManager.getConnection("jdbc:derby:C:/Group-Project-DB/Chess.db;create=true");		
		
		// Set autocommit() to false to allow the execution of
		// multiple queries/statements as part of the same transaction.
		conn.setAutoCommit(false);
		
		return conn;
	}
	
	// retrieves User information from query result set
	private void loadAuthor(User user, ResultSet resultSet, int index) throws SQLException {
		user.setUserId(resultSet.getInt(index++));
		user.setPassword(resultSet.getString(index++));
		user.setUsername(resultSet.getString(index++));
	}
	
	// retrieves Game information from query result set
	private void loadBook(Game game, ResultSet resultSet, int index) throws SQLException {
		game.setGameId(resultSet.getInt(index++));
//		book.setAuthorId(resultSet.getInt(index++));  // no longer used
		game.setTurns(resultSet.getString(index++));
		game.setGameOver(false);
	}
	
	// retrieves WrittenBy information from query result set
	private void loadBookAuthors(gameUser gameUser, ResultSet resultSet, int index) throws SQLException {
		gameUser.setGameId(resultSet.getInt(index++));
		gameUser.setUserId(resultSet.getInt(index++));
	}
	
	//  creates the Authors and Books tables
	public void createTables() {
		executeTransaction(new Transaction<Boolean>() {
			@Override
			public Boolean execute(Connection conn) throws SQLException {
				PreparedStatement stmt1 = null;
				PreparedStatement stmt2 = null;
				PreparedStatement stmt3 = null;	
				PreparedStatement stmt4 = null;
			
				try {
					stmt1 = conn.prepareStatement(
						"create table users (" +
						"	user_id integer primary key " +
						"		generated always as identity (start with 1, increment by 1), " +									
						"	username varchar(40)," +
						"	password varchar(40)" +
						")"
					);	
					stmt1.executeUpdate();
					
					System.out.println("Users table created");
					
					stmt2 = conn.prepareStatement(
							"create table games (" +
							"	game_id integer primary key " +
							"		generated always as identity (start with 1, increment by 1), " +
//							"	author_id integer constraint author_id references users, " +  	// this is now in the BookAuthors table
							"	turns varchar(70)," +
							"   gameOver boolean" +
							")"
					);
					stmt2.executeUpdate();
					
					System.out.println("Games table created");					
					
					stmt3 = conn.prepareStatement(
							"create table gameUsers (" +
							"	game_id   integer constraint game_id references games, " +
							"	user_id integer constraint user_id references users " +
							")"
					);
					stmt3.executeUpdate();
					
					System.out.println("gameUsers table created");
					
					stmt4 = conn.prepareStatement(
							"create table Pieces (" +
							"	color boolean, " +
							"	game_id varchar(70),	" +
							"	PosX varchar(70), " +
							"	PosY varchar(70), " +
							"	hasMoved boolean, " +
							"	type varchar(70), " +
							"	captured boolean" +
							")"
					);
					stmt4.executeUpdate();
					
					System.out.println("Pieces table created");	
										
					return true;
				} finally {
					DBUtil.closeQuietly(stmt1);
					DBUtil.closeQuietly(stmt2);
					DBUtil.closeQuietly(stmt3);
					DBUtil.closeQuietly(stmt4);
				}
			}
		});
	}
	
	// loads data retrieved from CSV files into DB tables in batch mode
	public void loadInitialData() {
		executeTransaction(new Transaction<Boolean>() {
			@Override
			public Boolean execute(Connection conn) throws SQLException {
				List<User> userList;
				List<Game> gameList;
				List<gameUser> gameUserList;
				List<Piece> PieceList;
				
				try {
					userList     = InitialData.getUsers();
					gameList       = InitialData.getGames();
					gameUserList = InitialData.getGameUsers();		
					PieceList = InitialData.getPieces();	
				} catch (IOException e) {
					throw new SQLException("Couldn't read initial data", e);
				}

				PreparedStatement insertUser     = null;
				PreparedStatement insertGame       = null;
				PreparedStatement insertGameUser = null;
				PreparedStatement insertPiece = null;

				try {
					// must completely populate Authors table before populating BookAuthors table because of primary keys
					insertUser = conn.prepareStatement("insert into users (password, username) values (?, ?)");
					for (User user : userList) {
//						insertAuthor.setInt(1, author.getAuthorId());	// auto-generated primary key, don't insert this
						insertUser.setString(1, user.getPassword());
						insertUser.setString(2, user.getUsername());
						insertUser.addBatch();
					}
					insertUser.executeBatch();
					
					System.out.println("Users table populated");
					
					// must completely populate Books table before populating BookAuthors table because of primary keys
					insertGame = conn.prepareStatement("insert into games (turns, gameOver) values (?, ?)");
					for (Game game : gameList) {
//						insertBook.setInt(1, book.getBookId());		// auto-generated primary key, don't insert this
//						insertBook.setInt(1, book.getAuthorId());	// this is now in the BookAuthors table
						//insertBook.setInt(1, game.getGameId());
						insertGame.setString(1, game.getTurns());
						insertGame.setBoolean(2, game.getGameOver());
						insertGame.addBatch();
					}
					insertGame.executeBatch();
					
					System.out.println("Games table populated");					
					
					// must wait until all Books and all Authors are inserted into tables before creating gameUser table
					// since this table consists entirely of foreign keys, with constraints applied
					insertGameUser = conn.prepareStatement("insert into gameUsers (game_id, user_id) values (?, ?)");
					for (gameUser gameUser : gameUserList) {
						insertGameUser.setInt(1, gameUser.getGameId());
						insertGameUser.setInt(2, gameUser.getUserId());
						insertGameUser.addBatch();
					}
					insertGameUser.executeBatch();	
					
					System.out.println("GameUsers table populated");	
					
					insertPiece = conn.prepareStatement("insert into Pieces (color, game_id, PosX, PosY, hasMoved, type, captured ) values (?, ?, ?, ?, ?, ?, ?)");
					for (Piece piece : PieceList) {
						insertPiece.setBoolean(1, piece.getColor());
						insertPiece.setInt(2, piece.getGameId());
						insertPiece.setInt(3, piece.getPosX());
						insertPiece.setInt(4, piece.getPosY());
						insertPiece.setBoolean(5, piece.getHasMoved());
						insertPiece.setString(6, piece.getType());
						insertPiece.setBoolean(7, piece.getCaptured());
						insertPiece.addBatch();
					}
					insertPiece.executeBatch();	
					
					System.out.println("Pieces table populated");	
					
					return true;
				} finally {
					DBUtil.closeQuietly(insertGame);
					DBUtil.closeQuietly(insertUser);
					DBUtil.closeQuietly(insertGameUser);
					DBUtil.closeQuietly(insertPiece);
				}
			}
		});
	}
	
	// The main method creates the database tables and loads the initial data.
	public static void main(String[] args) throws IOException {
		System.out.println("Creating tables...");
		DerbyDatabase db = new DerbyDatabase();
		db.createTables();
		
		System.out.println("Loading initial data...");
		db.loadInitialData();
		
		System.out.println("Chess DB successfully initialized!");
	}
}
