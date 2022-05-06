package edu.ycp.cs320.chess.controller;

import edu.ycp.cs320.chess.model.ChessGame;
import edu.ycp.cs320.chess.model.ChessPiece;
import edu.ycp.cs320.chess.model.King;
import edu.ycp.cs320.chess.model.Knight;
import edu.ycp.cs320.chess.model.Pawn;
import edu.ycp.cs320.chess.model.Queen;
import edu.ycp.cs320.chess.model.Rook;
import edu.ycp.cs320.gamesDB.persist.DatabaseProvider;
import edu.ycp.cs320.gamesDB.persist.DerbyDatabase;
import edu.ycp.cs320.gamesDB.persist.IDatabase;
import edu.ycp.cs320.chess.model.Bishop;
import edu.ycp.cs320.chess.model.BoardSpace;
import edu.ycp.cs320.chess.model.ChessBoard;
import edu.ycp.cs320.gamesDB.model.Pair;
import edu.ycp.cs320.gamesDB.model.Game;
import edu.ycp.cs320.gamesDB.model.User;
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
	
    public boolean checkMove(ChessPiece thePiece, int x, int y, int game_id) {
    	//validate move func talk to tom
    	System.out.println("In CheckMove: X: "+ x + " Y: "+ y);
    	boolean check = thePiece.validateMove(game_id,  x,  y);
    	
    	Piece oldKing = db.findPieceByColorAndType(thePiece.getColor(), "king", game_id).get(0);
    	King myKing = new King(oldKing.getColor(), oldKing.getCaptured(), oldKing.getHasMoved(), oldKing.getPosX(), oldKing.getPosY());
    	check = check && !myKing.isChecked(game_id);
    	
    	return check;
    }
    
	public void move(int oldX, int oldY, int newX, int newY, boolean capture, boolean hasMoved, int game_id) {
		
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
	
	public Piece findPieceByXY(int x, int y, int game_id) {
		List<Piece> pieces = db.findPieceByXY(x, y, game_id);
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
	
	public void gameOver(int game_id, int user_id, int opp_id, boolean winner) {
		if (winner == true) {
			List<Pair<User, Game>> gameUsers = db.findUserAndGameByID(game_id);
			User theUser = null;
			for (Pair<User, Game> gameUser : gameUsers) {
				theUser = gameUser.getLeft();
			}
			String username = theUser.getUsername();
			db.updateStatsByUser(username, theUser.getWins()+1, theUser.getLosses());
			//lower opp stats
		}
		else if (winner == false) {
			List<Pair<User, Game>> gameUsers = db.findUserAndGameByID(game_id);
			User theUser = null;
			for (Pair<User, Game> gameUser : gameUsers) {
				theUser = gameUser.getLeft();
			}
			String username = theUser.getUsername();
			db.updateStatsByUser(username, theUser.getWins(), theUser.getLosses()-1);
			//up opp stats
		}
		db.revertOppId(game_id);
	}
	
	public ChessPiece convertPiece(Piece currentPiece) {
    		String type = currentPiece.getType();
    		ChessPiece revisedPiece = null;
    		switch(type) {
    		case "pawn":
    			revisedPiece = new Pawn(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		case "knight":
    			revisedPiece = new Knight(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		case "rook":
    			revisedPiece = new Rook(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		case "bishop":
    			revisedPiece = new Bishop(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		case "queen":
    			revisedPiece = new Queen(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		case "king":
    			revisedPiece = new King(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		default:
    			System.out.println("something has gone horribly wrong, piece doesnt exist");
    		}
    		System.out.println("Converted Piece Info: "+ revisedPiece.getX() + revisedPiece.getY());
    		return revisedPiece;
	}

	
	
}