package org.ist.OAD14.Game;

import java.io.Serializable;
import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;
import org.ist.OAD14.General.Interface.ISaveAndDelete;
import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.User;

@Entity
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
public class Game implements ISaveAndDelete, Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8941087165718929979L;

	@Id
	@GenericGenerator(name="generator", strategy="increment")
	@GeneratedValue(generator="generator")
	protected int gameID;
	
	@ManyToOne
	private User author;
	
	private String name;
	private String visibility;
	//private Evaluation evaluation;
	
	@Lob
	private ArrayList<Level> levels;

	
	// public int createGame() ??
	// public int editGame(Game game) ??
	// public int deleteGame(Game game) ?? maybe elsewhere?
	// public int editLevel(Level lvl) ??
	// public int showEvaluations(Game game) why int?
	
	public Game(String name, User author, String visibility) {
		this.name = name;
		this.author = author;
		this.visibility = visibility;
		this.levels = new ArrayList<Level>();
	}
	
	public Game()
	{
		
	}
		
	public int getGameID() {
		return gameID;
	}

	public void setGameID(int gameID) {
		this.gameID = gameID;
	}

	public String getVisibility() {
		return visibility;
	}

	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}

	public void playGame(Game game){
		//TODO
	}
	
	public void addLevel(Level lvl){
		levels.add(lvl);
	}
	
	public void deleteLevel(Level lvl){
		levels.remove(lvl);
	}
	
	public ArrayList<Level> getLevels() {
		return levels;
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

	@Override
	public boolean saveToDB() {
		if(!HibernateSupport.commit(this))
			return false;
		return true;
	}

	@Override
	public void deleteFromDB() {
		HibernateSupport.deleteObject(this);
	}
}
