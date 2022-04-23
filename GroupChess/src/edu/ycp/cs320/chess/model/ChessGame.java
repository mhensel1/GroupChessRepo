package edu.ycp.cs320.chess.model;

import java.util.List;

// model class for ChessGame

public class ChessGame {
    private int[] players;
    private int turnCounter;
	private int lobbyCode;
    private ChessPlayer[] chessPlayers;
    private ChessBoard board;
    private ChessPlayer currentTurn;
    private boolean gameOver;
  
    public ChessGame(ChessPlayer WhitePlayer, ChessPlayer BlackPlayer)
    {
        chessPlayers[0] = WhitePlayer;
        chessPlayers[1] = BlackPlayer;
        board.createBoard();
  
        if (WhitePlayer.getColor() == true) {
            this.currentTurn = WhitePlayer;
        }
        else {
            this.currentTurn = BlackPlayer;
        }
        
    }
  
    public boolean getGameOver() {
        return this.getGameOver();
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