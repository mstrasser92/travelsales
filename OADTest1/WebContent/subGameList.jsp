<%@page import="org.ist.OAD14.Game.Level"%>
<%@page import="org.ist.OAD14.Game.Subgame"%>
<%@page import="java.util.*"%>
<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 String errorMessage = (String)request.getAttribute("errorMessage");
 List<Level> levels = (List<Level>)request.getAttribute("levels");
 List<Subgame> subgames = (List<Subgame>)request.getAttribute("subgames");
 Level current_level = (Level)request.getAttribute("current_level");
 
%>-->
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">

  <link rel="stylesheet" type="text/css" href="Stylesheets/layout.css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  
  <title>Levels and Subgames</title>
  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
  <div id="wrapper">
    <header>
      <a href="index.jsp" title="Travel Sales">
        <div id="logo">
          <img src="img/logo.png" alt="Logo" />
        </div>
      </a>
      <nav>
        <ul>
          <li>
            <a href="#" title="Show Games">
              <img src="img/show_games_btn.png" alt="Show Games"" />
            </a>
          </li>
          <li>
            <a href="#" title="Favorites">
              <img src="img/favorites_btn.png" alt="Favorites" />
            </a>
          </li>
          <li>
            <a href="#" title="Statistics">
              <img src="img/statistics_btn.png" alt="Statistics" />
            </a>
          </li>
          <li>
            <a href="#" title="Profile">
              <img src="img/profile_btn.png" alt="Profile" />
            </a>
          </li>
          <li>
            <a href="#" title="Logout">
              <img src="img/logout_btn.png" alt="Logout" />
            </a>
          </li>
        </ul>
      </nav>
    </header>
    <div class="showGames" id="content">
      <ul class="config">
        
         <%
         	if (levels.size() != 0){
	        	for (int i = 1; i <= levels.size(); i++) {
		        	%>
		        	<form method="post">
		        	<li>
			          <input type="submit" value="<%=i %>" />
			        </li>
			        <input type="hidden" name="levelID" value="<%=levels.get(i-1).getLevelID()%>">
			        </form>
			        <%
		    	}
         	}
		 %>
		 <li>
	          <a href="#" title="+">
	            + <!-- <img src="img/new_game_btn.png" alt="New Level" />  -->
	          </a>
	     </li>
		 	
        
      </ul>
      <span class="first">
        <a href="#" title="Public">
          <img src="img/public_btn.png" alt="Public" />
        </a>
      </span>
      <span>
        <a href="#" title="Private">
          <img src="img/private_btn.png" alt="Private" />
        </a>
      </span>
      <br />
      <ul>
        <li>
          <h2>New Subgame</h2>
          <a href="#" title="New Game">
            <img src="img/new_game_btn.png" alt="New Game" />
          </a>
        </li>
        
               
        <%
        	for (int i = 1; i <= subgames.size(); i++) {
	        	%>
	        	<form method="post">
	        	<li>
		          <h2>Subgame <%=i %></h2>
		          <input type="image" src="img/game_btn.png" alt="Submit Form" />
		          <p> </p>
		        </li>
		        <input type="hidden" name="subGameID" value="<%=subgames.get(i-1).getSubgameID() %>">
		        </form>
		        <%
	    	}
		 %>

      </ul>
    </div>
  </div>
</body>
</html> 