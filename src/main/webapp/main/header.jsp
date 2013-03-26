<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resources.url");
String pageTitle = request.getParameter("pageTitle");
String basePath = url.getString("basePath");
%>
    <head>
        <title>MiMI <%= pageTitle %></title>

        <link rel="stylesheet" type="text/css" href="<%= basePath %>assets/css/template.css" />
        <link rel="stylesheet" type="text/css" href="<%= basePath %>assets/js/autocomplete/styles.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
        <script type="text/javascript" src="<%= basePath %>assets/js/autocomplete/jquery.autocomplete-min.js"></script>
        
        <script>
        
        jQuery(function(){
             var a = $('#search').autocomplete({ 
	        	 serviceUrl:'<%= basePath %>main/searchtext.jsp',
	        	 delimiter: /(,|;)\s*/,
	        	 maxHeight:300,
	        	 width:260,
	        	 zIndex: 9999,
	        	 deferRequestBy: 0,
	        	 noCache: false,
	        	 onSelect: function(value, data){ 
	        		 window.location.assign('gene?geneid=' + data);
	        	 }  
             });
        });
        
        </script>
        
		<script type="text/javascript">
		
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-1150916-6']);
	    _gaq.push(['_trackPageview']);
		
		(function() {
		var ga = document.createElement('script'); ga.type = 
		'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 
		'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; 
		s.parentNode.insertBefore(ga, s);
		})();
		</script>
    </head>
    
    <div id="toolbarLayout">
    	<div id="toolbar">	
    		<span class="toolbarItem"><a href=".">Home</a></span>   
    		<span class="toolbarItem"><a href="about">About MiMI</a></span>	
    		<span class="toolbarItem"><a href="search">Search</a></span>
    		<span class="toolbarItem"><a href="webservice">Web Service</a></span>	
    		<span class="toolbarItem"><a href="help">Help</a></span>
    		<span class="toolbarItem"><a href="contact">Contact</a></span>
    	</div>
    </div>
    

	<div id="logoLayout">
		<span class="logoTitle">Michigan Molecular Interactions</span>
	</div>
	
	
	<div id="searchBoxBasic">
		<form name="form" action="genes" method="get">
		<input id="search" type="text"  name="fullTextSearch" class="inputForm" size="35"/>
		<input type="submit" value="Search"/>
		</form>
		<span style="font-size: 9px">(Search is defaulted to Human only. Please use advance search for other organisms.)</span>
	</div>
