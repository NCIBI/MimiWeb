<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%
String taxidString = request.getParameter("taxid");
String searchOptionString = request.getParameter("searchOption");
String fullTextSearchString = request.getParameter("fullTextSearch");
String queryFieldString = request.getParameter("queryField");
String listSearchString = request.getParameter("listSearch");

if(request.getParameter("searchOption").equals("fullText") || (request.getParameter("searchOption").equals("list") &&
   request.getParameter("typeSelection").equals("genes")) ) 
{
%>
	<jsp:forward page="genes">
		<jsp:param name="searchOption" value="<%= searchOptionString %>" />
		<jsp:param name="taxid" value="<%= taxidString %>" />
		<jsp:param name="fullTextSearch" value="<%= fullTextSearchString %>" />
		<jsp:param name="queryField" value="<%= queryFieldString %>" />
		<jsp:param name="listSearch" value="<%= listSearchString %>" />
	</jsp:forward>
<%
} 
else if(request.getParameter("searchOption").equals("list") && request.getParameter("typeSelection").equals("compounds")) 
{
%>
	<jsp:forward page="compounds">
		<jsp:param name="searchOption" value="<%= searchOptionString %>" />
		<jsp:param name="taxid" value="<%= taxidString %>" />
		<jsp:param name="fullTextSearch" value="<%= fullTextSearchString %>" />
		<jsp:param name="queryField" value="<%= queryFieldString %>" />
		<jsp:param name="listSearch" value="<%= listSearchString %>" />
	</jsp:forward>
<%
} 
else if(request.getParameter("searchOption").equals("geneInteraction")) 
{
	String gene1 = request.getParameter("gene1");
	String gene2 = request.getParameter("gene2");
	System.out.println("gene1 " + gene1);
	System.out.println("gene2 " + gene2);
%>
	<jsp:forward page="interactions">
		<jsp:param name="gene1" value="<%= gene1 %>" />
		<jsp:param name="gene2" value="<%= gene2 %>" />
	</jsp:forward>
<%
}
%>