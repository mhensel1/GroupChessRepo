package edu.ycp.cs320.booksdb.model;

public class Game {
	private int gameId;
	private String turns;
	private boolean gameOver;
	
	public Game() {
		
	}
	
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	
	public int getGameId() {
		return gameId;
	}
	
	public void setTurns(String string) {
		this.turns = string;
	}
	
	public String getTurns() {
		return turns;
	}
	
	public void setGameOver(boolean gameOver) {
		this.gameOver = gameOver;
	}
	
	public boolean getGameOver() {
		return gameOver;
	}
}
