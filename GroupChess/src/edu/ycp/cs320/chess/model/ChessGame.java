package edu.ycp.cs320.chess.model;

import java.util.List;

// model class for ChessGame

public class ChessGame {
    private int turnCounter;
	private int lobbyCode;
    private boolean gameOver;
    private ChessBoard chessBoard;
    private ChessPlayer player1;
    private ChessPlayer player2;
    private BoardSpace piecetoMove;
    private BoardSpace dest;
  
    public ChessGame()
    {
      
    }
  
    public void setGameBoard(ChessBoard board) {
        this.chessBoard = board;
    }
    
    public ChessBoard getGameBoard(ChessBoard board) {
        return chessBoard;
    }
    
    public boolean getGameOver() {
    	  return gameOver;
    }
  
    public void setGameOver(boolean gameOver) {
        this.gameOver = gameOver;
    }
    
    public void setTurncounter(int turn) {
		this.turnCounter = turn;
	}
	
	public void setLobbyCode(int i) {
		this.lobbyCode = i;
	}
	
	public int getTurncounter() {
		return turnCounter;
	}
	
	public int getLobbyCode() {
		return lobbyCode;
	}
}