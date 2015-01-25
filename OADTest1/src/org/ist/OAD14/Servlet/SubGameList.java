package org.ist.OAD14.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.ist.OAD14.Game.Game;
import org.ist.OAD14.Game.Level;
import org.ist.OAD14.Game.Subgame;
import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.User;

/**
 * Servlet implementation class SubGameList
 */
@WebServlet("/SubGameList")
public class SubGameList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubGameList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("SubGameList doGet Beginning");
		
		System.out.println("Use parameter id to get current_user from DB");
		String userID = request.getParameter("id");
		//User current_user = HibernateSupport.readOneObjectByID(User.class, Integer.parseInt(userID));
		
		System.out.println("Use parameter gameID to get current_game from DB");
		String gameID = request.getParameter("gameID");
		Game current_game = HibernateSupport.readOneObjectByID(Game.class, Integer.parseInt(gameID));
	
		System.out.println("userID: " + userID);
		System.out.println("gameID: " + gameID);
		
		System.out.println("Checking for visibility changes");
		String newVisibility = request.getParameter("setVisibility");
		if(newVisibility != null) {
			Game game = HibernateSupport.readOneObjectByID(Game.class, Integer.parseInt(gameID));
			game.setVisibility(newVisibility);
			HibernateSupport.beginTransaction();
				game.saveToDB();
			HibernateSupport.commitTransaction();
			System.out.println("Game visibility changed to " + newVisibility);
		}
		
		// get all levels of current game
		System.out.println("Read levels from DB into \"levels\" object");
		List<Criterion> criterions = new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("gameID", current_game.getGameID()));
		List<Level> levels = HibernateSupport.readMoreObjects(Level.class, criterions);

		String action = "";
		if(request.getParameter("action") != null)
		{
			action = request.getParameter("action");
		}		
		if(action.equals("delete"))
		{
			System.out.println("Found argument delete");
			int gameDeletionId = Integer.parseInt(request.getParameter("gameDeletionId"));
			System.out.println("ID for Deletion is: "+String.valueOf(gameDeletionId));
			Subgame gameToDelete = HibernateSupport.readOneObjectByID(Subgame.class, gameDeletionId);
			Level current_level = HibernateSupport.readOneObjectByID(Level.class, Integer.parseInt(request.getParameter("levelID")));
			current_level.deleteSubgame(gameToDelete);
			HibernateSupport.beginTransaction();
				gameToDelete.deleteFromDB();
				current_level.saveToDB();
			HibernateSupport.commitTransaction();
			System.out.println("Game deleted");
		}
		if(action.equals("addLevel"))
		{
			System.out.println("Found argument addLevel");
			Level newLevel = new Level();
			newLevel.setGameID(current_game.getGameID());
			current_game.addLevel(newLevel);
			HibernateSupport.beginTransaction();
			newLevel.saveToDB();
			current_game.saveToDB();
			HibernateSupport.commitTransaction();
			System.out.println("Level added");
			levels = HibernateSupport.readMoreObjects(Level.class, criterions);
		}
		if(action.equals("deleteLevel"))
		{
			System.out.println("Found argument deleteLevel");
			int levelDeletionId = Integer.parseInt(request.getParameter("levelDeletionId"));
			System.out.println("ID for Deletion is: "+String.valueOf(levelDeletionId));
			Level levelToDelete = HibernateSupport.readOneObjectByID(Level.class, levelDeletionId);
			current_game.deleteLevel(levelToDelete);
			current_game.getLevels().remove(levelToDelete);
			HibernateSupport.beginTransaction();
				levelToDelete.deleteFromDB();
				current_game.saveToDB();
			HibernateSupport.commitTransaction();
			System.out.println("Game deleted");
			levels = HibernateSupport.readMoreObjects(Level.class, criterions);
		}
		
		// DEBUG
		if (levels != null)
		{
			System.out.println("levels.size(): " + levels.size());
			for (int i = 0; i < levels.size(); i++) {
				System.out.println("GameID of level " + i + ": " + levels.get(i).getGameID());
			}
		}
		else
		{
			System.out.println("levels == NULL!!");
		}


		
		// find current level so we know which subgames we should display
		
		String levelID = request.getParameter("levelID");
		Level current_level = new Level();
		
		if (levels.size() != 0){
			if (Integer.parseInt(levelID) == -1){	
				System.out.println("levelID detected as -1 --> go to level 1");
				current_level = levels.get(0);
			}
			else{
				System.out.println("levelID detected as " + Integer.parseInt(levelID) + "--> go to level " + Integer.parseInt(levelID));
				current_level = HibernateSupport.readOneObjectByID(Level.class, Integer.parseInt(levelID));
			}
		}

		System.out.println("levelID: " + Integer.parseInt(levelID));
		System.out.println("current_level ID: " + current_level.getLevelID());
		// get all subgames of current level
		System.out.println("Ret all subgames of current level");
		criterions = new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("levelID", current_level.getLevelID()));
		List<Subgame> subgames = HibernateSupport.readMoreObjects(Subgame.class, criterions);
		
		System.out.println("SubGameList Mid");
	//TODO what if there is no level?	
	
		/*
		List<Criterion> criterions = new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("levels", "public"));
		*/

		
		/*
		int num_levels = current_game.getLevels().size();
		ArrayList<ArrayList<Subgame>> levels = new ArrayList<ArrayList<Subgame>>();
		
		// number of subgames
		for (int i = 0; i < num_levels; i++)
		{
			ArrayList<Subgame> subgames = new ArrayList<Subgame>();
			int num_subgames = current_game.getLevels().get(i).getSubgames().size();
			for (int j = 0; j < num_subgames; j++)
			{
				subgames.add(current_game.getLevels().get(i).getSubgames().get(j));
			}
			levels.add(subgames);
		}
		*/
		// DEBUG
		if (levels != null)
		{
			System.out.println("levels.size(): " + levels.size());
			for (int i = 0; i < levels.size(); i++) {
				System.out.println("GameID of level " + i + ": " + levels.get(i).getGameID());
			}
		}
		else
		{
			System.out.println("levels == NULL!!");
		}
		
		System.out.println("SubGameList Near End");
		
		request.setAttribute("userID", userID);
		request.setAttribute("gameID", gameID);
		request.setAttribute("levels", levels);		
		request.setAttribute("current_level", current_level);
		request.setAttribute("subgames", subgames);
		request.getRequestDispatcher("subGameList.jsp").include(request, response);
		
		System.out.println("SubGameList End");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String currentGameID = request.getParameter("gameID");
		String currentLevelID = request.getParameter("levelID");
		String userID = request.getParameter("id");
		String setVisibility = request.getParameter("setVisibility");
		
		System.out.println("SubGameList doPost currentGameID: " + currentGameID);
		System.out.println("SubGameList doPost currentLevelID: " + currentLevelID);
		System.out.println("SubGameList doPost userID: " + userID);
		System.out.println("SubGameList doPost setVisibility: " + setVisibility);
		
		if(setVisibility != null) {
			response.sendRedirect("SubGameList?id="+userID+"&gameID="+ currentGameID+"&levelID="+currentLevelID+"&setVisibility="+setVisibility);
		}
		else {
			response.sendRedirect("SubGameList?id="+userID+"&gameID="+ currentGameID+"&levelID="+currentLevelID);
		}

	}
}
