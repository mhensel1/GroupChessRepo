package edu.ycp.cs320.chess.model;

import java.util.ArrayList;

// model class for rook

public class Rook extends ChessPiece{
	
	public Rook() {	
	}
	
	public ArrayList<BoardSpace> getMoves(ChessBoard board){
		ArrayList<BoardSpace> moves = new ArrayList<BoardSpace>();
		int x = super.getposX();
		int y = super.getposY();
		int i;
		for(i = 0; i < y; i++) {
			moves.add(new BoardSpace(i, super.getposY()));
		}
		for(; i > y; i++) {
			moves.add(new BoardSpace(i, super.getposY()));
		}
		for(i = 0; i < x; i++) {
			moves.add(new BoardSpace(super.getposX(), i));
		}
		for(i = 0; i > x; i++) {
			moves.add(new BoardSpace(super.getposX(), i));
		}
		return moves;
	}
	
}