package edu.ycp.cs320.chess.controller;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.controller.UserController;
import edu.ycp.cs320.chess.model.ChessPiece;

public class NumbersControllerTest {
	private ChessPiece model;
	private UserController controller;
	
	@Before
	public void setUp() {
		model = new ChessPiece();
		controller = new UserController();
	}
	
	@Test
	public void testControllerAddition() {
		double[]numbers = {1,2,3};
		model.setNumbers(numbers);
		controller.setModel(model);
		controller.setNumbersAddition(numbers[0], numbers[1], numbers[2]);
		assertEquals(6.0, model.getResult(),0);
	}
	
	@Test
	public void testControllerMuliplication() {
		double[]numbers = {6,3};
		model.setNumbers(numbers);
		controller.setModel(model);
		controller.setNumbersMultiplication(numbers[0], numbers[1]);
		assertEquals(18.0, model.getResult(),0);
	}
}
