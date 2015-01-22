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
              <img src="img/delete_coord_btn.png" alt="Help" onclick="deleteCoord()" />              
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
      	
      	<p id="p2">icons for nodes:</p>
		<div id="icons"></div>
		
		<p id="p3">background:</p>
		<div id="background"></div>
        
        <!--  <img src="img/icons.png" alt="" />-->
      
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
    <div id="saveCoordinates">
        <form action="post">
          <p>
            <label>x</label>
            <input name="xCoord" type="number" value="5"/> <!-- hidden, type -->
          </p>
          <p>
            <label>y</label>
            <input name="yCoord" type="number" value="5"/>
          </p>
          <input type="submit" value="">				
	    </form>
     </div>  
    <footer>
      <!--  <p id="p2">icons:</p>
		<div id="icons"></div>-->
		
	  <!--  <p id="p3">background:</p>
		<div id="background"></div>-->
    </footer>
  </div>
  
<script>


var div = document.getElementById('container');
var iconDiv = document.getElementById('icons');
var backgroundDiv = document.getElementById('background');

var circles = [];
var nodeStyle = null;

var rect = div.getBoundingClientRect();
var aSvgWidth = 690;
var aSvgHeight = 370;
var aSvg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');

aSvg.setAttribute('width', aSvgWidth);
aSvg.setAttribute('height', aSvgHeight);
aSvg.addEventListener("click", getClickPosition, false);

//Icon Box
var iconSvg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
iconSvg.setAttribute('width', 220);
iconSvg.setAttribute('height', 100);

//Background Box
var backgroundSvg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
backgroundSvg.setAttribute('width', 200);
backgroundSvg.setAttribute('height', 100);

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

function setNodeStyle(iconImg){
	nodeStyle = iconImg;
	//document.getElementById('p2').innerHTML = nodeStyle; 
}

initBorder(0, 0, aSvgWidth, aSvgHeight, aSvg);
initBorder(0, 0, 220, 100, iconSvg);
initBorder(0, 0, 200, 100, backgroundSvg);


icon0 = "http://upload.wikimedia.org/wikipedia/commons/f/f6/Smile_fasdfdsfoiueire.svg";
icon1 = "img/triangle.png";
icon2 = "img/smiley_amazed.png";
icon3 = "img/button_yellow.png";

//icon2 = "http://upload.wikimedia.org/wikipedia/commons/4/41/Triangle_warning_sign_%28black_and_yellow%29.svg"; 
//icon1 = "http://upload.wikimedia.org/wikipedia/commons/f/fb/718smiley.svg"; 
//icon3 = "http://upload.wikimedia.org/wikipedia/commons/f/f0/Button_Icon_Yellow.svg";

/*
var img = []; 
var xPos = 0;

for(var i = 0; i < 4; i += 1) {
	Alert("Test");  
	xPos = xPos + 50; 
	img[i] = document.createElementNS('http://www.w3.org/2000/svg', 'image');
	img[i].setAttribute('x', xPos);
	img[i].setAttribute('y', 0);
	img[i].setAttribute('height', 50);
	img[i].setAttribute('width', 50);
	img[i].setAttribute('onclick', 'setNodeStyle()');
	img[i].setAttributeNS('http://www.w3.org/1999/xlink','href', icons[i]);
	iconSvg.appendChild(img[i]);	
}
*/

//Images
var img = document.createElementNS('http://www.w3.org/2000/svg', 'image');
		img.setAttribute('x', 0);
		img.setAttribute('y', 0);
		img.setAttribute('height', 50);
		img.setAttribute('width', 50);
		//img.setAttribute('onclick', 'setNodeStyle()');
		img.setAttributeNS('http://www.w3.org/1999/xlink', 'href', icon0);
		img.addEventListener('click', function(){
			setNodeStyle(icon0);
		});
		iconSvg.appendChild(img);

var img1 = document.createElementNS('http://www.w3.org/2000/svg', 'image');
		img1.setAttribute('x', 55);
		img1.setAttribute('y', 0);
		img1.setAttribute('height', 50);
		img1.setAttribute('width', 50);
		img1.setAttribute('onclick', 'setNodeStyle()');
		img1.setAttributeNS('http://www.w3.org/1999/xlink','href', icon1);
		img1.addEventListener('click', function(){
			setNodeStyle(icon1);
		});
		iconSvg.appendChild(img1);

