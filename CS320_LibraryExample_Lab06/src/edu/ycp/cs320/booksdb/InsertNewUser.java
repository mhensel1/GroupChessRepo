package edu.ycp.cs320.booksdb;


import java.util.Scanner;

import edu.ycp.cs320.booksdb.persist.DatabaseProvider;
import edu.ycp.cs320.booksdb.persist.IDatabase;

public class InsertNewUser {
	public static void main(String[] args) throws Exception {
		Scanner keyboard = new Scanner(System.in);

		// Create the default IDatabase instance
		InitDatabase.init(keyboard);
		
		System.out.print("Enter username: ");
		String username = keyboard.nextLine();
		
		System.out.print("Enter password: ");
		String password = keyboard.nextLine();
		
		// get the DB instance and execute the transaction
		IDatabase db = DatabaseProvider.getInstance();
		Integer user_id = db.insertNewUserIntoUserTable(username, password);

		// check if the insertion succeeded
		if (user_id > 0)
		{
			System.out.println("New User (ID: " + user_id + ") successfully added to User table: <" + username + ">");
		}
		else
		{
			System.out.println("Failed to insert new book (ID: " + user_id + ") into Books table: <" + username + ">");			
		}
	}
}
