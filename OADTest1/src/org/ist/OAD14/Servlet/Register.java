package org.ist.OAD14.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.CreatorUser;
import org.ist.OAD14.User.User;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("register.jsp").include(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");

		String password1 = request.getParameter("password1");
		
		String password2 = request.getParameter("password2");
		
		String mail = request.getParameter("mail");
		
		//String phone = request.getParameter("phone");
		
		System.out.println("register");
		
		
		if(isStringEmpty(username) || isStringEmpty(password1) || isStringEmpty(password2)){
			request.setAttribute("errorMessage", "Please fill out ALL fields!");
			request.getRequestDispatcher("register.jsp").include(request, response);
			return;
		}
		
		if(password1.compareTo(password2) != 0){
			request.setAttribute("errorMessage", "Your passwords do not match!");
			request.getRequestDispatcher("register.jsp").include(request, response);
			return;
		}
		
		
		User user = new CreatorUser(username, password1, mail); //, phone
		
		HibernateSupport.beginTransaction();
		user.saveToDB();
		HibernateSupport.commitTransaction();
		
		System.out.println("Send redirect from REGSITER to HOME");
		response.sendRedirect("Home?id="+user.getUserID());
		return;		
	}

	public boolean isStringEmpty(String str){
		if(str == null || str.equalsIgnoreCase(""))
			return true;
		
		return false;
	}
}
