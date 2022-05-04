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
		pawn = new Pawn(true, false, false, 2, 3);
		rook = new Rook(true, false, false, 2, 3);
		knight = new Knight(true, false, false, 2, 3);
		bishop = new Bishop(true, false, false, 2, 3);
		king = new King(true, false, false, 2, 3);
		queen = new Queen(true, false, false, 2, 3);
	}

	@Test
	public void testPawnHasMoved() {
		assertEquals(false, pawn.getHasMoved());
		
	}
	
	@Test
	public void testRookHasMoved() {
		assertEquals(false, rook.getHasMoved());
	}
	
	@Test
	public void testKingHasMoved() {
		assertEquals(false, king.getHasMoved());
	}
	
	@Test
	public void testQueenHasMoved() {
		assertEquals(false, queen.getHasMoved());
	}
	
	@Test
	public void testBishopMovement() {
		
		//test target location on path
		assertEquals(true, bishop.validateMove(4, 5));
		assertEquals(true, bishop.validateMove(4, 1));
		assertEquals(true, bishop.validateMove(0, 5));
		assertEquals(true, bishop.validateMove(0, 1));
		assertEquals(false, bishop.validateMove(4, 3));
		assertEquals(false, bishop.validateMove(1, 3));
		
		//test that a piece cannot move to its current location
		assertEquals(false, bishop.validateMove(2, 3));
	}
}