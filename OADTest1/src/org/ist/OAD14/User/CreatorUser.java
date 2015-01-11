package org.ist.OAD14.User;

import javax.persistence.Entity;

import org.ist.OAD14.Support.HibernateSupport;

/**
 * 
 * @author Stettinger
 *
 */

@Entity
public class CreatorUser extends User{

	private String mailAddress;
	
	//private String phone;
	
	@SuppressWarnings("unused")
	private CreatorUser(){
	}
	
	public CreatorUser(String username, String password, String mailAddress){ //, String phone
		super(username, password);
		
		this.mailAddress = mailAddress;
		//this.phone = phone;
	}
	
	public String getMailAddress() {
		return mailAddress;
	}
	
	/*public String getPhone() {
		return phone;
	}*/
	
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
