package edu.ycp.cs320.chess.model;

public class BoardSpace {
    private ChessPiece chessPiece;
    private int x;
    private int y;
  
    public BoardSpace(int x, int y, ChessPiece chessPiece) {
        this.setX(x);
        this.setY(y);
        this.setPiece(chessPiece);
    }
    
    public void setPiece(ChessPiece chessPiece) {
        this.chessPiece = chessPiece;
    }
    
    public ChessPiece getPiece() {
        return this.chessPiece;
    }
    
    public void setX(int x) {
        this.x = x;
    }
  
    public int getX() {
        return x;
    }
  
    public int getY() {
        return y;
    }
  
    public void setY(int y) {
        this.y = y;
    }
    
}