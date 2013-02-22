<%@ page 
	import=
	"org.apache.commons.lang.*,
	org.ncibi.commons.collections.*,
	org.ncibi.db.*,
	org.ncibi.db.metdb.*,
	org.ncibi.mimiweb.model.*,
	org.ncibi.mimiweb.page.*,
	org.ncibi.util.*,
	java.io.*,
	java.util.*,
	net.sf.json.*"
%>

<%
	ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resources.url");
	String interactionid = request.getParameter("interactionid");
	String pubmedLink = url.getString("pubmedLink");
	String documentLink = url.getString("documentInteractionLink").replace("??",interactionid);
	String titleString = "No documents found.";
	
	PersistenceSession mimi = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("mimi"));
	String sql0 = "select symbol1, symbol2 from denorm.GeneGeneInteraction " 
	+ "where ggIntID = " + interactionid;
	Object[] symbols = mimi.sqlQuery(mimi.session(), sql0).single();
	
	String sql1 = "select attrValue from denorm.GeneGeneInteractionAttribute attr " 
	+ "where attr.attrType='PubMed' and attr.ggIntID = " +interactionid;
	List<String> pmids = mimi.sqlQuery(mimi.session(), sql1).list();
	String pmidsString = ListUtilities.createQuotedCommaJoinedString(pmids);
	
	PersistenceSession pubmed = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("pubmed"));
	String sql2 = "select * from pubmed.dbo.Citation as c "
		+ "where c.PMID in (" + pmidsString + ")";
	List<Citation> citationsList = pubmed.sqlQuery(pubmed.session(), sql2).bind(Citation.class).list();
	if(citationsList.size() > 0) {
		titleString = citationsList.size() + " documents found.";
	}
	String citations = JavascriptUtil.toJSArray(citationsList);
%>


<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="Document List" />
</jsp:include>

<!--  CSS --------------------------------------------------------------------------------------------------------------------------------->

<style type="text/css" title="currentStyle">
	@import "assets/js/datatables/media/css/demo_page.css"; 
	@import "assets/js/datatables/media/css/demo_table_jui.css";
	@import "assets/js/datatables/extras/TableTools/media/css/TableTools.css"; 
	@import "assets/js/datatables/extras/TableTools/media/css/TableTools_JUI.css";
	@import "assets/js/jquery-ui/css/smoothness/jquery-ui-1.8.16.custom.css";
</style>

<!--  JS SCRIPT --------------------------------------------------------------------------------------------------------------------------->

<script src="assets/js/datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="assets/js/datatables/extras/TableTools/media/js/TableTools.js" type="text/javascript"></script>
<script src="assets/js/datatables/extras/TableTools/media/js/ZeroClipboard.js" type="text/javascript"></script>
<script src="assets/js/publicationtable.js" type="text/javascript"></script>

<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Documents for Gene Interactions <%= symbols[0] %> and <%= symbols[1] %></div>
	</div>
	<script> 
	var pubmedLink =  "<%= pubmedLink %>";
	var documentLink =  "<%= documentLink %>";
	var publications = <%= citations %>;
	</script>
	<div id="main" class="container">
	  	<div class="itemTitle"><%= titleString %>
			<div class="lineFull"></div>
		</div>
		<div id="publicationContainer"></div>
	</div>
	
</div>