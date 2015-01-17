package org.ist.OAD14.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").include(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		
		System.out.println(username + ":" + password + "trying to log in");
		
		List<Criterion> criterions = new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("username", username));
		criterions.add(Restrictions.eq("password", password));
		
		User user = HibernateSupport.readOneObject(User.class, criterions);
		
		if(user == null)
		{
			System.out.println("Login failed");
			request.setAttribute("errorMessage", "Login failed");
			request.getRequestDispatcher("login.jsp").include(request, response);
			return;
		}
		System.out.println("user: " + user.getUsername() + " password: " + user.getPassword() + " logged in");
		System.out.println("Send redirect from LOGIN to HOME");
		response.sendRedirect("Home?id="+user.getUserID());
		
		
		Properties props = new Properties();
	    props.put("mail.smtp.host", "localhost");
	    props.put("mail.from", "admin@travelsales.com");
	    Session session = Session.getInstance(props, null);
	    
	    String message;
	    message = "Hello "+ user.getUsername() + ", you are logged in now!";

	    try {
	        MimeMessage msg = new MimeMessage(session);
	        msg.setFrom();
	        msg.setRecipients(Message.RecipientType.TO,
	                          "strass.michael@gmx.net");
	        msg.setSubject("You are logged in!");
	        msg.setSentDate(new Date());
	        msg.setText(message);
	        Transport.send(msg);
	    } catch (MessagingException mex) {
	        System.out.println("send failed, exception: " + mex);
	    }
	}

}
