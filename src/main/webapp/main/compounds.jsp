<%@ page import="org.apache.commons.lang.*,org.ncibi.db.metdb.*,org.ncibi.mimiweb.page.*, org.ncibi.util.*, java.io.*, java.util.*, net.sf.json.*"%>


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
<script src="assets/js/compoundtable.js" type="text/javascript"></script>

<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Search Results</div>
	</div>
	
<%
	ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resources.url");
	String compoundLink = url.getString("compoundLink");
	String listSearchString = request.getParameter("listSearch");
	List<CompoundRecord> compoundList = new ArrayList<CompoundRecord>();
	String titleString = "Search Results for list of 0 compounds";
	
	if(listSearchString != null && !listSearchString.isEmpty()) {
		List<String> cidList = Arrays.asList(StringUtils.split(listSearchString));
		compoundList = (new CompoundSearch().doSearch(cidList));
		titleString = "Search Results for list of " + cidList.size() + " compound";
		if(cidList.size() > 1) titleString += "s";
	}
	
	String compounds = JavascriptUtil.toJSArray(compoundList);
	%>
	<script> 
	var compounds = <%= compounds %>;
	var compoundLink =  "<%= compoundLink %>";
	</script>
	<div id="main" class="container">
	  	<div class="itemTitle"><%= titleString %>
			<div class="lineFull"></div>
		</div>
		<div id="compoundContainer"></div>
	</div>
	
</div>