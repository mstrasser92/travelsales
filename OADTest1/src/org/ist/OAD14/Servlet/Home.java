package org.ist.OAD14.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.User;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet 
{	
	private String userId;
	
	public String getUserId()
	{
		return userId;
	}
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userId = request.getParameter("id");

		User user = HibernateSupport.readOneObjectByID(User.class, Integer.parseInt(userId));
		
		if(user != null){
			request.setAttribute("user", user);
			request.getRequestDispatcher("home.jsp").include(request, response);
			return;
		} else {
			request.getRequestDispatcher("index.jsp").include(request, response);
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("buttonName");
		System.out.println(this.getUserId() + " wants to " + action);
		
		if(action.equals("play game"))
		{
			response.sendRedirect("GameList?id="+ this.getUserId());
			return;
		}
		if(action.equals("create game"))
		{
			response.sendRedirect("GameEditor?id="+ this.getUserId());
			return;
		}
		if(action.equals("logout"))
		{
			response.sendRedirect("Login");
			this.userId=null;
			return;
		}
	}

}
