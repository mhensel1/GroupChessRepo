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
	
	@Test
	public void testKnightMovement() {
		assertEquals(true, knight.validateMove(4, 2));
		assertEquals(true, knight.validateMove(3, 5));
		assertEquals(false, knight.validateMove(7, 7));
		assertEquals(false, knight.validateMove(2, 4));
		
		assertEquals(false, knight.validateMove(2, 3));
	}
	
	@Test
	public void testRookMovement() {
		assertEquals(true, rook.validateMove(2, 6));
		assertEquals(true, rook.validateMove(7, 3));
		assertEquals(true, rook.validateMove(1, 3));
		assertEquals(false, rook.validateMove(3, 4));
		assertEquals(false, rook.validateMove(1, 2));
		
		assertEquals(false, rook.validateMove(2, 3));
	}
	
	@Test
	public void testQueenMovement() {
		assertEquals(true, queen.validateMove(2, 6));
		assertEquals(true, queen.validateMove(7, 3));
		assertEquals(true, queen.validateMove(4, 5));
		assertEquals(true, queen.validateMove(1, 2));
		assertEquals(false, queen.validateMove(5, 5));
		assertEquals(false, queen.validateMove(1, 1));
		
		assertEquals(false, queen.validateMove(2, 3));
	}
	
	@Test
	public void testKingMovement() {
		assertEquals(true, king.validateMove(2, 4));
		assertEquals(true, king.validateMove(1, 2));
		assertEquals(true, king.validateMove(3, 2));
		assertEquals(false, king.validateMove(4, 3));
		assertEquals(false, king.validateMove(2, 5));
		
		assertEquals(false, king.validateMove(2, 3));
	}
	
	@Test
	public void testPawnMovement() {
		//test first move distance
		assertEquals(true, pawn.validateMove(2, 5));
		assertEquals(true, pawn.validateMove(2, 4));
		
		//test second move distance
		pawn.setHasMoved(true);
		assertEquals(false, pawn.validateMove(2, 5));
		assertEquals(true, pawn.validateMove(2, 4));
		
		pawn.setHasMoved(false);
	}
}