package edu.ycp.cs320.chess.model;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.model.ChessUser;

public class ChessUserTest {
	private ChessUser model;
	
	@Before
	public void setUp() {
		model = new ChessUser();
	}
	
	@Test
	public void testSetUser() {
		model.setUser("username");
		assertEquals("username", model.getUser());
	}
	
	@Test
	public void testSetRank() {
		model.setRank(10);
		assertEquals(10, model.getRank(), 10);
	}
	
	@Test
	public void testSetID() {
		model.setID(10);
		assertEquals(10, model.getID(), 10);
	}
	
	@Test
	public void testforfeit() {
		model.setRank(10);
		model.forfeit();
		assertEquals(9, model.getRank(), 9);
	}
}
