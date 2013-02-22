<%@ page 
	import="org.ncibi.db.*,
	org.ncibi.mimiweb.model.*,
	org.ncibi.mimiweb.page.*,
	org.ncibi.util.*, 
	java.util.*, 
	net.sf.json.*"
%>
<%
//----------------------------------------------------------------------------------------------------------------------------------------//

// Page Type
int geneId = Integer.parseInt(request.getParameter("geneid"));	
String pageType = request.getParameter("pageType");	

GeneDetails gd = new GeneDetails(geneId);

//----------------------------------------------------------------------------------------------------------------------------------------//
//Page Links

GeneInfo gi = gd.getGeneInfo();
GeneInfo gifullname = gd.getGeneInfoFullname();
List<List<String>> processList = gd.getProcesses();
List<List<String>> functionList = gd.getFunctions();
List<List<String>> componentList = gd.getComponents();

String geneCompounds = JavascriptUtil.toJSArray(gd.getGeneCompounds());
String geneEnzymes = JavascriptUtil.toJSArray(gd.getGeneEnzymes());
String pathways = JavascriptUtil.toJSArray(gd.getPathways());
String proteinInteractions = JavascriptUtil.toJSArray(gd.getProteinInteractions());
String nlpInteractions = JavascriptUtil.toJSArray(gd.getNlpInteractions());
String reactions = JavascriptUtil.toJSArray(gd.getReactions());
String citations = JavascriptUtil.toJSArray(gd.getCitations());

//Page Links
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resources.url");
String goLink = url.getString("goLink");
String compoundLink = url.getString("compoundLink");
String attrCountLink = url.getString("goLink");
String geneLink = url.getString("geneLink");
String reactionLink = url.getString("reactionLink");
String pubmedLink = url.getString("pubmedLink");
String documentLink = url.getString("documentGeneLink").replace("??", "" + geneId);
String chromosomeLink = url.getString("chromosomeLink");
String mapLocationLink = url.getString("mapLocationLink");

//----------------------------------------------------------------------------------------------------------------------------------------//
// Tab Buttons  

String tabButtonsOff = "";
if(gd.getPathways().isEmpty()){ tabButtonsOff += ",\"pathwaysButton\"";}
if(gd.getProteinInteractions().isEmpty() && gd.getNlpInteractions().isEmpty()){ tabButtonsOff += ",\"interactionsButton\""; }
if(gd.getGeneCompounds().isEmpty()){ tabButtonsOff += ",\"compoundsButton\"";}
if(gd.getGeneEnzymes().isEmpty()){ tabButtonsOff += ",\"enzymesButton\"";}
if(gd.getReactions().isEmpty()) {tabButtonsOff += ",\"reactionsButton\"";}
if(gd.getCitations().isEmpty()) {tabButtonsOff += ",\"publicationsButton\"";}


tabButtonsOff = tabButtonsOff.replaceFirst(",", "");

%>
<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="Gene Details" />
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
<script src="assets/js/enzymetable.js" type="text/javascript"></script>
<script src="assets/js/proteininteractiontable.js" type="text/javascript"></script>
<script src="assets/js/nlpinteractiontable.js" type="text/javascript"></script>
<script src="assets/js/pathwaytable.js" type="text/javascript"></script>
<script src="assets/js/publicationtable.js" type="text/javascript"></script>
<script src="assets/js/reactiontable.js" type="text/javascript"></script>
<script>


var tabButtons = ["mainButton", "pathwaysButton", "publicationsButton", "interactionsButton", "compoundsButton", "enzymesButton", "reactionsButton"];
var tabButtonsOff = [<%= tabButtonsOff %>];			
var tabDivs = ["main", "pathways", "publications", "interactions", "compounds", "enzymes", "reactions"];


var compoundLink = "<%= compoundLink %>";
var geneLink = "<%= geneLink %>";
var reactionLink = "<%= reactionLink %>";
var pubmedLink = "<%= pubmedLink %>";
var documentLink = "<%= documentLink %>";
var compounds = <%= geneCompounds %>;
var enzymes = <%= geneEnzymes %>;
var pathways = <%= pathways %>;
var reactions = <%= reactions %>;
var publications = <%= citations %>;
var proteinInteractions = <%= proteinInteractions %>;
var nlpInteractions = <%= nlpInteractions %>;

</script>

<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Gene Details</div>
		<div id="pageSubTitle">Details for Gene Entry <b><%= gi.getSymbol() %></b> (GeneId: <%= gi.getGeneid() %>)</div>
	</div>
	<!--  TABS ---------------------------------------------------------------------------------------------------------------------------->

	<div id="pageTabs">
		<a id="mainButton" class="css3ButtonOff" href = "#">Gene Info</a>
		<a id="pathwaysButton" class="css3ButtonOff" 
<% 			if (!gd.getPathways().isEmpty()) {%>
		href = "#pathways"
<% 			} %>>Pathways</a>
		<a id="publicationsButton" class="css3ButtonOff" 
