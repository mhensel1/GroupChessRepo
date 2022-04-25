package edu.ycp.cs320.chess.model;

public class King extends ChessPiece {
    private boolean castlingDone = false;
  
    public King(boolean color, boolean captured, boolean hasMoved, int x, int y){
		
        super(color, captured, hasMoved, x, y);
    }
  
    public boolean isCastlingDone()
    {
        return this.castlingDone;
    }
  
    public void setCastlingDone(boolean castlingDone)
    {
        this.castlingDone = castlingDone;
    }
  
    @Override
    public boolean validateMove(int x, int y)
    {
    	
    	int deltaX = Math.abs(super.getX() - x);
    	int deltaY = Math.abs(super.getY() - y);
    	
    	if(deltaX <= 1 && deltaY <= 1) {
    		//check collision here
    		return true;
    	}
    	
    	//stub	
    	return false;
     }
  
    private boolean isValidCastling(ChessBoard board, BoardSpace start, BoardSpace end)
    {
            return false;
    }
  
    public boolean isCastlingMove(BoardSpace start, BoardSpace end)
    {
		return false;
    }
}