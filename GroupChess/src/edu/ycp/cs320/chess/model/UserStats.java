package edu.ycp.cs320.chess.model;

// model class for UserStats

public class UserStats{
	
	private ChessUser model;
	
	public UserStats() {	
	}
	
	public void changeRank() {
		//change rank from user
		model.setRank(model.getRank());
	}
}