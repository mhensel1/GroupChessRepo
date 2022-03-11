package edu.ycp.cs320.chess.controller;

import edu.ycp.cs320.chess.model.ChessGame;

/**
 * Controller for the guessing game.
 */
public class GameController {
	private ChessGame model;

	/**
	 * Set the model.
	 * 
	 * @param model the model to set
	 */
	public void setModel(ChessGame model) {
		this.model = model;
	}

	/**
	 * Start a new guessing game by setting the minimum to 1 and the maximum to 100.
	 */
	public void startGame() {
		this.model.setMin(1);
		this.model.setMax(100);
	}

	/**
	 * Called to indicate that the current guess is correct.
	 * Set the min and max to the current guess.
	 */
	public void setNumberFound() {
		this.model.setMin(this.model.getGuess());
		this.model.setMax(this.model.getGuess());
	}

	/**
	 * Called to indicate that the user is thinking of a number that
	 * is less than the current guess.
	 */
	public void setNumberIsLessThanGuess() {
		this.model.setIsLessThan(this.model.getGuess());
	}

	/**
	 * Called to indicate that the user is thinking of a number that
	 * is greater than the current guess.
	 */
	public void setNumberIsGreaterThanGuess() {
		this.model.setIsGreaterThan(this.model.getGuess());
	}
}
