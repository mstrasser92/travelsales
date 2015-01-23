<%@page import="org.ist.OAD14.Game.Game"%>
<%@page import="java.util.*"%>
<%@page import="org.ist.OAD14.User.CreatorUser"%>
<%@page import="org.ist.OAD14.User.User"%>
<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" %>
  
<%
 User user = (User)request.getAttribute("user");
 String errorMessage = (String)request.getAttribute("errorMessage");
 List<Game> games = (List<Game>)request.getAttribute("visible_games");
 
 String id = (String)request.getParameter("id");
 String fbsent = "none";
 if(request.getParameter("feedbacksend")!= null)
	 fbsent = "inline";
 
 System.out.println("gameList.jsp Beginning");
	 
%>-->
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">

  <link rel="stylesheet" type="text/css" href="Stylesheets/layout.css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="contextMenu.js"></script>
  <script src="main.js"></script>
  <title>Show Games</title>
  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>



<div id="menu">

		<table id="contextmenu" cellpadding="5" cellspacing="0" style="">    
			<tr class="nongame"><td>
				<form name="newGame">
					<input type="hidden" id="useridhidden" name="id" value="<%= id %>">
					<input id="action" name="action" type="hidden" value="newGame" />
					<a class='menu'  href="javascript:void(0)" onclick="newGame.submit();">&nbsp;&nbsp;New Game</a>
				</form>	
			</td></tr>
			<tr class="gamemenu"><td><a class='menu'  href="javascript:void(0)" onclick="playgame();">&nbsp;&nbsp;Play</a></td></tr>
			<tr class="gamemenu"><td><a class='menu'  href="javascript:void(0)" onclick="document.getElementById('gamePreferences').style.display = 'inline';">&nbsp;&nbsp;Properties&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
			<tr class="gamemenu"><td><hr class='menu'>
				<form name="deleteGame">
					<input id="gameDeletionId" name="gameDeletionId" type="hidden" />
					<input type="hidden" id="useridhidden" name="id" value="<%= id %>">
					<input id="action" name="action" type="hidden" value="delete" />
					<a class="menu" href="javascript:void(0)" onclick="deleteGame.submit();">&nbsp;&nbsp;Delete</a>
				</form></td>
			</tr>
			<tr><td><hr class='menu'><a class="menu" href="javascript:void(0)" onclick="document.getElementById('giveFeedback').style.display = 'inline';">&nbsp;&nbsp;Give Feedback</a></td></tr>
			
			<!-- TODO: identify gameID of game that you right clicked on -- this will then be submitted to the doPost function of GameList.java-->
	    	<!--   <input type="hidden" name="gameID" value="<%=games.get(0).getGameID()%>"> -->
	    	
	    
		</table>

</div>


<div id="giveFeedback" class="overlay">
	<p>Give your Feedback:</p>
	<form name="sendFeedback" action="SendEmail" method="get">
		<input type="hidden" name="action" value="feedback"> 
		<input type="hidden" id="useridhidden" name="id" value="<%= id %>">
		<textarea id="feedbackText" onclick="if(clicked==0) value=''; clicked=1;" name="message" rows="10" cols="60" style="resize: none;">Your feedback...</textarea>
		<br>
    	<a href="javascript:void(0)" onclick="sendFeedback.submit(); document.getElementById('feedbackText').value = 'Your feedback...';clicked=0;">
    		<img style="margin-top: 10px; margin-left: 10px" src="img/send_btn.png" alt="Send" height="29" width="171"/></a>
    	<a href="javascript:void(0)" onclick="document.getElementById('giveFeedback').style.display = 'none'; clicked=0;">
			<img style="margin-top: 10px; margin-left: 50px;" src="img/back_btn_small.png" alt="Back" height="29" width="171"/></a>
	</form>
</div>

<div id="gamePreferences" class="overlay">
	<h2>Preferences</h2>
	<br>
	<form name="gamePreferences">
		<input type="hidden" name="action" value="preferences"> 
		<input type="hidden" id="useridhidden" name="id" value="<%= id %>">
		<input type="hidden" id="gameId" name="gameId" value="-1">
		<div>Name:&nbsp;<input type="text" id="gameName" name="gameName"></div>
	   	<div>Logo:
	   	<a href="javascript:void(0)" onclick="clicked=0;">
	   		<img style="align: left;margin-top: 10px; margin-left: 10px" src="img/select_btn.png" alt="Select" height="29" width="171"/></a>
	   	<img style="position:absolute; margin-left:60px;" src="img/bg_placeholder.png" alt="Logo" height="100" width="100"/></a>
	   	<br>
	   	<a href="javascript:void(0)" onclick="document.getElementById('gamePreferences').style.display = 'none'; clicked=0;">
			<img style="margin-top: 0px; margin-left: 81px;" src="img/upload_btn.png" alt="Upload" height="29" width="171"/></a>
  			
		</div>
		<div align="center">
		<a href="javascript:void(0)" style="align: center;"onclick="gamePreferences.submit();">
  			<br>
  			<img style="margin-right: 80px;"src="img/save_btn_small.png" alt="Save" height="29" width="171"/></a>
   		</div>
	</form>
</div>

<div id="feedbackSent" class="overlay">
	<p style="margin-left: 20px"><br><br><br>Your Feedback was sent successfully!<br><br><br></p>
 	<a href="javascript:void(0)" onclick="document.getElementById('feedbackSent').style.display = 'none';">
			<img style="margin-top: 10px; margin-left: 150px;" src="img/back_btn_small.png" alt="Back" height="29" width="171"/></a>
</div>
<script>document.getElementById('feedbackSent').style.display = '<%= fbsent%>';</script>

  <div id="wrapper">
    <header>
      <a href="GameList?id=<%=id%>" title="Travel Sales">
        <div id="logo">
          <img src="img/logo.png" alt="Logo" />
        </div>
      </a>
      <nav>
        <ul>
          <% if(user.getUserID() == 1){ %>
              <li>
                <a href="javascript:void(0)" onclick="return popup('UserList');" title="User">
                  <img src="img/user_btn.png" alt="Favorites" />
                </a>
              </li>
            <% } %>
            <!-- Commented because not needed -->
<!--           <li>
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
          </li> -->
          
          <li>
            <a href="Login" title="Logout">
              <img src="img/logout_btn.png" alt="Logout" />
            </a>
          </li>
        </ul>
      </nav>
    </header>
    <div class="showGames" id="content">
	Welcome back, <%=user.getUsername() %> - enjoy TravelSales! <br> <br>
      <ul>
        <li>
          <h2>New Game</h2>
          <a href="javascript:void(0)" onclick="newGame.submit();"title="New Game">
            <img src="img/new_game_btn.png" alt="New Game" />
          </a>
        </li>
        

        <%
        	for (int i = 0; i < games.size(); i++) {
	        	%>
        	<li>
        		<form name="game<%=games.get(i).getGameID()%>" method="post">
		          <h2><%=games.get(i).getName() %></h2>
		          <input id="<%=games.get(i).getGameID()%>" type="image" title="<%=games.get(i).getName() %>" name="game" src="img/game_btn.png" alt="Submit Form" />
		          <p>From <%=games.get(0).getAuthor().getUsername() %></p>
		          <input type="hidden" name="gameID" value="<%=games.get(i).getGameID()%>">
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


