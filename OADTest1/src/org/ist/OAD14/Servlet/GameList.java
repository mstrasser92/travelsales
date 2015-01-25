package org.ist.OAD14.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.ist.OAD14.Game.*;
import org.ist.OAD14.Support.HibernateSupport;
import org.ist.OAD14.User.User;

/**
 * Servlet implementation class GameList
 */
@WebServlet("/GameList")
public class GameList extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
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
		
		System.out.println("GameList Beginning");
		String userId = request.getParameter("id");
		System.out.println("GameList doGet userId: " + userId);
		User current_user = HibernateSupport.readOneObjectByID(User.class, Integer.parseInt(userId));
		
		String action = "";
		if(request.getParameter("action") != null)
		{
			action = request.getParameter("action");
		}
		
		if(action.equals("preferences"))
		{
			System.out.println("Found argument preferences");
			int gameId = Integer.parseInt(request.getParameter("gameId"));
			Game gameToUpdate = HibernateSupport.readOneObjectByID(Game.class, gameId);
			gameToUpdate.setName(request.getParameter("gameName"));
			
			System.out.println("Got game set up to save with params: " + String.valueOf(gameId) + " name:" + request.getParameter("gameName"));
			HibernateSupport.beginTransaction();
				gameToUpdate.saveToDB();
			HibernateSupport.commitTransaction();
		}
		
		if(action.equals("delete"))
		{
			System.out.println("Found argument delete");
			int gameDeletionId = Integer.parseInt(request.getParameter("gameDeletionId"));
			Game gameToDelete = HibernateSupport.readOneObjectByID(Game.class, gameDeletionId);
			HibernateSupport.beginTransaction();
				gameToDelete.deleteFromDB();
			HibernateSupport.commitTransaction();
			System.out.println("Game deleted");
		}
		
		if(action.equals("newGame"))
		{
			System.out.println("Found argument newGame");
			Game newGame = new Game("Your new Game", current_user, "public", "standard.png");
			Level newLevel = new Level();
			newGame.addLevel(newLevel);
			HibernateSupport.beginTransaction();
				newGame.saveToDB();
				newLevel.setGameID(newGame.getGameID());
				newLevel.saveToDB();
			HibernateSupport.commitTransaction();
			System.out.println("Game created");
		}

		
		// Check that we have a file upload request
		// Code adapted from http://www.developershome.com/wap/wapUpload/wap_upload.asp?page=jsp
		System.out.println("Before processing file upload request");
		System.out.println("isMultipartcontent: " + ServletFileUpload.isMultipartContent(request));
		if(ServletFileUpload.isMultipartContent(request)){
			System.out.println("Detected that user wants to upload a file");
			
			ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
			try {
				List<FileItem> fileItemsList = servletFileUpload.parseRequest(request);
				
				Iterator<FileItem> it = fileItemsList.iterator();
				while (it.hasNext()){
				  FileItem fileItem = (FileItem)it.next();
				  if (fileItem.isFormField()){
				    /* The file item contains a simple name-value pair of a form field */
				  }
				  else{
				    /* The file item contains an uploaded file */
					System.out.println("File upload identified");
				  }
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}
		System.out.println("After processing file upload request");
		

				
		
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
		
		System.out.println("GameList Near End");
		
		// root path of server
		String path = getServletContext().getRealPath("/");
		request.setAttribute("path", path);
		System.out.println("path: " + path);
		
		request.setAttribute("visible_games", visible_games);
		request.setAttribute("user", current_user);
		request.getRequestDispatcher("gameList.jsp").include(request, response);
		return;
		
		//int num_games = ( (Integer) HibernateSupport.getCurrentSession().createQuery("select count(*) from Game").iterate().next() ).intValue();
		//for (int i = 0; i < num_games; i++){	
		//}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GameList doPost Beginning");
		String gameID = "-1";
		String userID = "-1";
		String imageID;
		String imageName;
		if (ServletFileUpload.isMultipartContent(request)){
			System.out.println("isMultipartContent: " + ServletFileUpload.isMultipartContent(request));
    		
		    // Adapted from http://stackoverflow.com/questions/2422468/how-to-upload-files-to-server-using-jsp-servlet
		    try {
		        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
		        for (FileItem item : items) {
		        	// process all the inputs (userID, gameID, ...)
		        	// Process regular form field (input type="text|radio|checkbox|etc", select, etc).
		            if (item.isFormField()) {

		            	System.out.println("Form detected");
		            	System.out.println("FieldName: " + item.getFieldName());
			        	System.out.println("=============================" + item.getString());
		            	if(item.getFieldName().equals("gameId")){
		            		gameID = item.getString();
			            	System.out.println("gameID: " + gameID);
		            	}
		            	if(item.getFieldName().equals("id")){
		            		userID = item.getString();
		            		System.out.println("userID: " + userID);
		            	}

		        		//Game currentGame = HibernateSupport.readOneObjectByID(Game.class, Integer.parseInt(gameIDLogo));

		        		//response.sendRedirect("GameList?id="+userIDLogo);
		        		
		            	System.out.println("=================");
		                

		            } else { // process the uploaded image
		            	System.out.println("File detected");
		                // Process form file field (input type="file").
		                imageID = item.getFieldName();
		                imageName = FilenameUtils.getName(item.getName());
		                System.out.println("imageID: " + imageID);
		                System.out.println("imageName: " + imageName);
		                //String context_path = request.getContextPath();
		                //String path = "C:\\xampp\\tomcat\\webapps\\uploads\\" + imageName;
		                String path = getServletContext().getRealPath("/") + "uploads" + File.separator + imageName;
		                File file = new File(path);
		                System.out.println("SAVING PATH: " + path);
		                item.write(file);
		                
		                System.out.println("before database");
		                System.out.println("gameID: " + gameID);
		    			Game gameToUpdate = HibernateSupport.readOneObjectByID(Game.class, Integer.parseInt(gameID));
		                System.out.println("after database");
		    			System.out.println("gameToUpdate gameID: " + gameToUpdate.getGameID());
		    			System.out.println("gameToUpdate gameID: " + gameToUpdate.getLogo());
		    			System.out.println("gameID: " + gameID);

		    			gameToUpdate.setLogo(imageName);
		    			
		    			System.out.println("setLogo: " + imageName);
		    			HibernateSupport.beginTransaction();
		    				gameToUpdate.saveToDB();
		    			HibernateSupport.commitTransaction();
		    			
		    			response.sendRedirect("GameList?id="+userID);
		    			System.out.println("GameList doPost End");
		            }
		        }

		        
		    } catch (FileUploadException e) {
		        throw new ServletException("Cannot parse multipart request.", e);
		    } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		}
		else {
		String currentGameID = request.getParameter("gameID");
		String userId = request.getParameter("id");
		System.out.println("GameList doPost GameID: " + currentGameID);
		System.out.println("GameList doPost userId: " + userId);
		Game currentGame = HibernateSupport.readOneObjectByID(Game.class, Integer.parseInt(currentGameID));
		String levelID = "-1";
		if(!currentGame.getLevels().isEmpty())
			levelID = String.valueOf(currentGame.getLevels().get(0).getLevelID());
		response.sendRedirect("SubGameList?id="+userId+"&gameID="+ currentGameID+"&levelID="+levelID);
		System.out.println("GameList doPost End");
		}


  }
}
