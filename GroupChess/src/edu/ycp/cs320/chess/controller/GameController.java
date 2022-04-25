package edu.ycp.cs320.chess.controller;

import edu.ycp.cs320.chess.model.ChessGame;
import edu.ycp.cs320.chess.model.ChessPiece;
import edu.ycp.cs320.booksdb.persist.DatabaseProvider;
import edu.ycp.cs320.booksdb.persist.IDatabase;
import edu.ycp.cs320.chess.model.BoardSpace;
import edu.ycp.cs320.chess.model.ChessBoard;
import edu.ycp.cs320.booksdb.model.Pair;
import java.util.List;
import edu.ycp.cs320.booksdb.model.Piece;

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
	
	public boolean canMove(ChessBoard board, BoardSpace start, BoardSpace end) {
		this.Boardmodel = board;
		// check for pieces at the starting and ending spot and see if a move can be made
		IDatabase db = DatabaseProvider.getInstance();
		//List<Piece> piece = db.findPieceByXY(xCor, yCor);
		
		return Boardmodel.getSpace(start.getX(), start.getY()).getPiece().canMove(board,Boardmodel.getSpace(start.getX(), start.getY()), Boardmodel.getSpace(end.getX(), end.getY()));
	}
	
	public void Move(ChessBoard board, BoardSpace start, BoardSpace end) {
		//ChessPiece temp = null;
		if(canMove(board, start, end) == true) { //Check valid move
			
			//temp = Boardmodel.getSpace(start.getX(), start.getY()).getPiece();
			System.out.println("Start Space/Piece Selected : " +  Boardmodel.getSpace(start.getX(), start.getY()).getPiece());
			System.out.println("End Space/Piece Selected : " + Boardmodel.getSpace(end.getX(), end.getY()).getPiece());
			
			//Set end space piece to start space piece
			board.getSpace(end.getX(), end.getY()).setPiece(board.getSpace(start.getX(), start.getY()).getPiece()); 
			//Set start space to null
			board.getSpace(start.getX(), start.getY()).setPiece(null);
			//set piece hasmoved since it moves
			end.getPiece().setHasMoved(true);
			
			System.out.println("Move Succesfull");
			IDatabase db = DatabaseProvider.getInstance();
			Pair<Integer, Integer> pair = db.updatePieceInfoByCoords(start.getX(), start.getY(), end.getX(), end.getY(), false);
			System.out.println("Piece info updated. new Coordinates: " + pair.getLeft() + ", " + pair.getRight());
			
			
			System.out.println("New Start Space/Piece : " + Boardmodel.getSpace(start.getX(), start.getY()).getPiece());
			System.out.println("New End Space/Piece: " + Boardmodel.getSpace(end.getX(), end.getY()).getPiece());
		}
		this.Boardmodel = board;
	}
}