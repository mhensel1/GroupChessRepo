package edu.ycp.cs320.booksdb.persist;

import java.util.List;

import edu.ycp.cs320.booksdb.model.User;
import edu.ycp.cs320.booksdb.model.Game;
import edu.ycp.cs320.booksdb.model.Pair;

public interface IDatabase {
	public List<Pair<User, Game>> findUserAndGameByID(int id);
	public List<Pair<User, Game>> findAuthorAndBookByAuthorLastName(String lastName);
	public Integer insertNewUserIntoUserTable(String username, String password);
	public List<Pair<User, Game>> findAllGamesWithUsers();
	public List<User> findAllUsers();
	public List<User> removeBookByTitle(String title);		
}
