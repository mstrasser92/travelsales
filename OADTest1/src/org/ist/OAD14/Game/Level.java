package org.ist.OAD14.Game;

import java.util.ArrayList;

import org.ist.OAD14.Support.HibernateSupport;

public class Level {
	
	private int level_id;
	private ArrayList<Subgame> subgames;
	
	public Level(int id){
		this.level_id = id;
	}
	
	public void addSubgame(Subgame subg){
		subgames.add(subg);
	}
	
	public void editSubgame(Subgame subg){
		//TODO
	}
	
	public void deleteSubgame(Subgame subg){
		subgames.remove(subg);
	}
		
	public int getLevel_id() {
		return level_id;
	}
	public void setLevel_id(int level_id) {
		this.level_id = level_id;
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
