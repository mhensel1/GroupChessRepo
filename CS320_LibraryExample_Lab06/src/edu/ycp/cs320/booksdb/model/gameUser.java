package edu.ycp.cs320.booksdb.model;

public class gameUser {

	private int gameId;
	private int userId;
	
	public gameUser() {
		
	}
	
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	
	public int getGameId() {
		return gameId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getUserId() {
		return userId;
	}
}