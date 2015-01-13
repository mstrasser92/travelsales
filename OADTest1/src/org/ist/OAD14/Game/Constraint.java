package org.ist.OAD14.Game;

import org.ist.OAD14.Support.HibernateSupport;

public class Constraint {

	private Node nodeA;
	private Node nodeB;
	private String restriction;
	
	public Constraint(Node a, Node b, String restr){
		this.nodeA = a;
		this.nodeB = b;
		this.restriction = restr;
	}
	
	public Node getNodeA(){
		return nodeA;
	}
	
	public Node getNodeB(){
		return nodeB;
	}
	
	public String getRestriction(){
		return restriction;
	}
	
	public void setNodeA(Node a){
		nodeA = a;
	}
	
	public void setNodeB(Node b){
		nodeB = b;
	}
	
	public void setRestriction(String restr){
		restriction = restr;
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
