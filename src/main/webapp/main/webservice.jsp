
<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="Web Service" />
</jsp:include>



<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Web Service</div>
	</div>
	
	<div class="container">
		<div id="webservicePage">
			<div class="itemTitle">MiMI/Metabolomics Quick Start Guide</div>
			 <p>The collection and merging of interaction and metabolomic data is an activity of the NIH's 
			 <a href="http://www.ncibi.org" target="_blank">National Center for Integrative Biomedical Informatics (NCIBI)</a>.</p>
			
			 <hr>
			 
			 <div id="program" class="sectionStyle">
				<div class="itemSubTitle">MiMI/Metabolomics Programmatic Interface</div>
				<p>NCIBI has provided web service access to the MiMI and Metabolomics databases. These databases are large, merged 
				collections of interaction, gene and metabolomics (pathways, compounds, reactions and enzymes) data. The data includes 
				pubmed entries, interactions, provenance, and other information. Programmatic access may be useful for integrating 
				interactions and metabolomic data into an analytic workflow or data pipeline.<br />
			    <br />
			    <strong>Base URL</strong>:
			    <br />
			    <br />
			    http://mimi.ncibi.org/MimiWeb/fetch.jsp?<br />
			  	<br />
			 	<strong>URL Parameters</strong>:</p>
			  	<strong>search</strong>
			  	<p>Search term to perform a general MiMI free-text search.</p>
			    <strong>geneid</strong>
			    <p>Geneid is the Entrez GeneId for a gene.</p>
			  	<strong>cid</strong>
			    <p>Cid is the KEGG compound ID</p>
			  	<strong>rid</strong>
			  	<p>Rid is the KEGG reaction ID.</p>
			  	<p><strong>type</strong>
			    Type is the type of data to return. Currently supported types are "reactions", "interactions", and &quot;compounds.&quot; 
			    If not specified then the default is "interactions".
			    <p> The types return the following information:</p>
			    <ul>
			        <li>interactions - A list interactions (and associated data) for the given geneid.</li>
			        <li>reactions - A list of reactions (and associated data) that the given geneid participates in as an enzyme</li>
			        <li>compounds - A list of compounds (and associated data) with which a given geneid is associated.</li>
			        <li>nlp - A list of literature derived interactions (and relevant sentence) discovered using Natural Language Processing.</li> 
			    </ul>
			    
			    
			    <p><strong>The following are valid parameter combinations:</strong><br />
			    <br />
			    search<br />
			    geneid &amp; type<br />
			    cid <br />
			    rid
				</p>
				
			    <p><strong>Examples</strong>:<br /></p>
			    <p><a href="http://mimi.ncibi.org/MimiWeb/fetch.jsp?search=pwp1" target="_blank">http://mimi.ncibi.org/MimiWeb/fetch.jsp?search=pwp1</a><br /></p>
			    <p><a href="http://mimi.ncibi.org/MimiWeb/fetch.jsp?geneid=1436" target="_blank">http://mimi.ncibi.org/MimiWeb/fetch.jsp?geneid=1436</a></p>
			    <p><a href="http://mimi.ncibi.org/MimiWeb/fetch.jsp?geneid=1436&type=interactions" target="_blank">http://mimi.ncibi.org/MimiWeb/fetch.jsp?geneid=1436&type=interactions</a></p>
			    <p><a href="http://mimi.ncibi.org/MimiWeb/fetch.jsp?geneid=1436&type=reactions" target="_blank">http://mimi.ncibi.org/MimiWeb/fetch.jsp?geneid=1436&type=reactions</a></p>
			    <p><a href="http://mimi.ncibi.org/MimiWeb/fetch.jsp?geneid=7389&type=compounds" target="_blank">http://mimi.ncibi.org/MimiWeb/fetch.jsp?geneid=7389&type=compounds</a></p>
			    <p><a href="http://mimi.ncibi.org/MimiWeb/fetch.jsp?geneid=4005&type=nlp" target="_blank">http://mimi.ncibi.org/MimiWeb/fetch.jsp?geneid=4005&type=nlp</a></p>
			    <p><a href="http://mimi.ncibi.org/MimiWeb/fetch.jsp?cid=C00061">http://mimi.ncibi.org/MimiWeb/fetch.jsp?cid=C00061 </a></p>
			    <p><a href="http://mimi.ncibi.org/MimiWeb/fetch.jsp?rid=R00548">http://mimi.ncibi.org/MimiWeb/fetch.jsp?rid=R00548</a></p>
			    
			    
			    <strong>Output</strong>
			    <br />
    			<p>The XML returned is divided into two sections. The Request section echos the input parameters and the values of unset parameters. 
    			The Response section holds the data from the query.</p>
    			
    			<hr />  
    			
    			<div class="sectionStyle">
	  				<div class="itemSubTitle">Sample Code For Retrieving and Parsing NCIBI Mimi/Metabolomics Data</div>
	  				<p>The following three examples show how to interact with the NCIBI MiMI web service by querying for interactions and 
	  				reactions. Samples 1 and 2 query the NCIBI-MiMI-WS. Sample 3 shows a combined query to the NCIBI-MiMI-WS and eUtils. The 
	  				examples are shown in Java and Perl. Sample 4 shows a query combining NCBI's Eutils and three of NCIBI's web services:
	  				<a href="http:/nlp.ncibi.org"> NLP</a>, <a href="http://gene2mesh.ncibi.org" target="_blank">Gene2MeSH</a>, and 
	  				<a href="http://mimi.ncibi.org" target="_blank">MiMI</a>.</p>
				    <p>Sample 1 - <a href="NCIBI_MiMI_Sample1.java.txt">Java</a>, <a href="NCIBI_MiMI_Sample1.pl">Perl</a></p>
				    <p>Sample 2 - <a href="NCIBI_MiMI_Sample2.java.txt">Java</a>, <a href="NCIBI_MiMI_Sample2.pl">Perl</a></p>
				    <p>Sample 3 - <a href="NCIBI_MiMI_Sample3.java.txt">Java</a>, <a href="NCIBI_MiMI_Sample3.pl">Perl</a></p>
				    <p>Sample 4 - <a href="apiExample.pl">Perl</a></p>
			    </div>
			    
			    <hr />
			    
			    <div class="sectionStyle">
				    <div class="itemSubTitle">Licensing and Terms of Use</div>
					<p> The NCIBI MiMI and Metabolomics databases integrate data through the application of research and open source software.  
					The data integration service is supplied under the conditions of the original data sources and the specific terms of use for 
					the NCIBI MiMI web service. Access to this web service is provided free of charge. Permission is granted to use this software 
					and data internally only, so long as no fee is charged, usage of this web service is cited in any resulting publications 
					involving results from such use, and so long as the name of the University of Michigan is not used in any advertising or 
					publicity pertaining to such use without specific, written prior authorization. Permission to redistribute this data in 
					any form is specifically not granted. </p>
					
					<p>The Regents of the University of Michigan does not check this data for errors or omissions, and by its nature, the data 
					included herein likely contains errors and omissions. Access and use is provided as is, without representation as to its 
					fitness for any purpose, and without warranty of any kind, either express or implied, including without limitation the 
					implied warranties of merchantability and fitness for a particular purpose. The Regents of the University of Michigan shall 
					not be liable for any damages, including special, indirect, incidental, or consequential damages, with respect to any claim 
					arising out of, or in connection with, the use of this website or data, even if it has been or is hereafter advised of the 
					possibility of such damages.</p>
				</div>
				
				<hr />
				
				<div id="overview" class="sectionStyle">
					<div class="itemSubTitle">Additional Help and Support</div>
					<p>For additional MiMI web services support and/or any questions regarding the MiMI web services E-mail: 
					<a href="mailto:mimi-help@umich.edu">mimi-help@umich.edu</a></p>
				</div>	
					
			</div>
		</div>
	</div>
</div>