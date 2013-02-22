<%@ page import="org.ncibi.lucene.*,org.ncibi.mimiweb.page.*, org.ncibi.util.*, java.io.*, java.util.*, net.sf.json.*"%>


<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="Advanced Search" />
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
<script src="assets/js/proteininteractiontable.js" type="text/javascript"></script>

<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Search Results</div>
	</div>
	
<%
	ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resources.url");
	String geneLink = url.getString("geneLink");
	String gene1String = request.getParameter("gene1");
	String gene2String = request.getParameter("gene2");
	List<InteractionRecord> interactionList = new ArrayList<InteractionRecord>();
	
	if(gene1String != null && gene2String != null) {

		interactionList = (new InteractionSearch().doSearch(gene1String.trim(), gene2String.trim()));
	}
	
	String interactions = JavascriptUtil.toJSArray(interactionList);
	
	System.out.println(interactions);
	%>
	<script> 
	var proteinInteractions = <%= interactions %>;
	var geneLink =  "<%= geneLink %>";
	</script>
	<div id="main" class="container">
	  	<div class="itemTitle">Interaction List
			<div class="lineFull"></div>
		</div>
		<div id="proteinInteractionContainer"></div>
	</div>
	
</div>