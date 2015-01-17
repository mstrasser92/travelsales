<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">

  <link rel="stylesheet" type="text/css" href="Stylesheets/layout.css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  
  <title>Evalute Game</title>
  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<div id="notifyAdmin" class="overlay">
	<p>Notify Administrator about:</p>
	<textarea name="message" rows="10" cols="60" style="resize: none;">Your message...</textarea>
	<br>
    <a href="javascript:void(0)" onclick="document.getElementById('notifyAdmin').style.display = 'none';">
    	<img style="margin-top: 10px; margin-left: 10px" src="img/send_btn.png" alt="Send" height="29" width="171"/></a>
    	
    <a href="javascript:void(0)" onclick="document.getElementById('notifyAdmin').style.display = 'none';">
		<img style="margin-top: 10px; margin-left: 50px;" src="img/back_btn_small.png" alt="Back" height="29" width="171"/></a>
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
            <a href="#" title="Add Coord">
              <img src="img/add_coord_btn.png" alt="Help" />
            </a>
          </li>
          <li>
            <a href="#" title="Delete Coord">
              <img src="img/delete_coord_btn.png" alt="Help" />
            </a>
          </li>
          <li>
            <a href="#" title="Save">
              <img src="img/save_btn.png" alt="Help" />
            </a>
          </li>
          <li>
            <a href="#" title="Back">
              <img src="img/back_btn.png" alt="Help" />
            </a>
          </li>
          <li>
            <a href="#" title="Logout">
              <img src="img/logout_btn.png" alt="Help" />
            </a>
          </li>
        </ul>
      </nav>
    </header>
    <div id="content" class="evaluate">
      <aside>
        <h2>Next Games</h2>
        <ul>
          <li>
            <a href="#" title="">
              <img src="img/game_tsr.png" alt="Game Teaser" />
            </a>
          </li>
          <li>
            <a href="#" title="">
              <img src="img/game_tsr.png" alt="Game Teaser" />
            </a>
          </li>
          <li>
            <a href="#" title="">
              <img src="img/game_tsr.png" alt="Game Teaser" />
            </a>
          </li>
        </ul>
      </aside>
      <div id="results">
        <h2>Results</h2>
        <p>Length:</p>
        <p>1 of 5 restrictions</p>
        <a class="continueBtn" href="Home?id=2" title="Logout">
          <img src="img/continue_btn.png" alt="continue" />
        </a>
      </div>
      

      
      <div id="rate">
      	<table>
      	 <tr>
     	   <td>
      		<a href="javascript:void(0)" onclick="document.getElementById('notifyAdmin').style.display = 'inline';">
			<img style="margin-left: 20px;" src="img/report_btn.png" alt="Back" height="28" width="128"/></a>
      	  </td>
      	  <td>
	        <ul>
	          <li>
	             Evaluate: 
	          </li>
	          <li>
	            <a class="star" href="#" title="1">
	              <img src="img/star_empty.png" alt="1" />
	            </a>
	          </li>
	          <li>
	            <a class="star" href="#" title="2">
	              <img src="img/star_empty.png" alt="2" />
	            </a>
	          </li>
	          <li>
	            <a class="star" href="#" title="3">
	              <img src="img/star_empty.png" alt="3"/>
	            </a>
	          </li>
	          <li>
	            <a class="star" href="#" title="4">
	              <img src="img/star_empty.png" alt="4" />
	            </a>
	          </li>
	          <li>
	            <a class="star" href="#" title="5">
	              <img src="img/star_empty.png" alt="5" />
	            </a>
	          </li>
	        </ul>
	        </td>
	        <td>
	        <ul class="average">
	          <li>
	             Average: <b>4</b>
	          </li>
	      	</ul>
		    </td>
          </tr>
        </table>
      </div>
    </div>
    <footer>
      
    </footer>
  </div>
</body>
</html> 