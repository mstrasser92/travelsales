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
import javax.activation.*;

/**
 * Servlet implementation class SendEmail
 */
@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Properties props = new Properties();
	    props.put("mail.smtp.host", "localhost");
	    props.put("mail.from", "admin@travelsales.com");
	    Session session = Session.getInstance(props, null);
	    
	    String message;
	    try {
	        MimeMessage msg = new MimeMessage(session);
	        msg.setFrom();
	        msg.setRecipients(Message.RecipientType.TO,
	                          "strass.michael@gmx.net");
	        msg.setSubject("You are logged in!");
	        msg.setSentDate(new Date());
	        msg.setText("Hallo");
	        Transport.send(msg);
	    } catch (MessagingException mex) {
	        System.out.println("send failed, exception: " + mex);
	    }
	}

}
