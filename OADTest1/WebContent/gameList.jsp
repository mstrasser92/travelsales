<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 String errorMessage = (String)request.getAttribute("errorMessage");
 String id = (String)request.getParameter("id");
 String fbsent = "none";
 if(request.getParameter("feedbacksend")!= null)
	 fbsent = "inline";
	 
%>-->
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">

  <link rel="stylesheet" type="text/css" href="Stylesheets/layout.css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="contextMenu.js"></script>
  <title>Show Games</title>
  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>

<div id="menu">
	<table id="contextmenu" cellpadding="5" cellspacing="0" style="">
		<tr class="nongame"><td><a class='menu'  href="subGameList.jsp?id=<%= id %>" onclick="">&nbsp;&nbsp;New Game</a></td></tr>
		<tr class="gamemenu"><td><a class='menu'  href="subGameList.jsp?id=<%= id %>" onclick="">&nbsp;&nbsp;Play</a></td></tr>
		<tr class="gamemenu"><td><a class='menu'  href="javascript:void(0)" onclick="document.getElementById('gamePreferences').style.display = 'inline';">&nbsp;&nbsp;Properties&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr class="gamemenu"><td><hr class='menu'><a class='menu' href='javascript:void(0)'>&nbsp;&nbsp;Delete</a></td></tr>
		<tr><td><hr class='menu'><a class="menu" href="javascript:void(0)" onclick="document.getElementById('giveFeedback').style.display = 'inline';">&nbsp;&nbsp;Give Feedback</a></td></tr>
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
	<form name="gamePreferences" action="" method="get">
			<input type="hidden" name="action" value="preferences"> 
			<input type="hidden" id="useridhidden" name="id" value="<%= id %>">
			<div>Name:&nbsp;<input type="text" id="gamename" value=""></div>
		   	<div>Logo:
		   	<a href="javascript:void(0)" onclick="sendFeedback.submit(); clicked=0;">
		   		<img style="align: left;margin-top: 10px; margin-left: 10px" src="img/select_btn.png" alt="Select" height="29" width="171"/></a>
		   	<img style="position:absolute; margin-left:60px;" src="img/bg_placeholder.png" alt="Logo" height="100" width="100"/></a>
		   	<br>
		   	<a href="javascript:void(0)" onclick="document.getElementById('gamePreferences').style.display = 'none'; clicked=0;">
				<img style="margin-top: 0px; margin-left: 81px;" src="img/upload_btn.png" alt="Upload" height="29" width="171"/></a>
   			
   			</div>
   			<div align="center">
			<a href="javascript:void(0)" style="align: center;"onclick="document.getElementById('gamePreferences').style.display = 'none'">
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
        <li>
          <h2>Game 1</h2>
          <a name="game" href="subGameList.jsp?id=<%= id %>" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
        <li>
         <h2>Game 2</h2>
          <a name="game" href="#" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
        <li>
          <h2>Game 3</h2>
          <a name="game" href="#" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
        <li>
          <h2>Game 4</h2>
          <a name="game" href="#" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
        <li>
          <h2>Game 5</h2>
          <a name="game" href="#" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
        <li>
          <h2>Game 6</h2>
          <a name="game" href="#" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
      </ul>
    </div>
  </div>
</body>
</html> 


