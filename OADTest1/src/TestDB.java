import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.ist.OAD14.General.Application;
import org.ist.OAD14.General.Comment;
import org.ist.OAD14.General.Application.ApplicationType;
import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.CreatorUser;
import org.ist.OAD14.User.User;


public class TestDB {

	public static void main(String[] args) {
		System.out.println("Start with test file");
		
		User userA = new CreatorUser("us	ername", "username", "username@oad14.at"); //, "0316 / 12345678"
		User userB = new CreatorUser("test", "test", "test@oad14.at"); //, "0316 / 987654321"

		HibernateSupport.beginTransaction();
		userA.saveToDB();
		userB.saveToDB();
		HibernateSupport.commitTransaction();
		
		User readUser = HibernateSupport.readOneObjectByID(User.class, 1);
		User readUser2 = HibernateSupport.readOneObjectByID(User.class, 2);
		
		
				
		if(readUser != null){
			System.out.println("User read from DB: " + readUser.getUsername() + " pw: " + readUser.getPassword());
		}
		
		if(readUser2 != null){
			System.out.println("User read from DB: " + readUser2.getUsername() + " pw: " + readUser2.getPassword());
		}
		
		Comment comment = new Comment(readUser, "Hallo, das ist mein erstes Kommentar");
		Comment comment2 = new Comment(readUser2, "Hallo, kommentar #2");
		Comment comment3 = new Comment(readUser, "im with stupid");
		
		HibernateSupport.beginTransaction();
		comment.saveToDB();
		HibernateSupport.commitTransaction();
		
		HibernateSupport.beginTransaction();
		comment2.saveToDB();
		HibernateSupport.commitTransaction();

		HibernateSupport.beginTransaction();
		comment3.saveToDB();
		HibernateSupport.commitTransaction();
		
		List<Criterion> criterions = new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("originator", readUser));
		List<Comment> commentsFromUser = HibernateSupport.readMoreObjects(Comment.class, criterions);

		
		if(commentsFromUser != null){
			for(Comment c: commentsFromUser){
				System.out.println("Comment: " + c.getComment() + " from user: " + c.getOriginator().getUsername());
			}
		}
		
		Application app = new Application("Meine erste Applikation", ApplicationType.Game1);
		
		HibernateSupport.beginTransaction();
		app.saveToDB();
		HibernateSupport.commitTransaction();
		
		System.out.println("Finished with test file");

	}
	
	

}
 