<%@ page 
	import="org.ncibi.db.*,
	org.ncibi.db.metdb.Compound,
	org.ncibi.db.metdb.ReactionEquationDenorm,
	org.ncibi.mimiweb.model.*,
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
String reactionLink = url.getString("reactionLink");
String keggCompoundLink = url.getString("keggCompoundLink");
String metscapeCompoundLink = url.getString("metscapeCompoundLink");
String cid = request.getParameter("cid");

//----------------------------------------------------------------------------------------------------------------------------------------//
//Page Links

PersistenceUnit p = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("metdb"));
String hql = "from metdb.Compound where cid='" +cid + "'";
Compound c = p.hqlQuery(p.session(), hql).single();	

String sql = "select rd.* from humdb.metdb.ReactionEquationDenorm rd"
	+ " join humdb.metdb.Reaction r on r.rid = rd.rid" 
	+ " join humdb.metdb.Compound2Reaction c2r on c2r.reactionid = r.id"
	+ " join humdb.metdb.Compound c on c.id = c2r.compoundid and c.cid ='"+cid+"'";
List<ReactionEquationDenorm> reactionList = p.sqlQuery(p.session(), sql).bind(ReactionEquationDenorm.class).list();


PathwayJSTableModel pathways = new PathwayJSTableModel(c.getPathways());
ReactionJSTableModel reactions = new ReactionJSTableModel(reactionList);


//----------------------------------------------------------------------------------------------------------------------------------------//
// Tab Buttons  

String tabButtonsOff = "";
if(c.getPathways().isEmpty()){ tabButtonsOff += ",\"pathwaysButton\"";}
if(c.getReactions().isEmpty()) {tabButtonsOff += ",\"reactionsButton\"";}


tabButtonsOff = tabButtonsOff.replaceFirst(",", "");

//----------------------------------------------------------------------------------------------------------------------------------------//
// Null Validation

if(c.getName().equals("null")) { c.setName("");}
if(c.getCid().equals("null")) { c.setCid("");}
if(c.getFormula().equals("null")) { c.setFormula("");}
if(c.getCasnum().equals("null")) { c.setCasnum("");}
if(c.getSmile().equals("null")) { c.setSmile("");}

%>
<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="Compound Details" />
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

<script src="assets/js/pagetabs.js" type="text/javascript"></script>
<script src="assets/js/datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="assets/js/datatables/extras/TableTools/media/js/TableTools.js" type="text/javascript"></script>
<script src="assets/js/datatables/extras/TableTools/media/js/ZeroClipboard.js" type="text/javascript"></script>
<script src="assets/js/pathwaytable.js" type="text/javascript"></script>
<script src="assets/js/reactiontable.js" type="text/javascript"></script>

<script>



var tabButtons = ["mainButton","pathwaysButton", "reactionsButton"];
var tabButtonsOff = [<%= tabButtonsOff %>];			
var tabDivs = ["main","pathways", "reactions"];

var reactionLink = "<%= reactionLink %>";
var keggCompoundLink = "<%= keggCompoundLink %>";
var metscapeCompoundLink = "<%= metscapeCompoundLink %>";
var pathways = <%= pathways %>;
var reactions = <%= reactions %>;

</script>

<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Compound Details</div>
		<div id="pageSubTitle">Details for Compound Entry <b><%= c.getName() %></b> (KEGG ID: <%= c.getCid() %>)</div>
	</div>
	
	<!--  TABS ---------------------------------------------------------------------------------------------------------------------------->

	<div id="pageTabs">
		<a id="mainButton" class="css3ButtonOff" href = "#">Compound Info</a>
		<a id="pathwaysButton" class="css3ButtonOff" 
<% 			if (!c.getPathways().isEmpty()) {%>
		href = "#pathways"
<% 			} %>>Pathways</a>
		<a id="reactionsButton" class="css3ButtonOff" 
<% 			if (!c.getReactions().isEmpty()) {%>
		href = "#reactions"
<% 			} %>>Reactions</a>	
	</div>
	
	<!--  COMPOUND DETAILS -------------------------------------------------------------------------------------------------------------------->
	   
	<div id="main" class="container" style="min-height: 400px;">
		<div id="column-one">
			<div class="itemTitle">Compound Info 
				<div class="lineColumnOne"></div>
			</div>
			<div class="itemLabel">Compound</div><%=c.getName()%>
			<div class="itemLabel">CompoundID</div><%= c.getCid() %> | <a href="<%= keggCompoundLink %><%=c.getCid() %>">View in KEGG</a> | <a href="<%= metscapeCompoundLink %><%=c.getCid() %>">View in MetScape</a> 
			<div class="itemLabel">MF</div><%= c.getFormula() %>
			<div class="itemLabel">Molecular Weight</div><%= c.getMw() %>
			<div class="itemLabel">Casnum</div><%= c.getCasnum() %>
		</div>
		<div id="column-two">
			<div class="itemTitle">Molecular Structure
				<div class="lineColumnTwo"></div>
			</div>
<% 			if (c.getSmile() != null) {%>
			<div class="itemLabel">Smile</div><%=c.getSmile()%>
<% 			} %>
			<%
        	String relativepath = "images/smiles/png/" + cid + ".png" ;
        	String fullfilepath = application.getRealPath("images/smiles/png") + "/" + cid + ".png" ;
        	File f = new File(fullfilepath) ;
        	if (f.exists())
        	{
			%>
				<p><img src="<%=relativepath%>"></p>
			<%
       		}
			%>	
		</div>
	</div>
	
	<!--  PATHWAY ------------------------------------------------------------------------------------------------------------------------->
	   
	<div id="pathways" class="container">
		<div class="itemTitle">Pathways
			<div class="lineFull"></div>
		</div>
		<div id="pathwayContainer"></div>
	</div>
	  
	<!--  REACTION ------------------------------------------------------------------------------------------------------------------------>
	   
	<div id="reactions" class="container">
	  	<div class="itemTitle">Reactions
			<div class="lineFull"></div>
		</div>
		<div id="reactionContainer"></div>
	</div>
	  
</div>