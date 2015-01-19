// www.jjam.de - Kontextmenü mit JavaScript - Version 15.12.2002

// Nur für IE 5+ und NN 6+
ie5=(document.getElementById && document.all && document.styleSheets)?1:0;
nn6=(document.getElementById && !document.all)?1:0;

// Kontextmenü initialisieren
if (ie5 || nn6) {
	menuWidth = 180;
	menuHeight = 120;
	menuStatus=0; 
	// Rechter Mausklick: Menü anzeigen, linker Mausklick: Menü verstecken
	document.oncontextmenu=showMenu; //oncontextmenu geht nicht bei NN 6.01
	document.onmouseup=hideMenu;
}

// Kontextmenü anzeigen
function showMenu(e) {
	menuWidth = document.getElementById("menu").clientWidth;
	menuHeight = document.getElementById("menu").clientHeight;
	if(ie5) {
		if(event.clientX>menuWidth) xPos=event.clientX-menuWidth+document.body.scrollLeft;
		else xPos=event.clientX+document.body.scrollLeft;
		if (event.clientY>menuHeight) yPos=event.clientY-menuHeight+document.body.scrollTop;
		else yPos=event.clientY+document.body.scrollTop;
	}
	else {
		if(e.pageX>document.body.clientWidth - menuWidth) xPos=e.pageX-menuWidth;
		else xPos=e.pageX;
		if(e.pageY>document.body.clientHeight - menuHeight) yPos=e.pageY-menuHeight;
		else yPos=e.pageY;
	}
	document.getElementById("menu").style.left = xPos+"px";
	document.getElementById("menu").style.top = yPos+"px";
	document.getElementById("menu").style.display = "inline";
	menuStatus=1;
	return false;
}

// Kontextmenü verstecken
function hideMenu(e) {
	if (menuStatus==1 && ((ie5 && event.button==1) || (nn6 && e.which==1))) {
		document.getElementById("menu").style.display = "none";
		setTimeout("document.getElementById('menu').style.top=-250",250);
		menuStatus=0;
	}
}

// Erkennen was geklickt wurde
$(function() {
		$('div').on('contextmenu', 'a', function(e){
		    if(this.name == "game")
	    	{
		    	clickedongame = 1;
		    	$('.gamemenu').css('display', 'inline');
		    	$('.nongame').css('display', 'none');
		    	document.getElementById("gamename").value= this.title;
	    	} else {
	    		$('.gamemenu').css('display', 'none');
	    		$('.nongame').css('display', 'inline');
	    	}
		});
		$('body').on('contextmenu', 'div', function(e){
		    if(this.id =="content" &&clickedongame != 1)
	    	{		    	
		    	$('.gamemenu').css('display', 'none');
	    		$('.nongame').css('display', 'inline');
	    	}
		    clickedongame = 0;
		});		
});

// Quelltext anzeigen
function viewSource() {
	var w=window.open("view-source:"+window.location,'','resizable=1,scrollbars=1');
}

// Seite in neuem Fenster öffnen
function openFrameInNewWindow() {
	var w=window.open(window.location,'','resizable=1,scrollbars=1,status=1,location=1,menubar=1,toolbar=1');
}