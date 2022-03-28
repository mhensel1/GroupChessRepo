package edu.ycp.cs320.chess.model;

import java.util.ArrayList;

// model class for bishop

public class Bishop extends ChessPiece{
	
	public Bishop() {	
	}
	
	public ArrayList<BoardSpace> getMoves(ChessBoard board){
		ArrayList<BoardSpace> moves = new ArrayList<BoardSpace>();
		int x = super.getposX();
		int y = super.getposY();
		int i;
		for(i = 1; i < 7; i++) {
			if(y+i <=7 && x+i <= 7) moves.add(new BoardSpace(x+1, y+1));
			if(y-i >=0 && x+i <= 7) moves.add(new BoardSpace(x+1, y-1));
			if(y-i >=0 && x-i >= 0) moves.add(new BoardSpace(x-1, y-1));
			if(y+i <=7 && x-i >= 0) moves.add(new BoardSpace(x-1, y+1));
		}
		return moves;
	}
}