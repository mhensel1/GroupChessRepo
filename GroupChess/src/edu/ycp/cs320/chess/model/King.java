package edu.ycp.cs320.chess.model;

public class King extends ChessPiece {
    private boolean castlingDone = false;
  
    public King(boolean color)
    {
        super(color);
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
    public boolean canMove(ChessBoard board, BoardSpace start, BoardSpace end)
    {
   
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