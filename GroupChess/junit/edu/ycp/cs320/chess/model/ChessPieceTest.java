package edu.ycp.cs320.chess.model;

//test commit

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.model.ChessPiece;
import edu.ycp.cs320.chess.model.Pawn;

public class ChessPieceTest {
	private Pawn pawn;
	private Rook rook;
	private Knight knight;
	private Bishop bishop;
	private King king;
	private Queen queen;
	
	
	@Before
	public void setUp() {
		pawn = new Pawn();
		rook = new Rook();
		knight = new Knight();
		bishop = new Bishop();
		king = new King();
		queen = new Queen();
		
	}
	
	@Test
	public void pawnTestSetposX() {
		pawn.setposX(0);
		assertEquals(0, pawn.getposX());
	}
	
	@Test
	public void pawnTestSetposY() {
		pawn.setposY(2);
		assertEquals(2, pawn.getposY());
	}
	
	@Test
	public void pawnTestGetMoved() {
		assertEquals(false, pawn.getHasMoved());
	}
	
	@Test
	public void bishopTestSetposX() {
		pawn.setposX(0);
		assertEquals(0, bishop.getposX());
	}
	
	@Test
	public void bishopTestSetposY() {
		pawn.setposY(2);
		assertEquals(2, bishop.getposY());
	}
	
	@Test
	public void bishopTestGetMoved() {
		assertEquals(false, bishop.getHasMoved());
	}
	
	@Test
	public void kingTestSetposX() {
		pawn.setposX(0);
		assertEquals(0, king.getposX());
	}
	
	@Test
	public void kingTestSetposY() {
		pawn.setposY(2);
		assertEquals(2, king.getposY());
	}
	
	@Test
	public void kingTestGetMoved() {
		assertEquals(false, king.getHasMoved());
	}
	
	@Test
	public void rookTestSetposX() {
		pawn.setposX(0);
		assertEquals(0, rook.getposX());
	}
	
	@Test
	public void rookTestSetposY() {
		pawn.setposY(2);
		assertEquals(2, rook.getposY());
	}
	
	@Test
	public void rookTestGetMoved() {
		assertEquals(false, rook.getHasMoved());
	}
	
	@Test
	public void queenTestSetposX() {
		pawn.setposX(0);
		assertEquals(0, queen.getposX());
	}
	
	@Test
	public void queenTestSetposY() {
		pawn.setposY(2);
		assertEquals(2, queen.getposY());
	}
	
	@Test
	public void queenTestGetMoved() {
		assertEquals(false, queen.getHasMoved());
	}
	
	@Test
	public void knightTestSetposX() {
		pawn.setposX(0);
		assertEquals(0, knight.getposX());
	}
	
	@Test
	public void knightTestSetposY() {
		pawn.setposY(2);
		assertEquals(2, knight.getposY());
	}
	
	@Test
	public void knightTestGetMoved() {
		assertEquals(false, knight.getHasMoved());
	}
}
