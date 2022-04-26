package edu.ycp.cs320.chess.controller;

import edu.ycp.cs320.chess.model.ChessUser;
import edu.ycp.cs320.gamesDB.model.User;
import edu.ycp.cs320.gamesDB.persist.DatabaseProvider;
import edu.ycp.cs320.gamesDB.persist.DerbyDatabase;
import edu.ycp.cs320.gamesDB.persist.IDatabase;

import java.util.List;

public class StatsController {

	private IDatabase db = null;

	public StatsController() {
		
		// creating DB instance here
		DatabaseProvider.setInstance(new DerbyDatabase());
		db = DatabaseProvider.getInstance();		
	}

	public User findUserbyUsername(String username) {
		
		// insert new book (and possibly new author) into DB
		List<User> userList = db.findUserbyUsername(username);
		User foundUser = null;
		if (userList.isEmpty()) {
			return foundUser;
		}
		else {
			
			for (User user : userList) {
				System.out.println(user.getUsername() + ", " + user.getPassword() + ", " + user.getRank() + ", " + user.getWins() + ", " + user.getLosses());
				foundUser = user;
			}
			return foundUser;
		}
	}
	
public void updateStats(String username, int newWin, int newLose) {
		
		IDatabase db = DatabaseProvider.getInstance();
		Integer user_id = db.updateStatsByUser(username, newWin, newLose);
		
		if (user_id == -1) {
			System.out.println("User not found");
		}
		else {
			System.out.println("Stats updated for user ID: " + user_id);
		}
	}
}
