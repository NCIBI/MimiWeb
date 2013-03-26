

<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="Help & Support" />
</jsp:include>



<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Help & Support</div>
	</div>
	
	<div class="container">
		<div id="helpPage">
			<div class="itemTitle">MiMI Quick Start Guide</div>
			<ul>
				<li><a href="help#searchhelp">Start Your Search</a></li>
				<li><a href="help#resultshelp">Navigate Search Results</a></li>
				<li><a href="help#genedetails">Browsing Gene Details</a></li>
				<li><a href="help#fields">Queryable Fields in the MiMI Database</a></li>
				<li><a href="help#samples">Sample MiMI Queries</a></li>
				<li><a href="help#support">Additional Help & Support</a></li>
			</ul>		
			Data displayed in the MiMI website are drawn from the MiMI database, a repository that integrates data from numerous protein 
			interaction databases and other external biological sources. MiMI also includes text-mined data from NCIBI-based natural language 
			processing of PubMed literature. Much of the data in MiMI comes from curated sources. 
			
			<hr >
			
			<div id="searchhelp" class="sectionStyle">
				<div class="itemSubTitle">Start Your Search</div>
				To perform a basic search, simply enter a single keyword, human gene symbol, or Entrez gene id into the search box at the top of the page. 
				If your search is more complex than this, or involves an organism other than human, one can do an Advanced Search by clicking the "Search" link.<br/>
				The following options are available for an Advanced Search:
				<ul>
					<li>'Full Text' - Search by keywords, genes, diseases, or strings of genes.</li>
					<li>'List' - Search with a list of genes or compounds by symbol or ID.</li>
					<li>'Gene Interaction' - Search for specific gene interactions.</li>
				</ul>
				<p>
				In Full Text Search, use any phrases or operators permitted by Lucene (See <a href="#samples">below</a> 
				for example queries). Specify if you want MiMI to search for your terms in only certain fields by 
				adding the <a href="#fields">field prefix</a> : cellularComponent:nucleus. 
				(For gene lists, click the radio button to specify names or ID, upload a file and copy it if you are using a file).
				For more detailed instructions for using Lucene queries visit: <a href="http://lucene.apache.org/java/2_4_0/queryparsersyntax.html">
				http://lucene.apache.org/java/2_4_0/queryparsersyntax.html</a> 
				</p>
				<p>
				In List Search, enter a list of multiple gene or compound IDs/symbols to search for. 
				Acceptable input types include Entrez gene IDs, gene symbols, or KEGG compound IDs.  
				Be sure to select the correct type for your input (Genes or Compounds).
				</p>
				<p>
				In Gene Interaction Search, specify a pair of Entrez gene IDs or gene symbols to search for protein interactions involving the gene pair. 
				Acceptable input types include Entrez gene IDs, gene symbols, or KEGG compound IDs.  
				</p>
				
			</div>
			
			<hr >
			
			<div id="resultshelp" class="sectionStyle">
				<div class="itemSubTitle">Navigate Search Results</div>
				<ol>
					<li>
						Scan results and confirm them. Details on merging logic and source databases can be found in the User Manual.
					</li>
					<li>
						For details on a given gene, click the the gene symbol.
						<br>
						To see information about the GO terms describing the gene's cellular components, biological processes, or molecular functions, click the term link.<br>
						To see all interactors with a gene, click the # under Int<br>
						To see all articles about a gene, click the # under Doc<br>
						To see related pathways, click the # under Path<br>
					</li>
					<li>
						To go back and forth in MiMI, use the back and forward buttons in your browser.
					</li>
					<li>
						To link out to other sources and return, click the desired hyperlink and use the browser's back button to return to MiMI.
					</li>
				</ol>
			</div>
			
			<hr>
			
			<div id="genedetails" class="sectionStyle">
				<div class="itemSubTitle">Browsing Gene Details</div>
				<ol>
					<li>
						Find basic gene details and gene attributes in the Gene Info section (open by default). 
						Click on the links on the page for more information about GO terms, chromosome, or map location. 
					</li>
					<li>
						Examine pathways in which the gene resides by opening the Pathways section.
						<br>
						Click the pathway's ID to see more details about the pathway (if available).<br>
						Click "View Related" under Genes Related to the Pathway (if applicable) to see a list of all genes related to the pathway.<br>
					</li>
					<li>
						Examine publications about the selected gene by opening the Publications section.
						<br>
						Click the page numbers to move through the list.<br>
						Click the PMID to go to the PubMed abstract page.<br>
						Click "View" under the See Mined Text column to see other genes associated with this gene in the article.<br>
					</li>
					<li>
						Examine interactions for the selected gene by opening the Interactions section.
						<br>
						Click the gene symbols for more information about each interacting gene.<br>
						Click the number in the Lit Count column for publications related to an interaction.<br>
						Click the interaction and experiment type(s) for additional information from the Ontology Lookup Service.<br>
						Click "View" under the Pathways column to see pathways associated with this gene in the article.<br>
					</li>
					<li>
						Examine related compounds by opening the Compounds section.
						<br>
						Click the id to see more information about the compound.
						<br>On the compound page:<br>
						Click the "View In KEGG" link to view the compound in the KEGG COMPOUND database.<br>
						Click the "View in MetScape" link to view the compound in MetScape (opens an instance of Cytoscape)<br>
						Click the Pathways tab for information about pathways related to the compound and to view associated genes (click "View Related"" to see these).<br>
						Click the Reactions tab for information about reactions related to the compound.<br>
					</li>
					<li>
						Examine related enzymes by opening the Enzymes section.
					</li>
					<li>
						Examine related reactions by opening the Reactions section.
						<br>
						Click the id to see more information about the reaction.
						<br>On the reaction page:<br>
						Click the "View Reaction In KEGG" link to view the reaction in the KEGG REACTION database.<br>
						Click the Compounds tab for information about compounds related to the reaction.<br>
					</li>
					<li>
						Click on linked compounds, genes, or reactions anywhere they appear for more information about that compound, gene, or reaction.
					</li>
				</ol>
			</div>
			
			<hr>
			
			<div id="fields" class="sectionStyle">
				<div class="itemSubTitle">Queryable Fields in the MiMI Database</div>
				The specific gene-related field-prefixes that can be searched in the Lucene keyword searches are listed below. For example 
				to search just the record with the the gene symbol DEC1, go to the free text search page and enter <b>genesymbol:DEC1</b> 
				or <b>genesymbol:dec1</b>.
				<br /><br />
				cellularComponent <br />
				biologicalProcess <br />
				molecularFunction <br />
				moldescription <br />
				molname <br />
				externalref <br />
				taxid <br />
				gdesc (Gene description)<br />
				taxname <br />
				pubcount <br />
				interactioncount <br />
				geneid <br />
				genesymbol <br />
				genetype <br />
				scitaxname
			</div>
			
			<hr>
			
			<div id="samples" class="sectionStyle">
				<div class="itemSubTitle">Sample MiMI Queries</div>
				If you are interested in any gene that references insulin you can type in: <span>insulin</span><br>
				To find genes with both insulin and receptor in them: <span>insulin AND receptor</span><br>
				Note: The AND (and the OR, below) must be in upper-case letters.<br>
				To find genes with the phrase "insulin receptor" surround the word in double quotes: <span>"insulin receptor"</span><br>
				
				To limit your "insulin receptor" search to homo sapiens, but you are not sure how to spell homo sapiens use the * wildcard: 
				<span>insulin receptor" AND organism:homo*</span><br>
				To find genes that interact in the nucleus you can query by field name: <span>cellularComponent:nucleus</span><br>
				To find genes that interact in the nucleus for either humans or fruit flies, and you cannot remember the spelling of either 
				organism: <br><span>cellularComponent:nucleus AND (organism:homo* OR organism:dro*)</span><br>
				Even more fun: to look for genes that interact in the nucleus, for either humans or fruit flys, that specifically reference 
				insulin receptor:<br> <span>"insulin receptor" AND cellularComponent:nucleus AND (organism:homo* OR organism:dro*</span><br>
				For a gene with a specific Entrez Gene ID, you can use the term geneid, for example search for <span>geneid:1436</span>.
				<br><br>
				Of course, you can still type in and search on gene symbols or Entrez gene IDs.
				
			</div>
			
			<hr>
			
			<div id="support" class="sectionStyle">
				<div class="itemSubTitle">Additional Help and Support</div>
				For additonal MiMI support and/or any questions regarding MiMI email <a href="mailto:mimi-help@umich.edu">mimi-help@umich.edu</a>.
			</div>
		</div>	
	</div>
</div>