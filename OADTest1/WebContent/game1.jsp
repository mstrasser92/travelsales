<%@page import="org.ist.OAD14.User.CreatorUser"%>
<%@page import="org.ist.OAD14.User.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen" href="Stylesheets/layout.css">
<title>Game</title>
</head>
<body>
<body>

<div id="container"></div>

<script>

// General graphics container
var aSvg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
aSvg.setAttribute('width', 800);
aSvg.setAttribute('height',600);

// Scoreboard 
var sb_label_Game = document.createElementNS('http://www.w3.org/2000/svg', 'text');
var sb_label_Subgame = document.createElementNS('http://www.w3.org/2000/svg', 'text');
var sb_label_Level = document.createElementNS('http://www.w3.org/2000/svg', 'text');
var sb_label_TotalNodes = document.createElementNS('http://www.w3.org/2000/svg', 'text');
var sb_label_Score = document.createElementNS('http://www.w3.org/2000/svg', 'text');	
var sb_label_NodesConnected = document.createElementNS('http://www.w3.org/2000/svg', 'text');
var sb_label_Errors = document.createElementNS('http://www.w3.org/2000/svg', 'text');

var sb_NodesConnected = 0;
var sb_Score = 0;
var linenr = 0;

// Div that will hold aSvg
var w = document.getElementById('container');

// Points
x_coord = [50, 100, 100, 150, 200, 250, 200, 100, 300, 400, 400, 400, 500]; // jeweils 13 pkte
y_coord = [200, 350, 100, 225, 125, 350, 450, 400, 200, 100, 300, 350, 200];

// Last clicked point -> used to connect points
var last_x = -1;
var last_y = -1;

var Line = {};
var Circle = {};

Line.LINES = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]; // max. n-1 = 12 Linien
Circle.CIRCLES = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]; // n = 13 Kreise

var SVGline = function (l) {
    this.l = l;
}

var SVGcircle = function(c) {
	this.c = c;
}

for (var i = Line.LINES.length; i > -1; i -= 1) {
    Line[Line.LINES[i]] = new SVGline(Line.LINES[i]);
}

for(var i = Circle.CIRCLES.length; i > -1; i -= 1) {
	Circle[Circle.CIRCLES[i]] = new SVGcircle(Circle.CIRCLES[i]);
}

SVGline.prototype.createline = function (x1, y1, x2, y2, color, w) {
    var aLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    aLine.setAttribute('x1', x1);
    aLine.setAttribute('y1', y1);
    aLine.setAttribute('x2', x2);
    aLine.setAttribute('y2', y2);
    aLine.setAttribute('stroke', color);
    aLine.setAttribute('stroke-width', w);
    return aLine;
}

function connect(x, y){
	sb_NodesConnected += 1;
	
	if(last_x == -1 && last_y == -1){
		last_x = x;
		last_y = y;		
		return;
	}
	
	//document.getElementById('p1').innerHTML = 'new Line!' +x +y;
	var connectorLine = Line[linenr].createline(last_x, last_y, x, y, 'rgb(0,0,0)', 5);
	sb_Score += Line[linenr].myGetLength(last_x, last_y, x, y);
	sb_label_Score.textContent = 'Score: ' + sb_Score;
	sb_label_NodesConnected.textContent = 'Nodes Connected: ' + sb_NodesConnected;
	
	last_x = x;
	last_y = y;

	linenr += 1;
	aSvg.appendChild(connectorLine);

	
	
	wonEh();
}

function wonEh(){
	if(sb_NodesConnected == Circle.CIRCLES.length){
		//document.getElementById('p1').innerHTML = 'YOU WIN';
		
		alert('You win! Please evaluate the Game!', 'hi');
		
		document.location.href = 'evaluateGame.jsp';
	}
}


SVGcircle.prototype.createcircle = function(cx, cy, r, stroke, w, fill){
	var aCircle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
	aCircle.setAttribute('cx', cx);
	aCircle.setAttribute('cy', cy);
	aCircle.setAttribute('r', r);
	aCircle.setAttribute('stroke', stroke);
	aCircle.setAttribute('stroke-width', w);
	aCircle.setAttribute('fill', fill);
	aCircle.setAttribute('onclick', 'connect('+ cx + ',' + cy + ')');
	return aCircle;
}

