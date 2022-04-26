package edu.ycp.cs320.chess.controller;

import edu.ycp.cs320.chess.model.ChessGame;
import edu.ycp.cs320.chess.model.ChessPiece;
import edu.ycp.cs320.gamesDB.persist.DatabaseProvider;
import edu.ycp.cs320.gamesDB.persist.IDatabase;
import edu.ycp.cs320.chess.model.BoardSpace;
import edu.ycp.cs320.chess.model.ChessBoard;
import edu.ycp.cs320.gamesDB.model.Pair;
import java.util.List;
import edu.ycp.cs320.gamesDB.model.Piece;

public class GameController {
	private ChessGame Gamemodel;
	private ChessBoard Boardmodel;

	public void setGameModel(ChessGame model) {
		this.Gamemodel = model;
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