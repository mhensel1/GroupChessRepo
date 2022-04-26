package edu.ycp.cs320.chess.controller;

import edu.ycp.cs320.gamesDB.persist.DatabaseProvider;
import edu.ycp.cs320.gamesDB.persist.DerbyDatabase;
import edu.ycp.cs320.gamesDB.persist.IDatabase;

public class CreateAccountController {

	private IDatabase db = null;

	public CreateAccountController() {
		
		// creating DB instance here
		DatabaseProvider.setInstance(new DerbyDatabase());
		db = DatabaseProvider.getInstance();		
	}

	public boolean insertUserIntoTable(String username, String password) {
		
		// insert new book (and possibly new author) into DB
		Integer user_id = db.insertNewUserIntoUserTable(username, password);

		// check if the insertion succeeded
		if (user_id > 0)
		{
			System.out.println("New User (ID: " + user_id + ") successfully added to Users table: <" + username + ">");
			
			return true;
		}
		else
		{
			return false;
		}
	}
}
