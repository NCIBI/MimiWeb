<%@ page 
	import="org.ncibi.db.*,
	org.ncibi.db.metdb.Gene,
	org.ncibi.db.metdb.Pathway,
	org.ncibi.mimiweb.page.*,
	org.ncibi.util.*,
	java.io.*, 
	java.util.*, 
	net.sf.json.*"
%>
<%
//----------------------------------------------------------------------------------------------------------------------------------------//

// Page Links
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resources.url");
String geneLink = url.getString("geneLink");
String geneInteractionsLink = url.getString("geneInteractionsLink");
String genePublicationsLink = url.getString("genePublicationsLink");
String genePathwaysLink = url.getString("genePathwaysLink");
String goLink = url.getString("goLink");


//----------------------------------------------------------------------------------------------------------------------------------------//
//Page Links
String pathwayid = request.getParameter("pathwayid");
String hql = "from metdb.Pathway where pid='"+ pathwayid + "'";
String sql = "select g2p.geneid from metdb.Gene2Pathway g2p "
				+ "join metdb.Pathway p on p.id=g2p.pathwayid where p.pid='"+pathwayid+"'";
PersistenceUnit p = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("metdb"));
Pathway pathway = p.hqlQuery(p.session(), hql).single();	
Integer taxid = 9606;
List<Integer> geneids = p.sqlQuery(p.session(), sql).list();
List<String> query = new ArrayList<String>();
for(Integer geneid: geneids) {
	query.add(geneid.toString());
}
List<GeneRecord> geneRecordList = new GeneListSearch().doSearch(query, taxid);
String genes = JavascriptUtil.toJSArray(geneRecordList);

%>

<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="Pathway Details" />
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
<script src="assets/js/genetable.js" type="text/javascript"></script>
<script> 
	var genes = <%=genes%>;
	var geneLink = "<%=geneLink%>";
	var geneInteractionsLink = "<%=geneInteractionsLink%>";
	var genePublicationsLink = "<%=genePublicationsLink%>";
	var genePathwaysLink = "<%=genePathwaysLink%>";
	var goLink = "<%=goLink%>";
</script>

<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Pathway Details</div>
		<div id="pageSubTitle">Details for Pathway Entry <b><%= pathway.getName() %></b> (EHMN ID: <%= pathway.getPid() %>)</div>
	</div>
	
	<!--  PATHWAY DETAILS -------------------------------------------------------------------------------------------------------------------->
	   
	<div id="main" class="container">
		<div class="itemTitle">Genes Associated with Pathway
			<div class="lineFull"></div>
		</div>
		<div id="geneContainer"></div>		
	</div>
</div>