<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>-->
    
<% String id = (String)request.getParameter("id");%>    

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">

  <link rel="stylesheet" type="text/css" href="Stylesheets/layout.css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  
  <title>Edit Subgame</title>
  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
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
    <div id="content" class="editSubgame">
      <div id="coordinates">
      	<div id="container"></div> <!-- HIER HIER HIER HIER HIER HIER HIER HIER HIER -->
      </div>
      <aside>
        <img src="img/icons.png" alt="" />
      </aside>
      <div id="backgroundImages">
      <span class="arrowLeft">
        <a href="#" title="Left">
          <img src="img/arrow_left.png" alt="Arrow Left" />
        </a>
      </span>
      <ul>
        <li>
          <a href="#" title="Right">
            <img src="img/bg_placeholder.png" alt="Arrow Right" />
          </a>
        </li>
        <li>
          <a href="#" title="Right">
            <img src="img/bg_placeholder.png" alt="Arrow Right" />
          </a>
        </li>
        <li>
          <a href="#" title="Right">
            <img src="img/bg_placeholder.png" alt="Arrow Right" />
          </a>
        </li>
        <li>
          <a href="#" title="Right">
            <img src="img/bg_placeholder.png" alt="Arrow Right" />
          </a>
        </li>
      </ul>
      <span class="arrowRight">
        <a href="#" title="Right">
          <img src="img/arrow_right.png" alt="Arrow Right" />
        </a>
      </span>
      </div>
    </div>
    <footer>
      <p id="p2">icons:</p>
		<div id="icons"></div>
    </footer>
  </div>
  
<script>

var div = document.getElementById('container');
var iconDiv = document.getElementById('icons');

var circles = [];
var nodeStyle = null;

var rect = div.getBoundingClientRect();
var aSvgWidth = 690;
var aSvgHeight = 370;
var aSvg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');

aSvg.setAttribute('width', aSvgWidth);
aSvg.setAttribute('height', aSvgHeight);
aSvg.addEventListener("click", getClickPosition, false);

var iconSvg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
iconSvg.setAttribute('width', 200);
iconSvg.setAttribute('height', 200);


function initBorder(x1, y1, x2, y2, svg){
	// Border
	var border1 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
	var border2 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
	var border3 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
	var border4 = document.createElementNS('http://www.w3.org/2000/svg', 'line');

	border1.setAttribute('x1', x1);
	border1.setAttribute('y1', y1);
	border1.setAttribute('x2', x1);
	border1.setAttribute('y2', y2);
	border1.setAttribute('stroke', 'black');
	border1.setAttribute('stroke-width', 5);
	svg.appendChild(border1);

	
	border2.setAttribute('x1', x1);
	border2.setAttribute('y1', y1);
	border2.setAttribute('x2', x2);
	border2.setAttribute('y2', y1);
	border2.setAttribute('stroke', 'black');
	border2.setAttribute('stroke-width', 5);
	svg.appendChild(border2);

	border3.setAttribute('x1', x2);
	border3.setAttribute('y1', y1);
	border3.setAttribute('x2', x2);
	border3.setAttribute('y2', y2);
	border3.setAttribute('stroke', 'black');
	border3.setAttribute('stroke-width', 5);
	svg.appendChild(border3);

	border4.setAttribute('x1', x1);	
	border4.setAttribute('y1', y2);
	border4.setAttribute('x2', x2);
	border4.setAttribute('y2', y2);
	border4.setAttribute('stroke', 'black');
	border4.setAttribute('stroke-width', 5);
	svg.appendChild(border4);
}

function createCircle (cx, cy, r, stroke, w, fill){
	if(nodeStyle == null){
		var aCircle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
		aCircle.setAttribute('cx', cx);
		aCircle.setAttribute('cy', cy);
		aCircle.setAttribute('r', r);
		aCircle.setAttribute('stroke', stroke);
		aCircle.setAttribute('stroke-width', w);
		aCircle.setAttribute('fill', fill);
		aSvg.appendChild(aCircle);
		return aCircle;
	}
	var anImg = document.createElementNS('http://www.w3.org/2000/svg', 'image');
	anImg.setAttribute('x', cx-20);
	anImg.setAttribute('y', cy-20);
	anImg.setAttribute('height', 40); 
	anImg.setAttribute('width', 40);
	anImg.setAttributeNS('http://www.w3.org/1999/xlink','href', nodeStyle);
	aSvg.appendChild(anImg);
	return anImg;

}

function setNodeStyle(){
	nodeStyle = icon1;
	document.getElementById('p3').innerHTML = nodeStyle;
	alert('test');
}

initBorder(0, 0, aSvgWidth, aSvgHeight, aSvg);
initBorder(0, 0, 200, 200, iconSvg);

var icon1 = "http://upload.wikimedia.org/wikipedia/commons/f/f6/Smile_fasdfdsfoiueire.svg";

var img = document.createElementNS('http://www.w3.org/2000/svg', 'image');
img.setAttribute('x', 0);
img.setAttribute('y', 0);
img.setAttribute('height', 50);
img.setAttribute('width', 50);
img.setAttribute('onclick', 'setNodeStyle()');
img.setAttributeNS('http://www.w3.org/1999/xlink','href', 'http://upload.wikimedia.org/wikipedia/commons/f/f6/Smile_fasdfdsfoiueire.svg');

iconSvg.appendChild(img);

div.appendChild(aSvg);
iconDiv.appendChild(iconSvg);

function getClickPosition(e){
	var cursorX = e.clientX - rect.x;
	var cursorY = e.clientY - rect.y;
	
	temp = createCircle(cursorX, cursorY, 20, 'black', 5, 'red');
	circles.push(temp);
}

</script>
  
  
</body>


</html> 