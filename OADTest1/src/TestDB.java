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
import org.ist.OAD14.Game.*;


public class TestDB {

	public static void main(String[] args) {
		System.out.println("Start with test file");
		
		User userA = new CreatorUser("us	ername", "username", "username@oad14.at"); //, "0316 / 12345678"
		User userB = new CreatorUser("test", "test", "test@oad14.at"); //, "0316 / 987654321"

		HibernateSupport.beginTransaction();
		userA.saveToDB();
		userB.saveToDB();
		HibernateSupport.commitTransaction();
		
		// create 5 basic games
		Node node1 = new Node(12,45);
		Node node2 = new Node(23,35);
		Node node3 = new Node(34,25);
		Node node4 = new Node(34,15);
		Node node5 = new Node(56,55);
		Node node6 = new Node(67,65);
		
		Subgame subgame1 = new Subgame();
		Subgame subgame2 = new Subgame();
		Subgame subgame3 = new Subgame();
		
		Level level1 = new Level();
		Level level2 = new Level();
		Level level3 = new Level();
		
		Game game1 = new Game("Game 1", userB, "public");
		Game game2 = new Game("Game 2", userB, "public");
		Game game3 = new Game("Game 3", userB, "public");
		Game game4 = new Game("Game 4", userB, "public");
		Game game5 = new Game("Game 5", userB, "public");
		
		subgame1.addNode(node4);
		subgame1.addNode(node1);
		subgame1.addNode(node6);
		subgame2.addNode(node3);
		subgame2.addNode(node6);
		subgame2.addNode(node2);
		subgame3.addNode(node5);
		subgame3.addNode(node2);
		subgame3.addNode(node1);
		
		level1.addSubgame(subgame1);
		level2.addSubgame(subgame1);
		level2.addSubgame(subgame2);
		level3.addSubgame(subgame3);
		
		game1.addLevel(level3);
		game1.addLevel(level1);
		game2.addLevel(level2);
		game3.addLevel(level3);
		
		HibernateSupport.beginTransaction();
		game1.saveToDB();
		game2.saveToDB();
		game3.saveToDB();
		game4.saveToDB();
		game5.saveToDB();
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
 