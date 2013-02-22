<%@ page 
import="java.util.*,
	org.ncibi.db.*,
	org.ncibi.lucene.MimiDocument,
	org.ncibi.mimiweb.model.DocumentGeneJSTableModel,
	org.ncibi.mimiweb.model.GeneInfo,
	org.ncibi.mimiweb.page.DocumentDetail,
	org.ncibi.mimiweb.page.DocumentDetailCitationCover,
	org.ncibi.mimiweb.page.FullTextSearch,
	org.ncibi.mimiweb.page.GeneDetails,
	org.ncibi.util.*"
%> 
<%
	ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resources.url");
	String geneLink = url.getString("geneLink");
	String geneInteractionsLink = url.getString("geneInteractionsLink");
	String genePublicationsLink = url.getString("genePublicationsLink");
	String genePathwaysLink = url.getString("genePathwaysLink");
	String goLink = url.getString("goLink");
	String pubmedLink = url.getString("pubmedLink");

	String geneIdString = request.getParameter("geneid");
	String pubmedIdString = request.getParameter("pmid");
	String interactionid = request.getParameter("interactionid");

	Integer probe = null;
	try {
		probe = new Integer(pubmedIdString);
	} catch(Throwable ignore) {}
	
	boolean hasGene = (geneIdString != null);
	boolean hasInteraction = (interactionid != null);
	
	if ((probe == null) || (!hasGene && !hasInteraction)) {
		// error
%>
		<font color="red">This page requires a pmid and one of: either a geneid or an interactionid</font>
<%
		return;
	}
	
	int pmid = probe.intValue();
	DocumentDetail docText = new DocumentDetail(pmid);
	DocumentDetailCitationCover citation = docText.getCitation();	
	FullTextSearch fts = new FullTextSearch();
	
	String mergedGenesQuery = "";
	for(Integer geneid: docText.getMergedGenes()) {
		mergedGenesQuery += "geneid:" + geneid  + " ";
	}
	List<MimiDocument> mergedGeneDocs = fts.query(mergedGenesQuery, -1);
	
	String taggedGenesQuery = "";
	for(Integer geneid: docText.getTaggedGeneMap().keySet()) {
		taggedGenesQuery += "geneid:" + geneid + " ";
	}
	List<MimiDocument> taggedGeneDocs = fts.query(taggedGenesQuery, -1);
	
	
	String geneText = null;
	String interactionText = null;

	//----------------------------------------------------------------------------------------------------------------------------------------//
	//Page Links
	List<String> inputGenes = new ArrayList<String>();
	if (hasGene) {
		int geneId = Integer.parseInt(request.getParameter("geneid"));	
		GeneDetails gd = new GeneDetails(geneId);
		GeneInfo gi = gd.getGeneInfo();
		GeneInfo gifullname = gd.getGeneInfoFullname();	
		geneText = gi.getSymbol();
		inputGenes.add(gi.getSymbol());
	}
	
	if (hasInteraction){
		PersistenceSession mimi = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("mimi"));
		String sql0 = "select symbol1, symbol2 from denorm.GeneGeneInteraction " 
		+ "where ggIntID = " + interactionid;
		Object[] symbols = mimi.sqlQuery(mimi.session(), sql0).single();
		interactionText = symbols[0] + "<->" + symbols[1];
		inputGenes.add(symbols[0].toString());
		inputGenes.add(symbols[1].toString());
	}
	
	DocumentGeneJSTableModel documentGenes = 
		new DocumentGeneJSTableModel
			(mergedGeneDocs, taggedGeneDocs, docText.getTaggedGeneMap());
	
	List<String> tempList = new ArrayList<String>();
	for(String inputGene: inputGenes) {
		tempList.add("\"" + inputGene + "\"");
	}
	String inputGeneString = JavascriptUtil.toJSArray(tempList);

	
	
	String title = "Document Details";
	String subheading = "";
	
	if (inputGenes.size() > 1) {
		title += " (For genes of interest: " + inputGenes.get(0) +
				" and " + inputGenes.get(1) + ")";
		subheading += "...with the related genes of interest, " +
			inputGenes.get(0) + " and " + inputGenes.get(1) + ", <span class =\"doc-detail-text-highlight\">highlighted</span>.";
	}
	else {
		title += " (For gene of interest: " + inputGenes.get(0) + ")";
		subheading += "...with the related gene of interest, " +
			inputGenes.get(0) + ", <span class =\"doc-detail-text-highlight\">highlighted</span>.";
	}
%>
<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="Document Details" />
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
<script>
var inputGenes = <%= inputGeneString %> ;
var documentGenes = <%= documentGenes %> ;
var geneLink = "<%=geneLink%>";
var geneInteractionsLink = "<%=geneInteractionsLink%>";
var genePublicationsLink = "<%=genePublicationsLink%>";
var genePathwaysLink = "<%=genePathwaysLink%>";
var goLink = "<%=goLink%>";
</script>

<script src="assets/js/datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="assets/js/datatables/extras/TableTools/media/js/TableTools.js" type="text/javascript"></script>
<script src="assets/js/datatables/extras/TableTools/media/js/ZeroClipboard.js" type="text/javascript"></script>
<script src="assets/js/documentgenetable.js" type="text/javascript"></script>


<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle"><%= title %></div>
	</div>
	
	<div id="documents" class="container">
		<div id="documentCitation" class="sectionStyle">
			<div class="itemTitle">PubMed Citation
				<div class="lineFull"></div>
			</div>
			<span class=documentPMID>(PubMed id: <a href="<%= pubmedLink %><%= citation.getPmid() %>"><%= citation.getPmid() %></a>)</span><br />
			<span class=documentTitie><%= citation.getTitle() %></span><br />
			<span class=documentAuthors><%= citation.getAuthorList() %></span><br />
			<span class=documentCitation>
				<span class=documentCitationJournal><%= citation.getJournal() %></span>
				<%= citation.getDate() %>;<%= citation.getVolumn() %>(<%= citation.getIssue() %>):<%= citation.getPages() %>
			</span>
		</div>
		<div id="documentAbstractText" class="sectionStyle">
			<div class="itemTitle">Annotated Abstract (showing tagged text)
				<div class="lineFull"></div>
			</div>	
			<%= docText.getAnnotatedText() %>
		</div>
		<div id="documentGeneList" class="sectionStyle">
	  		<div class="itemTitle">Genes associated with this article (either through tagging or through merging of external sources *)
				<div class="lineFull"></div>
			</div>
			<div class="itemSubTitle"><%= subheading %></div>
			<div id="documentGeneContainer"></div>
		</div>
		<div id="infoText" class="sectionStyle">
		<div class="lineFull"></div><p>
		* Genes are associated with the PubMed Abstracts from two sources. When we merge gene data to form the MiMI database, we also merge any association of PubMed ID with the gene. Hence the merged information contains the association of a PubMed ID with an Entrez Gene ID. In addition, we also apply a tagging process to the text of the abstract of the article, when we can obtain that abstract. This tagging process attempts to discover the potential association of a gene to the content of the abstract, by locating the gene's name or synonym in the text of the abstract. Those tags so discovered are shown above. See 'About MiMI' for information on the merge process. 
		</p></div>
	</div>
</div>


