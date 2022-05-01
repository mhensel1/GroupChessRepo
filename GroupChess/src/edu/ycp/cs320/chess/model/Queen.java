package edu.ycp.cs320.chess.model;

import edu.ycp.cs320.chess.model.Bishop;

public class Queen extends ChessPiece {
	
	public Queen(boolean color, boolean captured, boolean hasMoved, int x, int y){
		
        super(color, captured, hasMoved, x, y);
    }
  
    @Override
    public boolean validateMove(int x, int y) {
        Bishop b = new Bishop(super.getColor(), super.getCaptured(), super.getHasMoved(), super.getX(), super.getY());
        Rook r = new Rook(super.getColor(), super.getCaptured(), super.getHasMoved(), super.getX(), super.getY());
    	return(b.validateMove(x, y)|| r.validateMove(x, y));
     }
}