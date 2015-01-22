package org.ist.OAD14.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.ist.OAD14.Game.*;
=======
>>>>>>> master
import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.User;

/**
 * Servlet implementation class GameList
 */
@WebServlet("/GameList")
public class GameList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String userId;
	
	public String getUserId()
	{
		return userId;
	}
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
		
		
		String userId = request.getParameter("id");
		User current_user = HibernateSupport.readOneObjectByID(User.class, Integer.parseInt(userId));
		
		//DEBUG
		/*
		Game game = new Game("Super-duper-game", current_user, "public");
		Game game2 = new Game("Best game ever", current_user, "private");
		Level level1 = new Level();
		Level level2 = new Level();
		Subgame subgame1 = new Subgame();
		Node node1 = new Node(34,56);
		subgame1.addNode(node1);
		level1.addSubgame(subgame1);
		level2.addSubgame(subgame1);
		game.addLevel(level1);
		game2.addLevel(level1);
		game2.addLevel(level2);
		*/
		
				
		List<Criterion> criterions = new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("visibility", "public"));
		
		List<Game> public_games = HibernateSupport.readMoreObjects(Game.class, criterions);
		
		criterions = new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("visibility", "private"));
		criterions.add(Restrictions.eq("author", current_user));
		
		List<Game> private_games = HibernateSupport.readMoreObjects(Game.class, criterions);
		
		List<Game> visible_games = new ArrayList<Game>();
		visible_games.addAll(public_games);
		visible_games.addAll(private_games);
		//visible_games.add(game); //DEBUG
		//visible_games.add(game2); //DEBUG
		
		request.setAttribute("visible_games", visible_games);
		request.getRequestDispatcher("gameList.jsp").include(request, response);
		return;
		
		//int num_games = ( (Integer) HibernateSupport.getCurrentSession().createQuery("select count(*) from Game").iterate().next() ).intValue();
		//for (int i = 0; i < num_games; i++){	
		//}
=======
		userId = request.getParameter("id");

		User user = HibernateSupport.readOneObjectByID(User.class, Integer.parseInt(userId));
		
		if(user != null){
			request.setAttribute("user", user);
			request.getRequestDispatcher("gameList.jsp").include(request, response);
			return;
		} else {
			request.getRequestDispatcher("index.jsp").include(request, response);
			return;
		}
>>>>>>> master
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String currentGameID = request.getParameter("gameID");
		String userId = request.getParameter("id");
		//String levelID = "0";
		response.sendRedirect("SubGameList?id="+userId+"&gameID="+ currentGameID+"&levelID=-1");


		
	}

}
