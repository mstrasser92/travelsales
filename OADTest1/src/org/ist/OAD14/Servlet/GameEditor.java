package org.ist.OAD14.Servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ist.OAD14.Game.Node;
import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.CreatorUser;
import org.ist.OAD14.User.User;

/**
 * Servlet implementation class GameEditor
 */
@WebServlet("/GameEditor")
public class GameEditor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameEditor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("gameEditor.jsp").include(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		float xCoord = Float.parseFloat(request.getParameter("xCoord"));
		float yCoord = Float.parseFloat(request.getParameter("yCoord"));
		
		System.out.println("saveCoordinates");
		
		Node node = new Node(xCoord, yCoord); 

		HibernateSupport.beginTransaction();
		node.saveToDB();
		HibernateSupport.commitTransaction();
		
		// response.sendRedirect("gameEditor?id="+game.getUserID());
		return;		
	}
}
