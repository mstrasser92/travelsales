package org.ist.OAD14.General;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.ist.OAD14.General.Interface.ISaveAndDelete;
import org.ist.OAD14.Support.HibernateSupport;

/**
 * 
 * @author Stettinger
 *
 */

@Entity
public class Application  implements ISaveAndDelete{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int applicationID;
	
	private String appName;
	
	public enum ApplicationType{
		Game1,
		Game2
	}
	
	@Enumerated(EnumType.ORDINAL)
	private ApplicationType appType;
	
	@OneToMany
	List<Comment> comments;
	
	@SuppressWarnings("unused")
	private Application(){
	}
	
	public Application(String appName, ApplicationType type){
		this.appName=appName;
		this.appType=type;
		comments = new ArrayList<Comment>();
	}
	
	public List<Comment> getComments() {
		return comments;
	}
	
	public void addComment(Comment c){
		this.comments.add(c);
	}

	@Override
	public boolean saveToDB() {
		if(comments != null){
			for(Comment c: comments){
				if(!HibernateSupport.commit(c))
					return false;
			}
		}
		
		if(!HibernateSupport.commit(this))
			return false;
		
		return true;
	}

	@Override
	public void deleteFromDB() {
		if(comments != null){
			for(Comment c: comments)
				HibernateSupport.deleteObject(c);
		}
		
		HibernateSupport.deleteObject(this);
	
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public ApplicationType getAppType() {
		return appType;
	}

	public void setAppType(ApplicationType appType) {
		this.appType = appType;
	}

	public int getApplicationID() {
		return applicationID;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
}
