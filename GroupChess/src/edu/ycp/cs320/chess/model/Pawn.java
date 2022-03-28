package edu.ycp.cs320.chess.model;

import java.util.ArrayList;

// model class for pawn

public class Pawn extends ChessPiece{
	
	public Pawn() {	
		
	}
	
	public ArrayList<BoardSpace> getMoves(ChessBoard board){
		ArrayList<BoardSpace> moves = new ArrayList<BoardSpace>();
		
		if(super.getColor()) {  //black case, start at 7
			if(super.getposY()-1 >= 0) {
				moves.add(new BoardSpace(super.getposX(), super.getposY()-1));
			}
			if(!super.getHasMoved() && super.getposY()-2 >= 0) {
				moves.add(new BoardSpace(super.getposX(), super.getposY()-2));
			}
		}
		
		if(!super.getColor()) {  //white case, start at 0
			if(super.getposY()+1 <= 7) {
				moves.add(new BoardSpace(super.getposX(), super.getposY()+1));
			}
			if(!super.getHasMoved() && super.getposY()+2 <= 7) {
				moves.add(new BoardSpace(super.getposX(), super.getposY()+2));
			}
		}
		
		return moves;
	}
	
}