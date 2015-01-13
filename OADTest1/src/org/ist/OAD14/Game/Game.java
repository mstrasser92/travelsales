package org.ist.OAD14.Game;

import java.util.ArrayList;

import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.User;

public class Game {
	
	private int game_id;
	private String name;
	private User author;
	private ArrayList<Level> levels;
	//private Evaluation evaluation;
	
	// public int createGame() ??
	// public int editGame(Game game) ??
	// public int deleteGame(Game game) ?? maybe elsewhere?
	// public int editLevel(Level lvl) ??
	// public int showEvaluations(Game game) why int?
	
	public void playGame(Game game){
		//TODO
	}
	
	public void addLevel(Level lvl){
		levels.add(lvl);
	}
	
	public void deleteLevel(Level lvl){
		levels.remove(lvl);
	}
	
	public int getGame_id() {
		return game_id;
	}

	public void setGame_id(int game_id) {
		this.game_id = game_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public boolean saveToDB() {
		if(!HibernateSupport.commit(this))
			return false;
		return true;
	}

	public void deleteFromDB() {
		HibernateSupport.deleteObject(this);
	}

}
