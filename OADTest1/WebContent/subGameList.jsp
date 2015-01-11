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
        <li>
          Level: 
        </li>
        <li>
          1 
        </li>
        <li>
          2 
        </li>
        <li>
          3 
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
          <h2>New Game</h2>
          <a href="#" title="New Game">
            <img src="img/new_game_btn.png" alt="New Game" />
          </a>
        </li>
        <li>
          <h2>Game 1</h2>
          <a href="game1.jsp" title="Add Game">
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