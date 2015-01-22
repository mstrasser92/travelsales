package org.ist.OAD14.Servlet;

import java.io.IOException;
<<<<<<< HEAD
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
=======
>>>>>>> master

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.ist.OAD14.Game.Game;
import org.ist.OAD14.Game.Level;
import org.ist.OAD14.Game.Subgame;
=======
>>>>>>> master
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
		System.out.println("SubGameList entered");
<<<<<<< HEAD
		

		String userID = request.getParameter("id");
		User current_user = HibernateSupport.readOneObjectByID(User.class, Integer.parseInt(userID));
		
		String gameID = request.getParameter("gameID");
		Game current_game = HibernateSupport.readOneObjectByID(Game.class, Integer.parseInt(gameID));
		
		// get all levels of current game
		List<Criterion> criterions = new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("gameID", current_game.getGameID()));
		List<Level> levels = HibernateSupport.readMoreObjects(Level.class, criterions);
				
		
		// find current level so we know which subgames we should display
		String levelID = request.getParameter("levelID");
		Level current_level = new Level();
		
		if (levels.size() != 0){
			if (Integer.parseInt(levelID) == -1){	
				current_level = levels.get(0);
			}
			else{
				current_level = HibernateSupport.readOneObjectByID(Level.class, Integer.parseInt(levelID));
			}
		}
		
		// get all subgames of current level
		criterions = new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("levelID", current_level.getLevelID()));
		List<Subgame> subgames = HibernateSupport.readMoreObjects(Subgame.class, criterions);
		
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
		
		
		request.setAttribute("levels", levels);		
		request.setAttribute("current_level", current_level);
		request.setAttribute("subgames", subgames);
		request.getRequestDispatcher("subGameList.jsp").include(request, response);
		
		
=======
		request.getRequestDispatcher("SubgameList.jsp").include(request, response);
>>>>>>> master
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String currentGameID = request.getParameter("gameID");
		String currentLevelID = request.getParameter("levelID");
				
		String userId = request.getParameter("id");

		response.sendRedirect("SubGameList?id="+userId+"&gameID="+ currentGameID+"&levelID="+currentLevelID);
		
	}
	
	

}
