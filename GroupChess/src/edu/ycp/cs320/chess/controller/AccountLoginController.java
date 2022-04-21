package edu.ycp.cs320.chess.controller;

import edu.ycp.cs320.booksdb.persist.DatabaseProvider;
import edu.ycp.cs320.booksdb.persist.DerbyDatabase;
import edu.ycp.cs320.booksdb.persist.IDatabase;
import edu.ycp.cs320.chess.model.ChessUser;
import edu.ycp.cs320.booksdb.model.User;
import java.util.List;

public class AccountLoginController {

	private IDatabase db = null;

	public AccountLoginController() {
		
		// creating DB instance here
		DatabaseProvider.setInstance(new DerbyDatabase());
		db = DatabaseProvider.getInstance();		
	}

	public User findUserByUserByNameAndPass(String username, String password) {
		
		// insert new book (and possibly new author) into DB
		List<User> userList = db.findUserByUserByNameAndPass(username, password);
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
}
