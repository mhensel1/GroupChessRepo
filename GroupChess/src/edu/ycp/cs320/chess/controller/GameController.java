package edu.ycp.cs320.chess.controller;

import edu.ycp.cs320.chess.model.ChessGame;
import edu.ycp.cs320.chess.model.ChessPiece;
import edu.ycp.cs320.gamesDB.persist.DatabaseProvider;
import edu.ycp.cs320.gamesDB.persist.DerbyDatabase;
import edu.ycp.cs320.gamesDB.persist.IDatabase;
import edu.ycp.cs320.chess.model.BoardSpace;
import edu.ycp.cs320.chess.model.ChessBoard;
import edu.ycp.cs320.gamesDB.model.Pair;
import java.util.List;
import java.util.ArrayList;
import edu.ycp.cs320.gamesDB.model.Piece;

public class GameController {
	private ChessGame Gamemodel;
	private ChessBoard Boardmodel;

	public void setGameModel(ChessGame model) {
		this.Gamemodel = model;
	}
	private BoardSpace start;
	private BoardSpace dest;
	
	public GameController() {
			
	}
	
    public void setstart(int x, int y) {
        this.start = Boardmodel.getSpace(x, y);
    }
    
    public ChessPiece getstart() {
        return start.getPiece();
    }
    
    public void setdestination(int x, int y) {
        this.dest = Boardmodel.getSpace(x, y);
    }
    
    public BoardSpace getDest() {
        return dest;
    }
	
	public void move() {
		dest.setPiece(start.getPiece());
		System.out.println(dest.getPiece());
		System.out.println(start.getPiece());
		start.setPiece(null);
	}
	
	
	public void setBoardModel(ChessBoard model) {
		this.Boardmodel = model;
	}

	
	public void startGame() {
		this.Gamemodel.setLobbyCode(1);
		this.Gamemodel.setTurncounter(0);
	}
	
	public void createBoard() {
		this.Boardmodel.createBoard();
		System.out.println("Game controller create board");
	}
	

	
	
}