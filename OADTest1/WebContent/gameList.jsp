<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 String errorMessage = (String)request.getAttribute("errorMessage");
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
	<table cellpadding='5' cellspacing='0' width='122' height='183' style='border-style:outset;border-width:1;border-color:#3a6c96;background-color:#4682B4'>
		<tr><td><a class='menu' href='javascript:history.back()'>&nbsp;Zur&uuml;ck</a></td></tr>
		<tr><td><a class='menu' href='javascript:history.forward()'>&nbsp;Vorw&auml;rts</a></td></tr>
		<tr><td><hr class='menu'><a class='menu' href='javascript:location.reload()'>Aktualisieren</a></td></tr>
		<tr><td><a class='menu' href='javascript:viewSource()'>Quelltext</a></td></tr>
		<tr><td><a class="menu" href="javascript:void(0)" onclick="document.getElementById('notifyAdmin').style.display = 'inline';">Notify Admin</a></td></tr>
		<tr><td><hr class='menu'><a class="menu" href="javascript:void(0)" onclick="document.getElementById('giveFeedback').style.display = 'inline';">Give Feedback</a></td></tr>
	</table>
</div>

<div id="notifyAdmin" class="overlay">
	<p>Notify Administrator about:</p>
	<textarea name="message" rows="10" cols="60" style="resize: none;">Your message...</textarea>
	<br>
    <a href="javascript:void(0)" onclick="document.getElementById('notifyAdmin').style.display = 'none';">
    	<img style="margin-top: 10px; margin-left: 10px" src="img/send_btn.png" alt="Send" height="29" width="171"/></a>
    	
    <a href="javascript:void(0)" onclick="document.getElementById('notifyAdmin').style.display = 'none';">
		<img style="margin-top: 10px; margin-left: 50px;" src="img/back_btn_small.png" alt="Back" height="29" width="171"/></a>
</div>

<div id="giveFeedback" class="overlay">
	<p>Give your Feedback:</p>
	<textarea name="message" rows="10" cols="60" style="resize: none;">Your Feedback...</textarea>
	<br>
	<input type="button" name="send" value="Send"
      onclick="document.getElementById('giveFeedback').style.display = 'none';">
    <input type="button" name="cancel" value="Cancel"
      onclick="document.getElementById('giveFeedback').style.display = 'none';">
</div>

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
          <a href="subGameList.jsp" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
        <li>
         <h2>Game 2</h2>
          <a href="#" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
        <li>
          <h2>Game 3</h2>
          <a href="#" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
        <li>
          <h2>Game 4</h2>
          <a href="#" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
        <li>
          <h2>Game 5</h2>
          <a href="#" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
        <li>
          <h2>Game 6</h2>
          <a href="#" title="Add Game">
            <img src="img/game_btn.png" alt="Game" />
          </a>
          <p>From username</p>
        </li>
      </ul>
    </div>
  </div>
</body>
</html> 


