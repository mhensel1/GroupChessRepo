package edu.ycp.cs320.booksdb.persist;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import edu.ycp.cs320.booksdb.model.User;
import edu.ycp.cs320.booksdb.model.Game;
import edu.ycp.cs320.booksdb.model.Pair;

public class DerbyDatabaseTests {

	private IDatabase db = null;
	
	ArrayList<User> users = null;
	ArrayList<Game>   games   = null;
	List<Pair<User, Game>> bookAuthorList = null;
	List<Pair<User, Game>> authorBookList = null;	
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		// creating DB instance here
		DatabaseProvider.setInstance(new DerbyDatabase());
		db = DatabaseProvider.getInstance();		
		
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testFindAuthorAndBookByTitle() {
		System.out.println("\n*** Testing findAuthorAndBookByTitle ***");
		
		String title = "A Briefer History of Time";

		// get the list of (User, Game) pairs from DB
		authorBookList = db.findAuthorAndBookByTitle(title);
		
		// NOTE: this is a simple test to check if no results were found in the DB
		if (authorBookList.isEmpty()) {
			System.out.println("No book found in library with title <" + title + ">");
			fail("No book with title <" + title + "> returned from Library DB");
		}
		// NOTE: assembling the results into User and Game lists so that they could be
		//       inspected for correct content - well-formed objects with correct content
		else {			
			users = new ArrayList<User>();
			for (Pair<User, Game> authorBook : authorBookList) {
				User user = authorBook.getLeft();
				Game   game   = authorBook.getRight();
				users.add(user);
				System.out.println(user.getLastname() + "," + user.getFirstname() + ", " + game.getTitle() + "," + game.getIsbn());
			}			
		}
	}

	@Test
	public void testFindAuthorAndBookByAuthorLastName() {
		System.out.println("\n*** Testing findAuthorAndBooksByAuthorLastName ***");

		String lastName = "Hawking";
		
		// get the list of (User, Game) pairs from DB
		authorBookList = db.findAuthorAndBookByAuthorLastName(lastName);
		
		// NOTE: this is a simple test to check if no results were found in the DB
		if (authorBookList.isEmpty()) {
			System.out.println("No games found for author <" + lastName + ">");
			fail("No games for author <" + lastName + "> returned from Library DB");
		}
		// NOTE: assembling the results into User and Game lists so that they could be
		//       inspected for correct content - well-formed objects with correct content
		else {
			games = new ArrayList<Game>();
			for (Pair<User, Game> authorBook : authorBookList) {
				User user = authorBook.getLeft();
				Game game = authorBook.getRight();
				games.add(game);
				System.out.println(user.getLastname() + "," + user.getFirstname() + "," + game.getTitle() + "," + game.getIsbn());
			}			
		}
	}

	@Test
	public void testFindAllBooksWithAuthors() {
		System.out.println("\n*** Testing findAllBooksWithAuthors ***");

		// get the list of (User, Game) pairs from DB
		bookAuthorList = db.findAllBooksWithAuthors();
		
		// NOTE: this is a simple test to check if no results were found in the DB
		if (bookAuthorList.isEmpty()) {
			System.out.println("No games in database");
			fail("No games returned from Library DB");
		}
		// NOTE: assembling the results into User and Game lists so that they could be
		//       inspected for correct content - well-formed objects with correct content
		else {
			games = new ArrayList<Game>();
			for (Pair<User, Game> authorBook : bookAuthorList) {
				User user = authorBook.getLeft();
				Game game = authorBook.getRight();
				games.add(game);
				System.out.println(game.getTitle() + ", " + game.getIsbn() + ", " + user.getLastname() + ", " + user.getFirstname());
			}			
		}
	}

	@Test
	public void testFindAllAuthors() {

		System.out.println("\n*** Testing findAllAuthors ***");

		// get the list of (User, Game) pairs from DB
		List<User> authorList = db.findAllAuthors();

		// NOTE: this is a simple test to check if no results were found in the DB
		if (authorList.isEmpty()) {
			System.out.println("No users found in library");
			fail("No users returned from Library DB");
		}
		// NOTE: assembling the results into User and Game lists so that they could be
		//       inspected for correct content - well-formed objects with correct content
		else {
			users = new ArrayList<User>();
			for (User user : authorList) {
				users.add(user);
				System.out.println(user.getLastname() + ", " + user.getFirstname());
			}			
		}
	}

	@Test
	public void testInsertBookIntoBooksTable() {
		System.out.println("\n*** Testing insertBookIntoBooksTable ***");

		String title     = "Wired for War";
		String isbn      = "0-143-11684-3";
		int    published = 2009;
		String lastName  = "Singer";
		String firstName = "P.J.";
  
				
		// insert new book (and possibly new author) into DB
		Integer book_id = db.insertBookIntoBooksTable(title, isbn, published, lastName, firstName);

		// check the return value - should be a book_id > 0
		if (book_id > 0)
		{
			// try to retrieve the book and author from the DB
			// get the list of (User, Game) pairs from DB
			authorBookList = db.findAuthorAndBookByAuthorLastName(lastName);
			
			if (authorBookList.isEmpty()) {
				System.out.println("No games found for author <" + lastName + ">");
				fail("Failed to insert new book <" + title + "> into Library DB");
			}
			// otherwise, the test was successful.  Now remove the book just inserted to return the DB
			// to it's original state, except for using an author_id and a book_id
			else {
				System.out.println("New book (ID: " + book_id + ") successfully added to Books table: <" + title + ">");
				
				// now delete Game (and its User) from DB
				// leaving the DB in its previous state - except that an author_id, and a book_id have been used
				List<User> users = db.removeBookByTitle(title);				
			}
		}
		else
		{
			System.out.println("Failed to insert new book (ID: " + book_id + ") into Books table: <" + title + ">");
			fail("Failed to insert new book <" + title + "> into Library DB");
		}
	}
	

	@Test
	public void testRemoveBookByTitle() {
		System.out.println("\n*** Testing removeBookByTitle ***");
		
		String title     = "Outliers";
		String isbn      = "0-316-01793-0";
		int    published = 2010;		
		String lastName  = "Gladwell";
		String firstName = "Malcolm";
				
		// insert new book (and new author) into DB
		Integer book_id = db.insertBookIntoBooksTable(title, isbn, published, lastName, firstName);
		
		// check to see that insertion was successful before proceeding
		if (book_id > 0) {
			// now delete Game (and its User) from DB
			List<User> users = db.removeBookByTitle(title);
			
			if (users.isEmpty()) {
				System.out.println("Failed to remove User(s) for book with title <" + title + ">");
				fail("No User(s) removed from DB for Game with title <" + title + ">");
			}
			else {
				System.out.println("User <" + users.get(0).getLastname() + ", " + users.get(0).getFirstname() + "> removed from Library DB");
			}					
			
			// get the list of (User, Game) pairs from DB
			authorBookList = db.findAuthorAndBookByTitle(title);
			
			if (authorBookList.isEmpty()) {
				System.out.println("All Books with title <" + title + "> were removed from the Library DB");
			}
			else {
				fail("Game with title <" + title + "> remains in Library DB after delete");			
			}
		}
		else {
			System.out.println("Failed to insert new book (ID: " + book_id + ") into Books table: <" + title + ">");
			fail("Failed to insert new book <" + title + "> into Library DB");			
		}
	}
}
