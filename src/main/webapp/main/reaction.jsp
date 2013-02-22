<%@ page 
	import="org.ncibi.db.*,
	org.ncibi.db.metdb.Location,
	org.ncibi.db.metdb.Reaction,
	org.ncibi.db.metdb.ReactionEquation,
	org.ncibi.db.metdb.Enzyme,
	org.ncibi.db.metdb.Gene,
	org.ncibi.mimiweb.model.*,
	org.ncibi.mimiweb.page.*,
	org.ncibi.util.*, 
	java.util.*, 
	net.sf.json.*"
%>
<%
//----------------------------------------------------------------------------------------------------------------------------------------//

// Page Links
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resources.url");
String compoundLink = url.getString("compoundLink");
String geneLink = url.getString("geneLink");
String keggReactionLink = url.getString("keggReactionLink");
String rid = request.getParameter("rid");

//----------------------------------------------------------------------------------------------------------------------------------------//
//Page Links

String hql = "from metdb.Reaction where rid='" +rid + "'";
PersistenceUnit p = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("metdb"));
Reaction r = p.hqlQuery(p.session(), hql).single();	

String rxnText = "";
String rxnEquation = "";
if(r.getEquations() != null)
for(ReactionEquation equ: r.getEquations()) {
	if(equ.getEtype().equals("KEGG"))
		rxnText = equ.getEquation();
	else if(equ.getEtype().equals("NAME"))
		rxnEquation = equ.getEquation();
}

Set<Gene> genes = new HashSet<Gene>();
for(Enzyme e: r.getEnzymes()) {
	genes.addAll(e.getGenes());
}


CompoundJSTableModel compounds = new CompoundJSTableModel(r.getAllCmpds());

//----------------------------------------------------------------------------------------------------------------------------------------//
//Tab Buttons  

String tabButtonsOff = "";
if(r.getAllCmpds().isEmpty()){ tabButtonsOff += ",\"compoundsButton\"";}

tabButtonsOff = tabButtonsOff.replaceFirst(",", "");



String enzymeList = "";

for(Enzyme e: r.getEnzymes()) {
	out.print(e.getEcnum() + " ");
	enzymeList += ", " + e.getEcnum();
}

enzymeList = enzymeList.replaceFirst(",", "");

%>
<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="Reaction Details" />
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
<script src="assets/js/compoundtable.js" type="text/javascript"></script>


<script>

var tabButtons = ["mainButton","compoundsButton"];
var tabButtonsOff = [<%= tabButtonsOff %>];			
var tabDivs = ["main","compounds"];

var compoundLink = "<%= compoundLink %>";
var geneLink = "<%= geneLink %>";
var keggReactionLink = "<%= keggReactionLink %>";
var compounds = <%= compounds %>;

</script>

<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Reaction Details</div>
		<div id="pageSubTitle">Details for Reaction Entry <b><%= r.getRid() %></b></div>
	</div>
	
	<!--  TABS ---------------------------------------------------------------------------------------------------------------------------->

	<div id="pageTabs">
		<a id="mainButton" class="css3ButtonOff" href = "#">Reaction Info</a>
		<a id="compoundsButton" class="css3ButtonOff" 
<% 			if (!r.getAllCmpds().isEmpty()) {%>
		href = "#compounds"
<% 			} %>>Compounds</a>
	</div>
	
	<!--  REACTION DETAILS -------------------------------------------------------------------------------------------------------------------->
	   
	<div id="main" class="container">
		<div class="itemTitle">Reaction Info 
			<div class="lineFull"></div>
		</div>
		<div class="itemLabel">ReactionID</div><%= r.getRid() %> | <a href="<%= keggReactionLink %><%=r.getRid() %>">View Reaction in KEGG</a> 
		<div class="itemLabel">Reversible</div><%= r.getReversible() %>
		<div class="itemLabel">Reaction Text</div><%= rxnText %>
		<div class="itemLabel">Equation</div><%= rxnEquation %>
		<div class="itemLabel">Subcellular Locations</div><ul><%
		for(Location l: r.getLocations()) {
			out.print("<li>"+l.getName()+"</li>");
		}
		%>
		</ul>
		<div class="itemLabel">Enzymes for Reaction</div>
		<%= enzymeList %>
		<div class="itemLabel">Genes for Reaction</div><%
		for(Gene g: genes) { %>
			<a href="<%= geneLink %><%=g.getGeneid() %>"><%=g.getSymbol()%></a> 
		<%}
		%>
	</div>
	
	<!--  COMPOUND ------------------------------------------------------------------------------------------------------------------------>
	   
	<div id="compounds" class="container">
	  	<div class="itemTitle">Compounds
			<div class="lineFull"></div>
		</div>
		<div id="compoundContainer"></div>
	</div>  
</div>