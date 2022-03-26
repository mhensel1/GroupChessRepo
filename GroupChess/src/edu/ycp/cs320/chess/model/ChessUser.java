package edu.ycp.cs320.chess.model;
import java.util.ArrayList;

// model class for ChessUser

public class ChessUser {
	private String user, pass;
	private ArrayList<String> users, passwords;
	private double rank, userID;
	
	public ChessUser() {
		users = new ArrayList<String>();
		users.add("admin");
		users.add("mhensel");
		passwords = new ArrayList<String>();
		passwords.add("chess");
		passwords.add("pass");
	}
	
	public void setUser(String username) {
		this.user = username;
	}
	
	public String getUser() {
		return user;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getPass() {
		return pass;
	}
	
	public void setUsersList(ArrayList<String> usernames) {
		this.users = usernames;
	}
	
	public ArrayList<String> getUsersList(){
		return users;
	}
	
	public ArrayList<String> getPassList(){
		return passwords;
	}
	
	public void setRank(double userRank) {
		this.rank = userRank;
	}
	
	public double getRank() {
		return rank;
	}
	
	public void setID(double id) {
		this.userID = id;
	}
	
	public double getID() {
		return userID;
	}
	
	public void forfeit() {
		rank -=1;
		//game.close game
	}
	
	public void login() {
		users.add(user);
		passwords.add(pass);
	}
}