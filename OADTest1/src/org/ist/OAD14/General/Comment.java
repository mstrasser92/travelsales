package org.ist.OAD14.General;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.ist.OAD14.General.Interface.ISaveAndDelete;
import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.User;

/**
 * 
 * @author Stettinger
 *
 */

@Entity
public class Comment implements ISaveAndDelete{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int commentID;
	
	@ManyToOne
	private User originator;
	private String comment;
	private Date creationDate;
	
	@SuppressWarnings("unused")
	private Comment(){
	}
	
	public Comment(User user, String comment){
		this.originator = user;
		this.comment = comment;
		this.creationDate = new Date();
	}
	
	public Comment(User user, String comment, Date creationDate){
		this.originator = user;
		this.comment = comment;
		this.creationDate = creationDate;
	}
	
	public String getComment() {
		return comment;
	}
	
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public Date getCreationDate() {
		return creationDate;
	}
	
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	
	public User getOriginator() {
		return originator;
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
