package edu.ycp.cs320.chess.model;

import java.util.ArrayList;

// model class for king

public class King extends ChessPiece{
	
	public King() {	
	}
	
	public ArrayList<BoardSpace> getMoves(ChessBoard board){
		ArrayList<BoardSpace> moves = new ArrayList<BoardSpace>();
		int x = super.getposX();
		int y = super.getposY();
		if(x+1 <= 7) {
			moves.add(new BoardSpace(x+1, y));
			if (y+1 <= 7) moves.add(new BoardSpace(x+1, y+1));
			if (y-1 >= 0) moves.add(new BoardSpace(x+1, y-1));
		}
		if(x-1 >= 0) {
			moves.add(new BoardSpace(x-1, y));
			if (y+1 <= 7) moves.add(new BoardSpace(x-1, y+1));
			if (y-1 >= 0) moves.add(new BoardSpace(x-1, y-1));
		}
		if(y+1 <= 7) moves.add(new BoardSpace(x, y+1));
		if(y-1 >= 0) moves.add(new BoardSpace(x, y-1));
		return moves;
	}
	
}