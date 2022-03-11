package edu.ycp.cs320.chess.model;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.model.ChessGame;
import edu.ycp.cs320.chess.model.ChessPiece;

public class NumbersTest {
	private ChessPiece model;
	
	@Before
	public void setUp() {
		model = new ChessPiece();
	}
	
	@Test
	public void testSetNumbers() {
		double numbers[] = {1,2,3};
		model.setNumbers(numbers);
		assertEquals(numbers, model.getNumbers());
	}

	@Test
	public void testSetResult() {
		model.setResult(100);
		assertEquals(100.0, model.getResult(),0);
	}
}
