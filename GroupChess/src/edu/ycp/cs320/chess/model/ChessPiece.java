package edu.ycp.cs320.chess.model;

// model class for AddNumbers and MultiplyNumbers

public class ChessPiece {
	private double[] numbers;
	private double result;
	
	public ChessPiece() {
	}
	
	public void setNumbers(double numbers[]) {
		this.numbers = numbers;
	}
	
	public double[] getNumbers() {
		return numbers;
	}
	
	public void setResult(double result) {
		this.result = result;
	}
	
	public double getResult() {
		return result;
	}

}
