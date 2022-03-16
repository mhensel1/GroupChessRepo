package edu.ycp.cs320.chess.model;

//test commit

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.model.ChessPiece;
import edu.ycp.cs320.chess.model.Pawn;

public class ChessPieceTest {
	private ChessPiece model;
	private Pawn pawn;
	private Rook rook;
	private Knight knight;
	private Bishop bishop;
	private King king;
	private Queen queen;
	
	
	@Before
	public void setUp() {
		model = new ChessPiece();
		pawn = new Pawn();
		rook = new Rook();
		knight = new Knight();
		bishop = new Bishop();
		king = new King();
		queen = new Queen();
		
	}
	
	@Test
	public void testSetposX() {
		model.setposX(0);
		assertEquals(0, model.getposX());
	}
	
	@Test
	public void testSetposY() {
		model.setposY(2);
		assertEquals(2, model.getposY());
	}
	
	@Test
	public void testPawnHasMoved() {
		assertEquals(false, pawn.hasMoved());
	}
	
	@Test
	public void testRookHasMoved() {
		assertEquals(false, rook.hasMoved());
	}
	
	@Test
	public void testKingHasMoved() {
		assertEquals(false, king.hasMoved());
	}
	
	@Test
	public void testQueenHasMoved() {
		assertEquals(false, queen.hasMoved());
	}
}
