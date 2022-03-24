package edu.ycp.cs320.chess.model;

// model class for ChessGame

public class ChessBoard {
	private boolean color;
	private int[] xCoords, yCoords;
	private boolean[][] board;  //WHITE = TRUE, BLACK = FALSE
	
	public ChessBoard() {
		board = new boolean[8][8];
	}
	
	public void createBoard() {
		for (int i=0; i<8; i++) {
			for (int c=0; c<8; c++) {  //set all spaces to true(white)
				board[i][c] = true;
			}
		}
		for (int i=0; i<8; i++) {
			if (i % 2 == 1) {
				for (int c=0; c<8; c+=2) { //set alternate spaces to false(black)
					board[i][c] = false;
				}
			}
			if (i % 2 == 0) {
				for (int c=1; c<8; c+=2) {
					board[i][c] = false;
				}
			}
		}
	}
	
	
}
