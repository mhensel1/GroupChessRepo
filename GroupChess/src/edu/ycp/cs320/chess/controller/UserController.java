package edu.ycp.cs320.chess.controller;
import edu.ycp.cs320.chess.model.ChessPiece;

//Controller for ChessPiece

public class UserController {
	
	private ChessPiece model;

	
	public void setModel(ChessPiece model) {	//Set the model
		this.model = model;
	}
	
	public void setNumbers(double first, double second, double third) {	//Sets the numbers in the model 
		double numbers[] = {first, second, third};
		 this.model.setNumbers(numbers);
	}
	
	public void setNumbersAddition(double first, double second, double third) {	//Takes the sum of 3 numbers and sets result in the model  
		double result = (first+second+third);
		 this.model.setResult(result);
	}
	
	public void setNumbersMultiplication(double first, double second) { //takes the product of 2 numbers and sets the result in the model
		double result = first*second;
		 this.model.setResult(result);
	}
}
