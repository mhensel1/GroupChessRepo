package edu.ycp.cs320.chess.controller;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.controller.UserController;
import edu.ycp.cs320.chess.model.ChessUser;

public class UserControllerTest {
	private ChessUser model;
	private UserController controller;
	
	@Before
	public void setUp() {
		model = new ChessUser();
		controller = new UserController();
	}
	
	
}
