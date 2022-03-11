package edu.ycp.cs320.chess.model;
import java.util.ArrayList;

public class ChessUser {
	private String user;
	private ArrayList<String> users;
	private double rank, userID;
	
	public ChessUser() {
	}
	
	public void setUser(String username) {
		this.user = username;
	}
	
	public String getUser() {
		return user;
	}
	
	public void setUsersList(ArrayList<String> usernames) {
		this.users = usernames;
	}
	
	public ArrayList<String> getUsersList(){
		return users;
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
}