$(document).ready(toggle);
$(window).bind('hashchange', toggle);

function toggle() 
{
	toggleHideAll();
	var toggleDiv = window.location.hash.substring(1);
	
	if(toggleDiv.length == 0) {
		toggleDiv = "main";
	}
	var toggleButton = toggleDiv + "Button";
	if(document.getElementById(toggleDiv) == null || document.getElementById(toggleButton) == null) {
		toggleDiv = "main";
		toggleButton = "mainButton";
	}
	document.getElementById(toggleDiv).style.display = "block";
	var buttonT = document.getElementById(toggleButton);
	buttonT.style.cursor = "pointer";
	buttonT.style.background = "-moz-linear-gradient(top, #E0B879 0%, #EA9F2E)";
	buttonT.style.background = "-webkit-gradient(linear, left top, left bottom, from(#E0B879), to(#EA9F2E) )";	
	buttonT.style.filter = "progid:DXImageTransform.Microsoft.gradient(startColorstr=#E0B879, endColorstr=#EA9F2E)";

}

function toggleHideAll()
{
	for(var i=0; i<tabDivs.length; i++) {
		document.getElementById(tabDivs[i]).style.display = "none";
	}
	
	for(var i=0; i<tabButtons.length; i++) {
		var button1 = document.getElementById(tabButtons[i]);
		button1.style.cursor = "pointer";
		button1.style.background = "-moz-linear-gradient(top, #9bc5e6 0%, #b3c7d7)";
		button1.style.background = "-webkit-gradient(linear, left top, left bottom, from(#9bc5e6), to(#b3c7d7) )";	
		button1.style.filter = "progid:DXImageTransform.Microsoft.gradient(startColorstr=#9bc5e6, endColorstr=#b3c7d7)";
	}
	toggleHideEmpty();
}

function toggleHideEmpty()
{
	for(var i=0; i<tabButtonsOff.length; i++) {
		var button1 = document.getElementById(tabButtonsOff[i]);
		button1.style.cursor = "default";
		button1.style.background = "-moz-linear-gradient(top, #CCC 0%, #AAA)";
		button1.style.background = "-webkit-gradient(linear, left top, left bottom, from(#CCC), to(#AAA) )";	
		button1.style.filter = "progid:DXImageTransform.Microsoft.gradient(startColorstr=#CCC, endColorstr=#AAA)";
	}
}
