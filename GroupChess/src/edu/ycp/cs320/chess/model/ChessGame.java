package edu.ycp.cs320.chess.model;


// model class for ChessGame

public class ChessGame {
	private int turnCounter;
	private String lobbyCode;
	
	public ChessGame() {
		
	}
	
	public void setTurncounter(int turn) {
		this.turnCounter = turn;
	}
	
	public void setLobbyCode(String lCode) {
		this.lobbyCode = lCode;
	}
	
	public int getTurncounter() {
		return turnCounter;
	}
	
	public String getLobbyCode() {
		return lobbyCode;
	}
}