SVGline.prototype.myGetLength = function(x1, y1, x2, y2){

	var x = 0;
	var y = 0;
	var erg = 0;
	
	if(x1 >= x2)
		x = x1 - x2;
	else
		x = x2 - x1;

	if(y1 >= y2)
		y = y1 - y2;
	else 
		y = y2 - y2;

	erg = Math.pow(x, 2) + Math.pow(y,2);
	erg = Math.sqrt(erg);
	
	return Math.floor(erg);
}

function initBoard(){
	// Border
	var border1 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
	var border2 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
	var border3 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
	var border4 = document.createElementNS('http://www.w3.org/2000/svg', 'line');

	border1.setAttribute('x1', 0);
	border1.setAttribute('y1', 0);
	border1.setAttribute('x2', 0);
	border1.setAttribute('y2', 600);
	border1.setAttribute('stroke', 'black');
	border1.setAttribute('stroke-width', 5);
	aSvg.appendChild(border1);

	
	border2.setAttribute('x1', 0);
	border2.setAttribute('y1', 0);
	border2.setAttribute('x2', 800);
	border2.setAttribute('y2', 0);
	border2.setAttribute('stroke', 'black');
	border2.setAttribute('stroke-width', 5);
	aSvg.appendChild(border2);

	border3.setAttribute('x1', 800);
	border3.setAttribute('y1', 0);
	border3.setAttribute('x2', 800);
	border3.setAttribute('y2', 600);
	border3.setAttribute('stroke', 'black');
	border3.setAttribute('stroke-width', 5);
	aSvg.appendChild(border3);

	border4.setAttribute('x1', 0);
	border4.setAttribute('y1', 600);
	border4.setAttribute('x2', 800);
	border4.setAttribute('y2', 600);
	border4.setAttribute('stroke', 'black');
	border4.setAttribute('stroke-width', 5);
	aSvg.appendChild(border4);
	
	// Scoreboard
	sb_label_Game.setAttribute('x', 600);
	sb_label_Game.setAttribute('y', 40);
	sb_label_Game.setAttribute('font-size', 14);
	sb_label_Game.textContent = 'Game: 1'
	aSvg.appendChild(sb_label_Game);

	sb_label_Subgame.setAttribute('x', 600);
	sb_label_Subgame.setAttribute('y', 60);
	sb_label_Subgame.setAttribute('font-size', 14);
	sb_label_Subgame.textContent = 'Subgame: 1'
	aSvg.appendChild(sb_label_Subgame);

	sb_label_Level.setAttribute('x', 600);
	sb_label_Level.setAttribute('y', 80);
	sb_label_Level.setAttribute('font-size', 14);
	sb_label_Level.textContent = 'Level: 1'
	aSvg.appendChild(sb_label_Level);


	sb_label_TotalNodes.setAttribute('x', 600);
	sb_label_TotalNodes.setAttribute('y', 100);
	sb_label_TotalNodes.setAttribute('font-size', 14);
	sb_label_TotalNodes.textContent = 'Total Nodes: ' + Circle.CIRCLES.length;
	aSvg.appendChild(sb_label_TotalNodes);


	sb_label_NodesConnected.setAttribute('x', 600);
	sb_label_NodesConnected.setAttribute('y', 120);
	sb_label_NodesConnected.setAttribute('font-size', 14);
	sb_label_NodesConnected.textContent = 'Nodes Connected: ' + sb_NodesConnected;
	aSvg.appendChild(sb_label_NodesConnected);

	sb_label_Score.setAttribute('x', 600);
	sb_label_Score.setAttribute('y', 140);
	sb_label_Score.setAttribute('font-size', 14);
	sb_label_Score.textContent = 'Score: 0';
	aSvg.appendChild(sb_label_Score);

}

function start() {
	initBoard();
	
	for(var i = 0; i < 12; i++){
		var circle = Circle[i].createcircle(x_coord[i], y_coord[i], 7, 'black', 1, 'black');
		aSvg.appendChild(circle);
	}

    w.appendChild(aSvg);
}

start();

</script>
</body>
</html>