package edu.ycp.cs320.booksdb;

import java.util.List;
import java.util.Scanner;

import edu.ycp.cs320.booksdb.model.User;
import edu.ycp.cs320.booksdb.model.Game;
import edu.ycp.cs320.booksdb.model.Pair;
import edu.ycp.cs320.booksdb.persist.DatabaseProvider;
import edu.ycp.cs320.booksdb.persist.IDatabase;

public class GameOverQuery {
	public static void main(String[] args) throws Exception {
		Scanner keyboard = new Scanner(System.in);

		// Create the default IDatabase instance
		InitDatabase.init(keyboard);
		
		System.out.print("Enter a GameID: ");
		int Id = Integer.parseInt(keyboard.nextLine());
		
		// get the DB instance and execute transaction
		IDatabase db = DatabaseProvider.getInstance();
		List<Pair<User, Game>> userGameList = db.findUserAndGameByID(Id);
		
		// check if anything was returned and output the list
		if (userGameList.isEmpty()) {
			System.out.println("No games found with title <" + Id + ">");
		}
		else {
			for (Pair<User, Game> authorBook : userGameList) {
				User user = authorBook.getLeft();
				Game game = authorBook.getRight();
				System.out.println(game.getGameOver());
			}
		}
	}
}
