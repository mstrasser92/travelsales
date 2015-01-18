package org.ist.OAD14.Support;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.ist.OAD14.General.Application;
import org.ist.OAD14.General.Comment;
import org.ist.OAD14.User.CreatorUser;
import org.ist.OAD14.User.User;

import org.ist.OAD14.Game.*;

/**
 * 
 * @author Stettinger
 *
 */

public class DatabaseConstruction {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("Start");
		
		Configuration configuration = new Configuration();
		
		configuration.addAnnotatedClass(User.class);
		configuration.addAnnotatedClass(Comment.class);
		configuration.addAnnotatedClass(CreatorUser.class);
		configuration.addAnnotatedClass(Application.class);
		configuration.addAnnotatedClass(Node.class);
		configuration.addAnnotatedClass(Restriction.class);
		configuration.addAnnotatedClass(Subgame.class);
		configuration.addAnnotatedClass(Level.class);
		configuration.addAnnotatedClass(Game.class);
		
		configuration.configure("hibernate.cfg.xml");

		new SchemaExport(configuration).create(true, true);

		System.out.println("Finished");
	}
	
}
