package org.ist.OAD14.Game;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;

import org.ist.OAD14.General.Interface.ISaveAndDelete;
import org.ist.OAD14.Support.HibernateSupport;

@Entity
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
public class Restriction implements ISaveAndDelete, Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1653558825414285076L;

	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	protected int restrictionID;

	@ManyToOne
	private Node nodeA;
	
	@ManyToOne
	private Node nodeB;
	private String restriction;
	
	public Restriction(Node a, Node b, String restr){
		this.nodeA = a;
		this.nodeB = b;
		this.restriction = restr;
	}
	
	public int getRestrictionID() {
		return restrictionID;
	}

	public void setRestrictionID(int restrictionID) {
		this.restrictionID = restrictionID;
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
