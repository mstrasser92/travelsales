package org.ist.OAD14.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.User;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class GameList
 */
@WebServlet("/UserList")
public class UserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String userId;
	
	public String getUserId()
	{
		return userId;
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		userId = request.getParameter("id");
		
		List<Criterion> criterions = new ArrayList<Criterion>();
		List<User> users = new ArrayList<User>();
		
		//criterions.add(Restrictions.eq("username", "test"));
		
		users = HibernateSupport.readMoreObjects(User.class, criterions);

		PrintWriter out = response.getWriter(); 
	    response.setContentType("text/html"); 
	    
		int i;
		out.println("<ul style='list-style-type: none; padding: 0; margin: 0; font-size: 30px;'>"); 
		for(i = 0; i < users.size(); i++){
			
				out.println("<li style='background-color:#cbcbcb; border-bottom: 2px #ffffff solid; clear: both; overflow: hidden;'>"); 
					out.println("<span style='float: left;'>" + users.get(i).getUsername() + "</span>");
					out.println("<span style='float: right;'><form method='post'><input type='submit' value='Löschen' />"
							+ "<input type='hidden' name='id' value='" + users.get(i).getUserID() + "'></form></span>"); 
				out.println("</li>"); 
		    
		}
		out.println("</ul>"); 

		request.getRequestDispatcher("user.jsp").include(request, response);
	    
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter(); 
		String userId = request.getParameter("id");
		User user = HibernateSupport.readOneObjectByID(User.class, Integer.parseInt(userId));
		HibernateSupport.beginTransaction();
		HibernateSupport.deleteObject(user);
		HibernateSupport.commitTransaction();
		
		response.sendRedirect("UserList");
	}

}
