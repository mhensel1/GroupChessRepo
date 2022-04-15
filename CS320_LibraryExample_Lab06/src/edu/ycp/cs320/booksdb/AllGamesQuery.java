package edu.ycp.cs320.booksdb;

import java.util.List;
import java.util.Scanner;

import edu.ycp.cs320.booksdb.model.User;
import edu.ycp.cs320.booksdb.model.Game;
import edu.ycp.cs320.booksdb.model.Pair;
import edu.ycp.cs320.booksdb.persist.DatabaseProvider;
import edu.ycp.cs320.booksdb.persist.IDatabase;

public class AllGamesQuery {
	public static void main(String[] args) throws Exception {
		Scanner keyboard = new Scanner(System.in);

		// Create the default IDatabase instance
		InitDatabase.init(keyboard);
		
		// get the DB instance and execute transaction
		IDatabase db = DatabaseProvider.getInstance();
		List<Pair<User, Game>> gameUsersList = db.findAllGamesWithUsers();
		
		// check if anything was returned and output the list
		if (gameUsersList.isEmpty()) {
			System.out.println("There are no games in the database");
		}
		else {
			for (Pair<User, Game> authorBook : gameUsersList) {
				User user = authorBook.getLeft();
				Game game = authorBook.getRight();
				System.out.println( "Game Id: " + game.getGameId() + ", Current Turn: " + game.getTurns() + ", Game Over: " + game.getGameOver() + ", User ID:" + user.getUserId()+ ", Username: "+ user.getPassword());
			}
		}
	}
}