<% 			if (!gd.getCitations().isEmpty()) {%>
		href = "#publications"
<% 			} %>>Publications</a>
		<a id="interactionsButton" class="css3ButtonOff" 
<% 			if (!gd.getProteinInteractions().isEmpty() || !gd.getNlpInteractions().isEmpty()) {%>
		href = "#interactions"
<% 			} %>>Interactions</a>			
		<a id="compoundsButton" class="css3ButtonOff"
<% 			if (!gd.getGeneCompounds().isEmpty()) {%>
		href = "#compounds"
<% 			} %>>Compounds</a>	
		<a id="enzymesButton" class="css3ButtonOff" 
<% 			if (!gd.getGeneEnzymes().isEmpty()) {%>
		href = "#enzymes"
<% 			} %>>Enzymes</a>	
		<a id="reactionsButton" class="css3ButtonOff" 
<% 			if (!gd.getReactions().isEmpty()) {%>
		href = "#reactions"
<% 			} %>>Reactions</a>	
	</div>

	<!--  GENE DETAILS -------------------------------------------------------------------------------------------------------------------->
	   
	<div id="main" class="container" style="min-height: 400px;">
		<div id="column-one">
			<div class="itemTitle">Gene Info 
				<div class="lineColumnOne"></div>
			</div>
			<%
			if(gifullname != null)
			{
			%>	
			<div class="itemLabel">Authorized Name</div><%= gifullname.getGeneName() %>
			<%
			}
			%>		
			<div class="itemLabel">Official Symbol</div><%= gi.getSymbol() %>
			<div class="itemLabel">Synonyms</div><%= gd.getGeneSynonymsString() %>
			<div class="itemLabel">Chromosome</div><a href=<%= chromosomeLink + gi.getChromosome() %>><%= gi.getChromosome() %></a>
			<div class="itemLabel">Map Location</div><a href=<%= mapLocationLink + gi.getMaploc() %>><%= gi.getMaploc() %></a>
			<div class="itemLabel">Other Description</div>
			<%
			for(String description : gd.getOtherDescriptions())
			{
			%>
			<div class="item"><%= description %></div>
			<%
			}
			%>
		</div>
		
		<div id="column-two">
			<div class="itemTitle">Gene Attributes
				<div class="lineColumnTwo"></div>
			</div>
			<div class="itemLabel">GO Biological Process</div>
			<%
			for(List<String> process : processList)
			{
			%>
			<div class="item"><a href="<%= goLink %><%= process.get(1) %>" target="_new"><%= process.get(0) %></a></div>
			<%
			}
			%>
			<div class="itemLabel">GO Molecular Function</div>
			<%
			for(List<String> function : functionList)
			{
			%>
			<div class="item"><a href="<%= goLink %><%= function.get(1) %>" target="_new"><%= function.get(0) %></a></div>
			<%
			}
			%>
			<div class="itemLabel">GO Cellular Component</div>
			<%
			for(List<String> component : componentList)
			{
			%>
			<div class="item"><a href="<%= goLink %><%= component.get(1) %>" target="_new"><%= component.get(0) %></a></div>
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
	  
	<!--  COMPOUND ------------------------------------------------------------------------------------------------------------------------>
	   
	<div id="compounds" class="container">
	  	<div class="itemTitle">Compounds
			<div class="lineFull"></div>
		</div>
		<div id="compoundContainer"></div>
	</div>
	  
	<!--  INTERACTION --------------------------------------------------------------------------------------------------------------------->
	   
	<div id="interactions" class="container">
	  	<div class="itemTitle">Interactions
			<div class="lineFull"></div>
		</div>
		<% 			if (!gd.getProteinInteractions().isEmpty()) {%>
		<div class="itemSubTitle">Protein Interactions</div>
		<div id="proteinInteractionContainer"></div>
		<% 			} %>
		<% 			if (!gd.getNlpInteractions().isEmpty()) {%>
		<div class="itemSubTitle">Literature Mined Interactions</div>
		<div id="nlpInteractionContainer"></div>
		<% 			} %>
	</div>
	
	<!--  ENZYME ------------------------------------------------------------------------------------------------------------------------>
	   
	<div id="enzymes" class="container">
	  	<div class="itemTitle">Enzymes
			<div class="lineFull"></div>
		</div>
		<div id="enzymeContainer"></div>
	</div>
	
	<!--  REACTION ------------------------------------------------------------------------------------------------------------------------>
	   
	<div id="reactions" class="container">
	  	<div class="itemTitle">Reactions
			<div class="lineFull"></div>
		</div>
		<div id="reactionContainer"></div>
	</div>
	
	<!--  PUBLICATION ------------------------------------------------------------------------------------------------------------------------>
	   
	<div id="publications" class="container">
	  	<div class="itemTitle">Publications
			<div class="lineFull"></div>
		</div>
		<div id="publicationContainer"></div>
	</div>
	  
</div>