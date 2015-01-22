package org.ist.OAD14.Game;

import java.io.Serializable;
import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

import org.hibernate.annotations.GenericGenerator;
import org.ist.OAD14.General.Interface.ISaveAndDelete;
import org.ist.OAD14.Support.HibernateSupport;

@Entity
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
public class Level implements ISaveAndDelete, Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4566535961996568242L;

	@Id
	@GenericGenerator(name="generator", strategy="increment")
	@GeneratedValue(generator="generator")
	protected int levelID;
	
	private ArrayList<Subgame> subgames;
	
	public Level(){
		this.subgames = new ArrayList<Subgame>();
	}
	
	public ArrayList<Subgame> getSubgames() {
		return subgames;
	}
	
	public void addSubgame(Subgame subg){
		subgames.add(subg);
	}
	
	public void editSubgame(Subgame subg){
		//TODO Game Editor
	}
	
	public void deleteSubgame(Subgame subg){
		subgames.remove(subg);
	}
		
	public int getLevelID() {
		return levelID;
	}
	public void setLevelID(int level_id) {
		this.levelID = level_id;
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
