package org.ist.OAD14.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.CreatorUser;

/**
 * Servlet implementation class SendEmail
 */
@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userId;
	private String userEmail;
	
	public String getUserId()
	{
		return userId;
	}
	
	public String getUserEmail()
	{
		return userEmail;
	}   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String message = null;
		String subject = null;
		String to = "strass.michael@gmx.net";
		String from = "admin@travelsales.com";
		
		
		
		String action = request.getParameter("action");
		
		System.out.println("Action to perform is: "+ action);
		if(action.equals("pwsend"))
		{
			String username = request.getParameter("username");
			List<Criterion> criterions = new ArrayList<Criterion>();
			criterions.add(Restrictions.eq("username", username));
			CreatorUser user = HibernateSupport.readOneObject(CreatorUser.class, criterions);
			if(user != null)
			{	
				userId = String.valueOf(user.getUserID());
				userEmail = user.getMailAddress();
			} else {
				response.sendRedirect("Login?errorMessage='No such user registered!'");
				return;
			}
			System.out.println("User is:" + userId + " und with Email: " + userEmail);
			response.sendRedirect("Login");
			if(this.userId != null)
			{
				subject = "Your password, " + user.getUsername();
				message = "Hello " + user.getUsername() + ",  \n this is your Password: " + user.getPassword();
				message += "\n \n Your TravelSales-Team";
				to = this.userEmail;
				System.out.println("Got the message set up!");
			}	
		} else if(action.equals("feedback")) {
			String id = request.getParameter("id");
			System.out.println("Got to feedback, userid: " + id);
			this.userId = id;
			if(this.userId != null)
			{
				CreatorUser user = HibernateSupport.readOneObjectByID(CreatorUser.class, Integer.parseInt(id));
				String userName = user.getUsername();
				String userMail = user.getMailAddress();
				subject = "Feedback from " + userName;
				message = "This is a Feedback from User: " + userName;
				message += "\n with E-Mail: " + userMail;
				message += "\n This is the feedback: \n";
				message += request.getParameter("message");
				System.out.println("Got the message set up!");
				response.sendRedirect("GameList?id="+ this.getUserId()+"&feedbacksend=true");
			}
		} else if(action.equals("notify")) {
			String id = request.getParameter("id");
			System.out.println("Got to feedback, userid: " + id);
			this.userId = id;
			if(this.userId != null)
			{
				CreatorUser user = HibernateSupport.readOneObjectByID(CreatorUser.class, Integer.parseInt(id));
				String userName = user.getUsername();
				String userMail = user.getMailAddress();
				subject = "Improper Content reported from " + userName;
				message = "The following User reported improper Content: " + userName;
				message += " \n with E-Mail: " + userMail;
				message += " \n in Game: " + request.getParameter("game");
				message += " \n This is the additional Message: \n";
				message += request.getParameter("message");
				System.out.println("Got the message set up!");
				response.sendRedirect("evaluateGame.jsp?id="+ this.getUserId()+"&notified=true&game="+request.getParameter("game"));
			}
		} else {
			response.sendRedirect("Login");
		}
			
		
		if(message != null)
		{
			Properties props = new Properties();
		    props.put("mail.smtp.host", "localhost");
		    props.put("mail.from", from);
		    Session session = Session.getInstance(props, null);
		    
		    try {
		        MimeMessage msg = new MimeMessage(session);
		        msg.setFrom();
		        msg.setRecipients(Message.RecipientType.TO, to);
		        msg.setSubject(subject);
		        msg.setSentDate(new Date());
		        msg.setText(message);
		        Transport.send(msg);
		    } catch (MessagingException mex) {
		        System.out.println("send failed, exception: " + mex);
		    }
		    System.out.println("Message was sent successfully!");
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
}
