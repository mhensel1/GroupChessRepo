package edu.ycp.cs320.chess.model;

import java.util.ArrayList;

// model class for knight

public class Knight extends ChessPiece{
	
	public Knight() {	
	}
	
	public ArrayList<BoardSpace> getMoves(ChessBoard board){
		ArrayList<BoardSpace> moves = new ArrayList<BoardSpace>();
		int x=super.getposX();
		int y=super.getposY();
		if(x + 2 <= 7 && y + 1 <= 7) {
			moves.add(new BoardSpace(x+2, y+1));
		}
		if(x + 1 <= 7 && y + 2 <= 7) {
			moves.add(new BoardSpace(x+1, y+2));
		}
		if(x - 2 >= 0 && y + 1 <= 7) {
			moves.add(new BoardSpace(x-2, y+1));
		}
		if(x - 1 <= 7 && y + 2 <= 7) {
			moves.add(new BoardSpace(x-1, y+2));
		}
		if(x - 2 >= 0 && y - 1 >= 0) {
			moves.add(new BoardSpace(x-2, y-1));
		}
		if(x - 1 >= 0 && y - 2 >= 0) {
			moves.add(new BoardSpace(x-1, y-2));
		}
		if(x + 2 <= 7 && y - 1 >= 0) {
			moves.add(new BoardSpace(x+2, y-1));
		}
		if(x + 1 <= 7 && y - 2 >= 0) {
			moves.add(new BoardSpace(x+1, y-2));
		}
		return moves;
	}
}