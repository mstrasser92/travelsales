package org.ist.OAD14.Game;

import org.ist.OAD14.Support.HibernateSupport;

public class Node {

	private float coordX;
	private float coordY;
	
	public Node(float x, float y){
		this.coordX = x;
		this.coordY = y;
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
	
	public boolean saveToDB() {
		if(!HibernateSupport.commit(this))
			return false;
		return true;
	}

	public void deleteFromDB() {
		HibernateSupport.deleteObject(this);
	}
}
