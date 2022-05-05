package edu.ycp.cs320.chess.controller;

import edu.ycp.cs320.chess.model.ChessGame;
import edu.ycp.cs320.chess.model.ChessPiece;
import edu.ycp.cs320.gamesDB.persist.DatabaseProvider;
import edu.ycp.cs320.gamesDB.persist.DerbyDatabase;
import edu.ycp.cs320.gamesDB.persist.IDatabase;
import edu.ycp.cs320.chess.model.BoardSpace;
import edu.ycp.cs320.chess.model.ChessBoard;
import edu.ycp.cs320.gamesDB.model.Pair;
import edu.ycp.cs320.gamesDB.model.Game;
import java.util.List;
import java.util.ArrayList;
import edu.ycp.cs320.gamesDB.model.Piece;

public class GameController {
	private ChessGame Gamemodel;
	private ChessBoard Boardmodel;
	private IDatabase db = null;

	public void setGameModel(ChessGame model) {
		this.Gamemodel = model;
	}
	private BoardSpace start;
	private BoardSpace dest;
	
	public GameController() {
		DatabaseProvider.setInstance(new DerbyDatabase());
		db = DatabaseProvider.getInstance();
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
	
    public boolean checkMove() {
    	//validate move func talk to tom
    	return true;
    }
    
	public void move(int oldX, int oldY, int newX, int newY, boolean capture, boolean hasMoved, int game_id) {
		/*dest.setPiece(start.getPiece());
		System.out.println(dest.getPiece());
		System.out.println(start.getPiece());
		start.setPiece(null);*/
		
		Pair<Integer, Integer> newCoords = db.updatePieceInfoByCoords(oldX, oldY, newX, newY, capture, hasMoved, game_id);
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
	
	public Piece findPieceByXY(int x, int y) {
		List<Piece> pieces = db.findPieceByXY(x, y);
		Piece thePiece = null;
		for (Piece piece : pieces) {
			thePiece = piece;
		}
		return thePiece;
	}
	
	public List<Piece> getPiecesByGameID(int game_id){
		List<Piece> pieces = db.findPiecesByGameID(game_id);
		return pieces;
	}
	
	public Game loadGame(int user_id, int game_id) {
		List<Game> games = db.loadGameByUserIDAndGameId(user_id, game_id);
		Game gameRet = null;
		for (Game game : games) {
			gameRet = game;
		}
		return gameRet;
	}
	
	public void gameOver(int game_id, int user_id) {
		db.revertOppId(game_id);
	}

	
	
}