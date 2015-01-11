package org.ist.OAD14.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.ist.OAD14.General.Comment;
import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.CreatorUser;
import org.ist.OAD14.User.User;

/**
 * Servlet implementation class ResetPassword
 */
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("resetPassword.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");		
		String password2 = request.getParameter("password2");
		
		// Check if all fields have been filled out
		if(isStringEmpty(username) || isStringEmpty(password1) || isStringEmpty(password2)){
			request.setAttribute("errorMessage", "Please fill out every field!");
			request.getRequestDispatcher("resetPassword.jsp").include(request, response);
			return;
		}
		
		// Check if both passwords match
		if(password1.compareTo(password2) != 0){
			request.setAttribute("errorMessage", "Your new passwords do not match!");
			request.getRequestDispatcher("resetPassword.jsp").include(request, response);
			return;
		}
		
		System.out.println("user: " + username + " wishes to reset their password");
		
		// Check database if user exists
		List<Criterion> criterions = new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("username", username));
		User user = HibernateSupport.readOneObject(User.class, criterions);
		
		if(user != null){
			// Set the new password entered by the user
			user.setPassword(password1);
			
			// Save changes to database
			HibernateSupport.beginTransaction();
			user.saveToDB();
			HibernateSupport.commitTransaction();
		}
		
		System.out.println("Send redirect from RESET_PASSWORD to LOGIN");
		response.sendRedirect("Login");
	}
	
	public boolean isStringEmpty(String str){
		if(str == null || str.equalsIgnoreCase(""))
			return true;
		
		return false;
	}

}
