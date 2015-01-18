<%@page import="org.ist.OAD14.Game.Game"%>
<%@page import="java.util.*"%>
<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" %>
  
<%
 String errorMessage = (String)request.getAttribute("errorMessage");
 List<Game> games = (List<Game>)request.getAttribute("visible_games");
 
 
%>-->
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">

  <link rel="stylesheet" type="text/css" href="Stylesheets/layout.css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  
  <title>Show Games</title>
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
            <a href="Login" title="Logout">
              <img src="img/logout_btn.png" alt="Logout" />
            </a>
          </li>
        </ul>
      </nav>
    </header>
    <div class="showGames" id="content">
      <ul>
        <li>
          <h2>New Game</h2>
          <a href="#" title="New Game">
            <img src="img/new_game_btn.png" alt="New Game" />
          </a>
        </li>
        

        <%
        	for (int i = 0; i < games.size(); i++) {
	        	%>
	        	<form method="post">
	        	<li>
		          <h2><%=games.get(i).getName() %></h2>
		          <input type="image" src="img/game_btn.png" alt="Submit Form" />
		          <p>From <%=games.get(0).getAuthor().getUsername() %></p>
		        </li>
		        <input type="hidden" name="gameID" value="<%=games.get(i).getGameID()%>">
		        </form>
		        <%
	    	}
		 %>
		 
	            
      </ul>
    </div>
  </div>
</body>
</html> 


