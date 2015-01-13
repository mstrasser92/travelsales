package org.ist.OAD14.Game;

import java.util.ArrayList;
import org.ist.OAD14.Support.HibernateSupport;

public class Subgame {

	private int subgame_id;
	private ArrayList<Node> nodes;
	private ArrayList<Constraint> constraints;
	
	public Subgame (int id){
		this.subgame_id = id;
	}
	
	public int getSubgame_id(){
		return subgame_id;
	}
	
	public void setSubgame_id(int id){
		subgame_id = id;
	}
	
	public void addNode(Node node){
		nodes.add(node);
	}
	
	public void deleteNode(Node node){
		nodes.remove(node);
	}
	
	public void addConstraint(Constraint constr){
		constraints.add(constr);
	}
	
	public void deleteConstraint(Constraint constr){
		constraints.remove(constr);
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
