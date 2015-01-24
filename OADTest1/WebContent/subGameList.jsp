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
 String levelID = request.getParameter("levelID");
 
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
		<tr class="nongame"><td><a class='menu'  href="GameEditor?id=<%= id %>" onclick="">&nbsp;&nbsp;New Subgame</a></td></tr>
		<tr class="nongame"><td><a class='menu'  href="javascript:void(0)" onclick="addLevel.submit();">&nbsp;&nbsp;New Level</a></td></tr>
		<tr class="gamemenu"><td><a class='menu'  href="javascript:void(0)" onclick="playgame();">&nbsp;&nbsp;Play&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr class="gamemenu"><td><a class='menu'  href="javascript:void(0)" onclick="">&nbsp;&nbsp;Edit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr class="gamemenu"><td><hr class='menu'>
				<form name="deleteGame">
					<input id="gameDeletionId" name="gameDeletionId" type="hidden"/>
					<input type="hidden" id="useridhidden" name="id" value="<%= id %>">
					<input type="hidden" id="gameID" name="gameID" value="<%= gameID %>">
					<input type="hidden" id="levelID" name="levelID" value="<%= levelID %>">
					<input id="action" name="action" type="hidden" value="delete" />
					<a class="menu" href="javascript:void(0)" onclick="deleteGame.submit();">&nbsp;&nbsp;Delete</a>
				</form></td></tr>
		<tr class="levelmenu"><td><hr class='menu'>
				<form name="deleteLevel">
					<input id="levelDeletionId" name="levelDeletionId" type="hidden"/>	
					<input type="hidden" id="useridhidden" name="id" value="<%= id %>">
					<input type="hidden" id="gameID" name="gameID" value="<%= gameID %>">
					<input type="hidden" id="levelID" name="levelID" value="<%= levelID %>">
					<input id="action" name="action" type="hidden" value="deleteLevel" />
					<a class="menu" href="javascript:void(0)" onclick="deleteLevel.submit();">&nbsp;&nbsp;Delete Level</a>
				</form></td></tr>
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
        	<li>
          	  <form name="level<%= i %>" method="post" action="SubGameList?id=<%=userID%>&gameID=<%=gameID%>&levelID=<%=levels.get(i-1).getLevelID()%>">
		          <a name="level" id="<%=levels.get(i-1).getLevelID()%>"href="javascript:void(0)" onclick="level<%=i%>.submit();">
		          	<div class="levelbtn">
	          			<%=i %>
		          	</div>
		          </a>
	          </form>
	        </li>
		        
		        <%
        	}
	    }
		 %>
        

		 <li>
	        <div class="levelbtn">
	        	<form name="addLevel">
					<input type="hidden" name="id" value="<%= id %>">
					<input type="hidden" name="gameID" value="<%= gameID %>">
					<input type="hidden" name="levelID" value="<%= levelID %>">
					<input id="action" name="action" type="hidden" value="addLevel" />
	        		<a href="javascript:void(0)"  onclick="addLevel.submit();" title="+">
	            	+ <!-- <img src="img/new_game_btn.png" alt="New Level" />  -->
	          		</a>
	        	</form>  
	          
          	</div>
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
        	<li>
	        	<form name="game<%=i %>" method="post">
		          <h2>Subgame <%=i %></h2>
		          <input type="image" id ="<%=subgames.get(i-1).getSubgameID() %>" name="game" src="img/game_btn.png" alt="Submit Form" />
		          <p> </p>
		        <input type="hidden" name="subGameID" value="<%=subgames.get(i-1).getSubgameID() %>">
		        </form>
		    </li>
		        <%
	    	}
		 %>

      </ul>
    </div>
  </div>
</body>
</html> 