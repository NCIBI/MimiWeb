<%@ page import="org.apache.commons.lang.*,org.ncibi.mimiweb.page.*,org.ncibi.util.*,java.io.*,java.util.*,net.sf.json.*"%>
<%
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resources.url");
String basePath = url.getString("basePath");
%>

<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="Search Results" />
</jsp:include>

<!--  CSS --------------------------------------------------------------------------------------------------------------------------------->

<link rel="stylesheet" type="text/css" href="<%= basePath %>assets/js/datatables/media/css/demo_page.css" />
<link rel="stylesheet" type="text/css" href="<%= basePath %>assets/js/datatables/media/css/demo_table_jui.css" />
<link rel="stylesheet" type="text/css" href="<%= basePath %>assets/js/datatables/extras/TableTools/media/css/TableTools.css" />
<link rel="stylesheet" type="text/css" href="<%= basePath %>assets/js/datatables/extras/TableTools/media/css/TableTools_JUI.css" />
<link rel="stylesheet" type="text/css" href="<%= basePath %>assets/js/jquery-ui/css/smoothness/jquery-ui-1.8.16.custom.css" />

<!--  JS SCRIPT --------------------------------------------------------------------------------------------------------------------------->

<script src="<%= basePath %>assets/js/datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="<%= basePath %>assets/js/datatables/extras/TableTools/media/js/TableTools.js" type="text/javascript"></script>
<script src="<%= basePath %>assets/js/datatables/extras/TableTools/media/js/ZeroClipboard.js" type="text/javascript"></script>
<script src="<%= basePath %>dwr/interface/CountWebService.js" type="text/javascript"></script>
<script src="<%= basePath %>dwr/engine.js" type="text/javascript"></script>
<script src="<%= basePath %>dwr/util.js" type="text/javascript"></script>
<script src="<%= basePath %>assets/js/genetable.js" type="text/javascript"></script>

<%
	String geneLink = url.getString("geneLink");
	String geneInteractionsLink = url.getString("geneInteractionsLink");
	String genePublicationsLink = url.getString("genePublicationsLink");
	String genePathwaysLink = url.getString("genePathwaysLink");
	String goLink = url.getString("goLink");

	String taxidString = request.getParameter("taxid");
	String searchOptionString = request.getParameter("searchOption");
	String fullTextSearchString = request.getParameter("fullTextSearch");
	String queryFieldString = request.getParameter("queryField");
	String listSearchString = request.getParameter("listSearch");
	
	System.out.println("taxid " + taxidString);
	System.out.println("searchOptionString " + searchOptionString);
	System.out.println("fullTextSearchString " + fullTextSearchString);
	System.out.println("queryFieldString " + queryFieldString);
	System.out.println("listSearchString " + listSearchString);
	
	List<GeneRecord> geneRecordList = new ArrayList<GeneRecord>();
	String titleString = "Search Results";
	Integer taxid = 9606;

	if ((searchOptionString == null || searchOptionString.equals("fullText"))) 
	{
		if (fullTextSearchString != null && !fullTextSearchString.isEmpty()) 
		{
			try 
			{
				taxid = Integer.decode(taxidString);
			} 
			catch (Throwable t) 
			{ 
				System.out.println(t);
			}
			
			String query = "";
			if (queryFieldString != null && !queryFieldString.isEmpty())
			{
				query = queryFieldString + ":";
			}
			query = query + fullTextSearchString.trim();
			geneRecordList = (new GeneSearch().doSearch(query, taxid));
			titleString = "Search Results for '" + query + "'";
			%>
			<script src="assets/js/counts.js" type="text/javascript"></script>
			<%
		}
	}
	else if ((searchOptionString != null && searchOptionString.equals("list"))) 
	{
		titleString = "Search Results for list of 0 genes";
		if (listSearchString != null && !listSearchString.isEmpty()) 
		{
			List<String> geneIdOrSymbolList = Arrays.asList(StringUtils.split(listSearchString));
			taxid = Integer.decode(taxidString);
			geneRecordList = (new GeneListSearch().doSearch(geneIdOrSymbolList, taxid));
			titleString = "Search Results for list of "+ geneIdOrSymbolList.size() + " gene";
					
			if(geneIdOrSymbolList.size() > 1)
			{
				titleString += "s";
			}
		}
	}

	String genes = JavascriptUtil.toJSArray(geneRecordList);
%>

<script> 
	var search = "<%=fullTextSearchString%>";
	var taxid = <%=taxid%>;
	var genes = <%=genes%>;
	var geneLink = "<%=geneLink%>";
	var geneInteractionsLink = "<%=geneInteractionsLink%>";
	var genePublicationsLink = "<%=genePublicationsLink%>";
	var genePathwaysLink = "<%=genePathwaysLink%>";
	var goLink = "<%=goLink%>";
</script>

<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Search Results</div>
	</div>
	
	<div id="main" class="container">
		<span id="gene2mesh-gene-count-here"></span>
		<span id="gene2mesh-mesh-count-here"></span>
		<span id="conceptgen-count-here"></span>
	  	<div class="itemTitle"><%=titleString%>
			<div class="lineFull"></div>
		</div>
		<div id="geneContainer"></div>
	</div>
	
</div>