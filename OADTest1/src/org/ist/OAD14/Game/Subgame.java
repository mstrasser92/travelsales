package org.ist.OAD14.Game;

import java.io.Serializable;
import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Lob;

import org.hibernate.annotations.GenericGenerator;
import org.ist.OAD14.General.Interface.ISaveAndDelete;
import org.ist.OAD14.Support.HibernateSupport;

@Entity
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
public class Subgame implements ISaveAndDelete, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3827928826051196223L;

	@Id
	@GenericGenerator(name="generator", strategy="increment")
	@GeneratedValue(generator="generator")
	protected int subgameID;
	
	protected int levelID;
	
	@Lob
	private ArrayList<Node> nodes;

	@Lob
	private ArrayList<Restriction> restriction;
	
	public Subgame (){
		this.nodes = new ArrayList<Node>();
		this.restriction = new ArrayList<Restriction>();
	}
	
	public int getSubgameID(){
		return subgameID;
	}
	
	public void setSubgameID(int id){
		subgameID = id;
	}
	
	public void addNode(Node node){
		nodes.add(node);
	}
	
	public void deleteNode(Node node){
		nodes.remove(node);
	}
	
	public void addRestriction(Restriction constr){
		restriction.add(constr);
	}
	
	public void deleteRestriction(Restriction constr){
		restriction.remove(constr);
	}
		
	public int getLevelID() {
		return levelID;
	}

	public void setLevelID(int levelID) {
		this.levelID = levelID;
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
