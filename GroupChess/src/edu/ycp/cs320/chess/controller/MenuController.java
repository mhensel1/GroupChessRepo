package edu.ycp.cs320.chess.controller;

import edu.ycp.cs320.chess.model.ChessGame;
import edu.ycp.cs320.chess.model.ChessPiece;
import edu.ycp.cs320.gamesDB.persist.DatabaseProvider;
import edu.ycp.cs320.gamesDB.persist.DerbyDatabase;
import edu.ycp.cs320.gamesDB.persist.IDatabase;
import edu.ycp.cs320.chess.model.BoardSpace;
import edu.ycp.cs320.chess.model.ChessBoard;
import edu.ycp.cs320.gamesDB.model.Pair;
import edu.ycp.cs320.gamesDB.model.Game;
import edu.ycp.cs320.gamesDB.model.User;
import java.util.List;
import edu.ycp.cs320.gamesDB.model.Piece;

public class MenuController {
	private IDatabase db = null;
	
	public MenuController(){
		DatabaseProvider.setInstance(new DerbyDatabase());
		db = DatabaseProvider.getInstance();
	}
	
	public List<Game> findGamesWithoutOpps() {
		List<Game> games = db.findGamesWithoutOpps();
		return games;
	}
	
	public Game findGameById(int game_id) {
		List<Pair<User, Game>> gameUsersList = db.findUserAndGameByID(game_id);
		Game game = null;
		for (Pair<User, Game> gameUser : gameUsersList) {
			game = gameUser.getRight();
		}
		
		return game;
	}
	
	public void addUserIdToOppId(int game_id, int user_id) {
		int id = db.updateOppID(game_id, user_id);
		System.out.println("Opp id set to " + id);
	}
	
	public int findUserIdByUsername(String username) {
		List<User> userList = db.findUserbyUsername(username);
		int user_id = 0;
		for (User user : userList) {
			user_id = user.getUserId();
		}
		return user_id;
	}
	
	public int createGame(int user_id, String username) {
		db.insertNewGame(user_id);
		Game game = null;
		List<Pair<User, Game>> userGames = db.findUserAndGameByUserName(username);
		for (Pair<User, Game> userGame : userGames) {
			game = userGame.getRight();
		}
		return game.getGameId();
	}
	
	public User getUser(String username) {
		List<User> users = db.findUserbyUsername(username);
		User toReturn = null;
		for (User user : users) {
			toReturn = user;
		}
		return toReturn;
	}
	
	public void addUserIDtoGame(int user_id, int game_id) {
		int id = db.addUserIDtoGame(user_id, game_id);
		System.out.println("User id int Game "+ game_id + " set to " + id);
	}
	
	
}