<%@ page import="java.util.List,org.ncibi.lucene.autocomplete.*,org.ncibi.lucene.MimiDocument"%>
<%
String query = request.getParameter("query");
String suggestions = "";
String geneId = "";

if(query != null) 
{

	List<AutocompleteResult> results = Autocomplete.doAutocomplete(query);
	
	for(AutocompleteResult result: results) 
	{	
		suggestions +=  ", '" + result.getMatchedString() + " : " + result.getType() + "'";
		geneId += ", " + result.getDocument().geneid;
	}
	
	suggestions = suggestions.replaceFirst(",", "");
	geneId = geneId.replaceFirst(",", "");
}	
%>
{
	query:'<%= query %>',
	suggestions:[<%= suggestions %>],
	data:[<%= geneId %>]
}


