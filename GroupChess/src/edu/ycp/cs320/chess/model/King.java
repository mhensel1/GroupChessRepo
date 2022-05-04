package edu.ycp.cs320.chess.model;

import java.util.List;
import edu.ycp.cs320.gamesDB.model.Piece;

public class King extends ChessPiece {
  
    public King(boolean color, boolean captured, boolean hasMoved, int x, int y){
		
        super(color, captured, hasMoved, x, y);
    }
  
    @Override
    public boolean validateMove(int x, int y)
    {
    	
    	int deltaX = Math.abs(super.getX() - x);
    	int deltaY = Math.abs(super.getY() - y);
    	
    	if(deltaX <= 1 && deltaY <= 1) {
    		//check collision here
    		List<Piece> pieceList = super.getDb().findPieceByColorAndXY(super.getColor(), x, y);
    		if(!pieceList.isEmpty()) {
    			return false;
    		}
    		super.setHasMoved(true);
    		return true;
    	}
    	return false;
     }
    
    public boolean isChecked() {
    	List<Piece> opponentPieces = super.getDb().findAllPiecesByColor(!super.getColor());
    	for(Piece currentPiece: opponentPieces) {
    		String type = currentPiece.getType();
    		ChessPiece revisedPiece = null;
    		switch(type) {
    		case "pawn":
    			revisedPiece = new Pawn(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		case "knight":
    			revisedPiece = new Knight(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		case "rook":
    			revisedPiece = new Rook(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		case "bishop":
    			revisedPiece = new Bishop(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		case "queen":
    			revisedPiece = new Queen(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		case "king":
    			revisedPiece = new King(currentPiece.getColor(), currentPiece.getCaptured(), currentPiece.getHasMoved(), currentPiece.getPosX(), currentPiece.getPosY());
    			break;
    		default:
    			System.out.println("something has gone horribly wrong, piece doesnt exist");
    		}
    		if(revisedPiece.validateMove(super.getX(), super.getY())) {
    			return true;
    		}
    	}
    	//stub
    	return false;
    }
  
    private boolean isValidCastling(Rook rook)
    {
            return false;
    }
  
    public boolean isCastlingMove(BoardSpace start, BoardSpace end)
    {
		return false;
    }
}