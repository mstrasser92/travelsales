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
 String gameID = (String)request.getAttribute("gameID");
 String userID = (String)request.getAttribute("userID");
 String id = (String)request.getParameter("id");
 
 System.out.println("subGameList.jsp Beginning");
 
 if(levels == null){
	 System.out.println("\"levels\" is NULL!");
 }
 
 if(subgames == null){
	 System.out.println("\"subgames\" is NULL!");
 }
 
 if(current_level == null){
	 System.out.println("\"current_level\" is NULL!");
 }
%>-->

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">

  <link rel="stylesheet" type="text/css" href="Stylesheets/layout.css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="contextMenu.js"></script>

  
  <title>Levels and Subgames</title>
  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>

<div id="menu">
	<table id="contextmenu" cellpadding="5" cellspacing="0">
		<tr class="nongame"><td><a class='menu'  href="subGameList.jsp?id=<%= id %>" onclick="">&nbsp;&nbsp;New Game</a></td></tr>
		<tr class="gamemenu"><td><a class='menu'  href="subGameList.jsp?id=<%= id %>" onclick="">&nbsp;&nbsp;Play&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr class="gamemenu"><td><a class='menu'  href="javascript:void(0)" onclick=""">&nbsp;&nbsp;Edit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr class="gamemenu"><td><hr class='menu'><a class='menu' href='javascript:void(0)'>&nbsp;&nbsp;Delete</a></td></tr>
		<tr><td><hr class='menu'><a class="menu" href="javascript:void(0)" onclick="document.getElementById('giveFeedback').style.display = 'inline';">&nbsp;&nbsp;Give Feedback&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
	</table>
</div>


  <div id="wrapper">
    <header>
      <a href="GameList?id=<%=id%>" title="Travel Sales">
        <div id="logo">
          <img src="img/logo.png" alt="Logo" />
        </div>
      </a>
      <nav>
        <ul>
          <li>
            <a href="GameList?id=<%=id%>" title="Show Games">
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
	        	<form method="post" action="SubGameList?id=<%=userID%>&gameID=<%=gameID%>&levelID=<%=levels.get(i-1).getLevelID()%>">
	        	<li>
		          <input type="image" name="game" src="img/game_btn.png" width="30" height="30" alt="Submit Form" />
		          <p> </p>
		        </li>
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
          <a href="GameEditor?id=<%= id %>" title="New Game">
            <img src="img/new_game_btn.png" alt="New Game" />
          </a>
        </li>
           
        <%
        	for (int i = 1; i <= subgames.size(); i++) {
	        	%>
	        	<form method="post">
	        	<li>
		          <h2>Subgame <%=i %></h2>
		          <input type="image" name="game" src="img/game_btn.png" alt="Submit Form" />
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