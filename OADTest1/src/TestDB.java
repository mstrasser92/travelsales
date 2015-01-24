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
		
		Game game1 = new Game("Game 1", userB, "public");
		Game game2 = new Game("Game 2", userB, "public");
		Game game3 = new Game("Game 3", userB, "public");
		Game game4 = new Game("Game 4", userB, "public");
		Game game5 = new Game("Game 5", userB, "public");
		
		Level level1 = new Level();
		Level level2 = new Level();
		Level level3 = new Level();
		Level level4 = new Level();
		Level level5 = new Level();
		
		Subgame subgame1 = new Subgame();
		Subgame subgame2 = new Subgame();
		Subgame subgame3 = new Subgame();
		Subgame subgame4 = new Subgame();
		Subgame subgame5 = new Subgame();
		Subgame subgame6 = new Subgame();
		Subgame subgame7 = new Subgame();
		Subgame subgame8 = new Subgame();
		Subgame subgame9 = new Subgame();
		
		subgame1.addNode(node4);
		subgame1.addNode(node1);
		subgame1.addNode(node6);
		subgame2.addNode(node3);
		//subgame2.addNode(node6);
		subgame2.addNode(node2);
		subgame3.addNode(node5);
		//subgame3.addNode(node2);
		//subgame3.addNode(node1);
		
		level1.addSubgame(subgame1);
		//level2.addSubgame(subgame1);
		level1.addSubgame(subgame2);
		level1.addSubgame(subgame3);
		level2.addSubgame(subgame4);
		level3.addSubgame(subgame5);
		level3.addSubgame(subgame6);
		level4.addSubgame(subgame7);
		level4.addSubgame(subgame8);
		level5.addSubgame(subgame9);
		
		//game1.addLevel(level3);
		game1.addLevel(level1);
		game1.addLevel(level2);
		game1.addLevel(level3);
		game2.addLevel(level4);
		game2.addLevel(level5);
		
		HibernateSupport.beginTransaction();
		game1.saveToDB();
		game2.saveToDB();
		game3.saveToDB();
		game4.saveToDB();
		game5.saveToDB();
//		HibernateSupport.commitTransaction();
	
		level1.setGameID(game1.getGameID()); // because 		game1.addLevel(level1);
		level2.setGameID(game1.getGameID()); // etc.
		level3.setGameID(game1.getGameID()); 
		level4.setGameID(game2.getGameID());
		level5.setGameID(game2.getGameID());
		
//		HibernateSupport.beginTransaction();
		level1.saveToDB();
		level2.saveToDB();
		level3.saveToDB();
		level4.saveToDB();
		level5.saveToDB();
//		HibernateSupport.commitTransaction();
		
		subgame1.setLevelID(level1.getLevelID()); // because 		level1.addSubgame(subgame1);
		subgame2.setLevelID(level1.getLevelID()); // etc.
		subgame3.setLevelID(level1.getLevelID()); 
		subgame4.setLevelID(level2.getLevelID()); 
		subgame5.setLevelID(level3.getLevelID()); 
		subgame6.setLevelID(level3.getLevelID());
		subgame7.setLevelID(level4.getLevelID());
		subgame8.setLevelID(level4.getLevelID());
		subgame9.setLevelID(level5.getLevelID());
			
//		HibernateSupport.beginTransaction();
		subgame1.saveToDB();
		subgame2.saveToDB();
		subgame3.saveToDB();
		subgame4.saveToDB();
		subgame5.saveToDB();
		subgame6.saveToDB();
		subgame7.saveToDB();
		subgame8.saveToDB();
		subgame9.saveToDB();
//		HibernateSupport.commitTransaction();

		node1.setSubgameID(subgame1.getSubgameID());
		node2.setSubgameID(subgame2.getSubgameID());
		node3.setSubgameID(subgame2.getSubgameID());
		node4.setSubgameID(subgame1.getSubgameID());
		node5.setSubgameID(subgame3.getSubgameID());
		node6.setSubgameID(subgame1.getSubgameID());
		
//		HibernateSupport.beginTransaction();
		node1.saveToDB();
		node2.saveToDB();
		node3.saveToDB();
		node4.saveToDB();
		node5.saveToDB();
		node6.saveToDB();
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
 