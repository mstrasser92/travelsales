	<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>-->
<%
 String errorMessage = (String)request.getAttribute("errorMessage");
 String id = (String)request.getParameter("id");
 String game = (String)request.getParameter("game");
 String notifiedSent = "none";
 if(request.getParameter("notified")!= null)
	 notifiedSent = "inline";
%>  
  
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
	<form name="notifyForm" action="SendEmail" method="get">
		<input type="hidden" name="action" value="notify"> 
		<input type="hidden" id="useridhidden" name="id" value="<%= id %>">
		<input type="hidden" name="game" value="<%= game %>">
		<textarea id="reportText" name="message" rows="10" cols="60" style="resize: none;">Your message...</textarea>
		<br>
    	<a href="javascript:void(0)" onclick="notifyForm.submit();document.getElementById('notifyAdmin').style.display = 'none'; document.getElementById('reportText').value = 'Your message...';">
    		<img style="margin-top: 10px; margin-left: 10px" src="img/send_btn.png" alt="Send" height="29" width="171"/></a>
    	<a href="javascript:void(0)" onclick="document.getElementById('notifyAdmin').style.display = 'none';">
			<img style="margin-top: 10px; margin-left: 50px;" src="img/back_btn_small.png" alt="Back" height="29" width="171"/></a>
	</form>
</div>

<div id="notified" class="overlay">
	<p style="margin-left: 20px"><br><br><br>The admin was notified successfully!<br><br><br></p>
 	<a href="javascript:void(0)" onclick="document.getElementById('notified').style.display = 'none';">
			<img style="margin-top: 10px; margin-left: 150px;" src="img/back_btn_small.png" alt="Back" height="29" width="171"/></a>
</div>
<script>document.getElementById('notified').style.display = '<%= notifiedSent%>';</script>

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
        <a class="continueBtn" href="Home?id=<%= id  %>" title="Home">
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
	             asdf: 
	          </li>
	          <li>
	            <form method="post">
		            <input type="image" id="star1" name="star1" value="1" src="img/star_empty.png" onmouseover="mouseOver(1)" onmouseout="mouseOut(1)" alt="Submit">
		            <input type="hidden" name="rating" value="1">
	         	</form>
	          </li>
	          <li>
	            <a class="star" href="#" title="2">
	              <img id="star2" src="img/star_empty.png" alt="2" onmouseover="mouseOver(2)" onmouseout="mouseOut(2)"/>
	            </a>
	          </li>
	          <li>
	            <a class="star" href="#" title="3">
	              <img id="star3" src="img/star_empty.png" alt="3" onmouseover="mouseOver(3)" onmouseout="mouseOut(3)"/>
	            </a>
	          </li>
	          <li>
	            <a class="star" href="#" title="4">
	              <img id="star4" src="img/star_empty.png" alt="4" onmouseover="mouseOver(4)" onmouseout="mouseOut(4)" />
	            </a>
	          </li>
	          <li>
	            <a class="star" href="#" title="5">
	              <img id="star5" src="img/star_empty.png" alt="5" onmouseover="mouseOver(5)" onmouseout="mouseOut(5)" />
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
  
<script>
function mouseOver(rating) {

	for(var i = 1; i <= rating; i++){
	document.getElementById("star"+i).setAttribute("src", "http://i.imgur.com/GytMyab.png");
		}
}

function mouseOut(rating) {
	for(var i = 1; i <= rating; i++){
		document.getElementById("star"+i).setAttribute("src", "http://i.imgur.com/J66ipAt.png");
			}
}
</script>
  
</body>
</html> 