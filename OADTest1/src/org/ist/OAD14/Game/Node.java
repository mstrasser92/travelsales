package org.ist.OAD14.Game;

import java.io.Serializable;

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
public class Node implements ISaveAndDelete, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9043664600947941536L;

	@Id
	@GenericGenerator(name="generator", strategy="increment")
	@GeneratedValue(generator="generator")
	protected int nodeID;
	
	private float coordX;
	private float coordY;
	
	protected int subgameID;
	
	public Node(float x, float y){
		this.coordX = x;
		this.coordY = y;
	}
	
	public int getNodeID() {
		return nodeID;
	}

	public void setNodeID(int nodeID) {
		this.nodeID = nodeID;
	}
	
	public float getCoordX(){
		return coordX;
	}
	
	public float getCoordY(){
		return coordY;
	}
	
	public void setCoordX(float x){
		coordX = x;
	}
	
	public void setCoordY(float y){
		coordY = y;
	}
	
	public int getSubgameID() {
		return subgameID;
	}

	public void setSubgameID(int subgameID) {
		this.subgameID = subgameID;
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
