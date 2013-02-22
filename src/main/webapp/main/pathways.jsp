<%@ page 
	import=
	"org.apache.commons.lang.*,
	com.google.common.base.*,
	com.google.common.io.*,
	org.ncibi.commons.io.*,
	org.ncibi.commons.collections.*,
	org.ncibi.db.*,
	org.ncibi.db.metdb.*,
	org.ncibi.db.mimi2.*,
	org.ncibi.hibernate.*,
	org.ncibi.mimiweb.model.*,
	org.ncibi.mimiweb.page.*,
	org.ncibi.util.*,
	java.io.*,
	java.util.*,
	java.nio.charset.*,
	net.sf.json.*"
%>

<%
	ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resources.url");
	String interactionid = request.getParameter("interactionid");
	String titleString = "No pathways found.";
	
	PersistenceSession mimi = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("mimi"));
	String hql = "from mimi.GeneGeneInteraction where ggIntID = " + interactionid;
	GeneGeneInteraction interaction = mimi.hqlQuery(mimi.session(), hql).single();
	
	File queryFile = new File(FileUtilities.getSystemPath("getReactomePathwaysForInteraction.sql"));
	String sql1 = 
		Files.toString(queryFile, Charsets.UTF_8)
		.replaceAll(":geneid1", String.valueOf(interaction.getGeneid1()))
		.replaceAll(":geneid2", String.valueOf(interaction.getGeneid2()));
	
	PersistenceSession reactome = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("reactome"));
	List<ReactomePathway> pathwaysList = reactome.sqlQuery(reactome.session(), sql1)
		.to(new ColumnAnnotatedResultTransformer(ReactomePathway.class)).list();
	if(pathwaysList.size() > 0)
		titleString = pathwaysList.size() + " pathways found.";
	
	String pathways = JavascriptUtil.toJSArray(pathwaysList);
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
<script src="assets/js/pathwaytable.js" type="text/javascript"></script>

<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Pathways for Gene Interactions <%= interaction.getSymbol1() %> and <%= interaction.getSymbol2() %></div>
	</div>
	<script> 
	var pathways = <%= pathways %>;
	</script>
	<div id="main" class="container">
		<div class="itemTitle"><%= titleString %>
			<div class="lineFull"></div>
		</div>
		<div id="pathwayContainer"></div>
	</div>
	
</div>