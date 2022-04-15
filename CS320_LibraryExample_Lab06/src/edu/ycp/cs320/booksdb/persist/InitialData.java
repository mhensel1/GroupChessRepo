package edu.ycp.cs320.booksdb.persist;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import edu.ycp.cs320.booksdb.model.User;
import edu.ycp.cs320.booksdb.model.Game;
import edu.ycp.cs320.booksdb.model.Piece;
import edu.ycp.cs320.booksdb.model.gameUser;

public class InitialData {

	// reads initial User data from CSV file and returns a List of Authors
	public static List<User> getUsers() throws IOException {
		List<User> userList = new ArrayList<User>();
		ReadCSV readUsers = new ReadCSV("users.csv");
		try {
			// auto-generated primary key for users table
			Integer userId = 1;
			while (true) {
				List<String> tuple = readUsers.next();
				if (tuple == null) {
					break;
				}
				Iterator<String> i = tuple.iterator();
				User user = new User();

				// read author ID from CSV file, but don't use it
				// it's there for reference purposes, just make sure that it is correct
				// when setting up the BookAuthors CSV file				
				Integer.parseInt(i.next());
				// auto-generate author ID, instead
				user.setUserId(userId++);				
				user.setPassword(i.next());
				user.setUsername(i.next());
				userList.add(user);
			}
			System.out.println("UserList loaded from CSV file");
			return userList;
		} finally {
			readUsers.close();
		}
	}
	
	// reads initial Game data from CSV file and returns a List of Books
	public static List<Game> getGames() throws IOException {
		List<Game> gameList = new ArrayList<Game>();
		ReadCSV readGames = new ReadCSV("games.csv");
		try {
			// auto-generated primary key for table games
			Integer gameId = 1;
			while (true) {
				List<String> tuple = readGames.next();
				if (tuple == null) {
					break;
				}
				Iterator<String> i = tuple.iterator();
				Game game = new Game();
				
				// read book ID from CSV file, but don't use it
				// it's there for reference purposes, just make sure that it is correct
				// when setting up the BookAuthors CSV file
				Integer.parseInt(i.next());
				// auto-generate book ID, instead
				game.setGameId(gameId++);				
//				book.setAuthorId(Integer.parseInt(i.next()));  // no longer in games table
				game.setTurns(i.next());
				game.setGameOver(Boolean.parseBoolean(i.next()));
				
				gameList.add(game);
			}
			System.out.println("GameList loaded from CSV file");			
			return gameList;
		} finally {
			readGames.close();
		}
	}
	
	// reads initial gameUser data from CSV file and returns a List of BookAuthors
	public static List<gameUser> getGameUsers() throws IOException {
		List<gameUser> gameUserList = new ArrayList<gameUser>();
		ReadCSV readGameUsers = new ReadCSV("gameUsers.csv");
		try {
			while (true) {
				List<String> tuple = readGameUsers.next();
				if (tuple == null) {
					break;
				}
				Iterator<String> i = tuple.iterator();
				gameUser gameUser = new gameUser();
				gameUser.setGameId(Integer.parseInt(i.next()));				
				gameUser.setUserId(Integer.parseInt(i.next()));
				gameUserList.add(gameUser);
			}
			System.out.println("gameUsersList loaded from CSV file");			
			return gameUserList;
		} finally {
			readGameUsers.close();
		}
	}
	
	public static List<Piece> getPieces() throws IOException {
		List<Piece> pieceList = new ArrayList<Piece>();
		ReadCSV readPieces = new ReadCSV("pieces.csv");
		try {
			// auto-generated primary key for users table
			Integer pieceId = 1;
			while (true) {
				List<String> tuple = readPieces.next();
				if (tuple == null) {
					break;
				}
				Iterator<String> i = tuple.iterator();
				Piece piece = new Piece();

				// read author ID from CSV file, but don't use it
				// it's there for reference purposes, just make sure that it is correct
				// when setting up the BookAuthors CSV file				
				//Integer.parseInt(i.next());
				// auto-generate author ID, instead
				//Piece.setUserId(pieceId++);				
				piece.setColor(Boolean.parseBoolean(i.next()));
				piece.setGameId(Integer.parseInt(i.next()));
				piece.setPosX(Integer.parseInt(i.next()));
				piece.setPosY(Integer.parseInt(i.next()));
				piece.setHasMoved(Boolean.parseBoolean(i.next()));
				piece.setType(i.next());
				piece.setCaptured(Boolean.parseBoolean(i.next()));
				pieceList.add(piece);
			}
			System.out.println("Pieces loaded from CSV file");
			return pieceList;
		} finally {
			readPieces.close();
		}
	}
}