var img2 = document.createElementNS('http://www.w3.org/2000/svg', 'image');
		img2.setAttribute('x', 110);
		img2.setAttribute('y', 0);
		img2.setAttribute('height', 50);
		img2.setAttribute('width', 50);
		img2.setAttribute('onclick', 'setNodeStyle()');
		img2.setAttributeNS('http://www.w3.org/1999/xlink','href', icon2);
		img2.addEventListener('click', function(){
			setNodeStyle(icon2);
		});
		iconSvg.appendChild(img2);

var img3 = document.createElementNS('http://www.w3.org/2000/svg', 'image');
		img3.setAttribute('x', 165);
		img3.setAttribute('y', 0);
		img3.setAttribute('height', 50);
		img3.setAttribute('width', 50);
		img3.setAttribute('onclick', 'setNodeStyle()');
		img3.setAttributeNS('http://www.w3.org/1999/xlink','href', icon3);
		img3.addEventListener('click', function(){
			setNodeStyle(icon3);
		});
		iconSvg.appendChild(img3);

//Rectangles for Color
var aRect = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
		aRect.setAttribute('x', 5);
		aRect.setAttribute('y', 5);
		aRect.setAttribute('height', 40);
		aRect.setAttribute('width', 40);
		//aRect.setAttribute('onclick', 'setBackgroundColor()'); 
		aRect.setAttribute('stroke', 'black');
		aRect.setAttribute('stroke-width', '2');
		aRect.setAttribute('fill', 'red');

		aRect.addEventListener('click', function(){
				setBackgroundColor('red');
			});
		backgroundSvg.appendChild(aRect);

var aRect1 = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
		aRect1.setAttribute('x', 50);
		aRect1.setAttribute('y', 5);
		aRect1.setAttribute('height', 40);
		aRect1.setAttribute('width', 40);
		//aRect.setAttribute('onclick', 'setBackgroundColor()'); 
		aRect1.setAttribute('stroke', 'black');
		aRect1.setAttribute('stroke-width', '2');
		aRect1.setAttribute('fill', 'yellow');

		aRect1.addEventListener('click', function(){
				setBackgroundColor('yellow');
			});
		backgroundSvg.appendChild(aRect1);

var aRect2 = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
		aRect2.setAttribute('x', 95);
		aRect2.setAttribute('y', 5);
		aRect2.setAttribute('height', 40);
		aRect2.setAttribute('width', 40);
		//aRect.setAttribute('onclick', 'setBackgroundColor()'); 
		aRect2.setAttribute('stroke', 'black');
		aRect2.setAttribute('stroke-width', '2');
		aRect2.setAttribute('fill', 'green');
		
		aRect2.addEventListener('click', function(){
			setBackgroundColor('green');
		});
		backgroundSvg.appendChild(aRect2);

var aRect3 = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
		aRect3.setAttribute('x', 140);
		aRect3.setAttribute('y', 5);
		aRect3.setAttribute('height', 40);
		aRect3.setAttribute('width', 40);
		//aRect.setAttribute('onclick', 'setBackgroundColor()'); 
		aRect3.setAttribute('stroke', 'black');
		aRect3.setAttribute('stroke-width', '2');
		aRect3.setAttribute('fill', 'blue');
		
		aRect3.addEventListener('click', function(){
				setBackgroundColor('blue');
			});
		backgroundSvg.appendChild(aRect3);		

		
div.appendChild(aSvg);
iconDiv.appendChild(iconSvg);
backgroundDiv.appendChild(backgroundSvg);


function getClickPosition(e){
	var cursorX = e.clientX - rect.x;
	var cursorY = e.clientY - rect.y;
	
	temp = createCircle(cursorX, cursorY, 20, 'black', 5, 'red');
	circles.push(temp);
}

function deleteCoord(){
	circles.pop(temp); 
}
function setBackgroundColor(color){
	div.style.backgroundColor = color;  
}

</script>
  
  
</body>


</html> 