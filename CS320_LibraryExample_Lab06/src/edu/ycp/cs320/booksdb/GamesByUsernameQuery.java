package edu.ycp.cs320.booksdb;

import java.util.List;
import java.util.Scanner;

import edu.ycp.cs320.booksdb.model.User;
import edu.ycp.cs320.booksdb.model.Game;
import edu.ycp.cs320.booksdb.model.Pair;
import edu.ycp.cs320.booksdb.persist.DatabaseProvider;
import edu.ycp.cs320.booksdb.persist.IDatabase;

public class GamesByUsernameQuery {
	public static void main(String[] args) throws Exception {
		
		Scanner keyboard = new Scanner(System.in);

		// Create the default IDatabase instance
		InitDatabase.init(keyboard);
		
		System.out.print("Enter an author's last name: ");
		String userName = keyboard.nextLine();
		
		IDatabase db = DatabaseProvider.getInstance();
		List<Pair<User, Game>> userGamesList = db.findAuthorAndBookByAuthorLastName(userName);
		if (userGamesList.isEmpty()) {
			System.out.println("No games found for author <" + userName + ">");
		}
		else {
			for (Pair<User, Game> authorBook : userGamesList) {
				User user = authorBook.getLeft();
				Game game = authorBook.getRight();
				System.out.println(user.getUserId() + "," + user.getUsername() + "," + game.getGameId() + "," + game.getGameOver());
			}			
		}

	}
}