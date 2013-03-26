
<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="About MiMI" />
</jsp:include>



<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">About</div>
	</div>
	
	<div class="container">
		<div id="aboutPage">
			<div class="itemTitle">About MiMI</div>
				<ul>
					<li><a href="#overview">Overview</a></li>
					<li><a href="#licensing">Licensing and Terms of Use</a></li>
					<li><a href="#download">Downloading MiMI Data</a></li>
					<li><a href="#api">MiMI Web Service API</a></li>
					<li><a href="#merge">The MiMI Merge Process</a></li>
					<li><a href="#funding">MiMI Support and Funding</a></li>
				</ul>
			<hr >
	
			<div id="overview" class="sectionStyle">
				<div class="itemSubTitle">Overview</div>
				<p>MiMI (Michigan Molecular Interactions) is part of the NIH's <a href="http://www.ncibi.org">
				National Center for Integrative Biomedical Informatics</a> (NCIBI).</p>
				<p>MiMI provides access to the knowledge and data merged and integrated from numerous protein interactions databases. 
				It augments this information from many other biological sources. MiMI merges data from these sources with "deep integration" 
				(see <a href="#merge">The MiMI Merge Process</a> section) into its single database. A simple yet powerful user interface 
				enables you to query the database, freeing you from the onerous task of having to know the data format or having to learn 
				a query language. MiMI allows you to query all data, whether corroborative or contradictory, and specify which sources to 
				utilize. </p>
				<p>MiMI displays results of your queries in easy-to-browse interfaces and provides you with workspaces to explore and 
				analyze the results. Among these workspaces is an interactive network of protein-protein interactions displayed in 
				Cytoscape and accessed through MiMI via a MiMI Cytoscape plug-in. </p>
				<p>MiMI gives you access to more information than you can get from any one protein interaction source such as:</p>
				<ul>
				   <li>Vetted data on genes, attributes, interactions, literature citations, compounds, and annotated text extracts through natural language 
				   processing (NLP) </li>
				   <li>Linkouts to integrated NCIBI tools to: analyze overrepresented MeSH terms for genes of interest, read additional NLP-mined text 
				   passages, and explore interactive graphics of networks of interactions</li>
				   <li>Linkouts to PubMed and NCIBI's MiSearch interface to PubMed for better relevance rankings</li>
				   <li>Queriying by keywords, genes, lists or interactions</li>
				   <li>Provenance tracking</li>
				   <li>Quick views of missing information across databases.</li>
				</ul>
			</div>
				
			<hr>
			
			<div id="licensing" class="sectionStyle">
				<div class="itemSubTitle">Licensing and Terms of Use</div>
				<p>
				MiMI is both a web service that integrates data and the application of research and open source software to the problem of 
				supporting that web service. The data integration service is supplied under the conditions of the original data sources and 
				the specific terms of use for MiMI. Access to this website is provided free of charge. Permission is granted to use this 
				software and data internally only, so long as no fee is charged,&nbsp;usage of this website is cited in any resulting 
				publications involving results from such use,&nbsp;and so long as the name of the University of Michigan is not used in 
				any advertising or publicity pertaining to such use without specific, written prior authorization. Permission to redistribute 
				this data in any form is specifically not granted.</p>
				<p>The Regents of the University of Michigan does not check this data for errors or omissions, and by its nature, the data
				included herein likely contains errors and omissions. Access and use is provided as is, without representation as to its 
				fitness for any purpose, and without warranty of any kind, either express or implied, including without limitation the 
				implied warranties of merchantability and fitness for a particular purpose. The Regents of the University of Michigan shall 
				not be liable for any damages, including special, indirect, incidental, or consequential damages, with respect to any
				claim arising out of, or in connection with, the use of this website or data, even if it has been or is hereafter advised 
				of the possibility of such damages.</p>
				<h4>How to Cite MiMI</h4>
				<p> Please use the following citation for this web site (the PubMed Citation):</p>
				
				<p> V. Glenn Tarcea, Terry Weymouth, Alex Ade, Aaron Bookvich,
				 Jing Gao, Vasudeva Mahavisno, Zach Wright, Adriane Chapman, Magesh Jayapandian,
				 Arzucan Ozgur, Yuanyuan Tian, Jim Cavacoli, Barbara Mirel, Jignesh Patel,
				 Dragomir Radev, Brian Athey, David States and H.V. Jagadish: Michigan molecular interactions
				r2: from interacting proteins to pathways. <strong> Nucleic Acids Research</strong>, 2008 Database issue.<br><br>
				The URL: <a href="http://nar.oxfordjournals.org/cgi/content/full/gkn722v1?maxtoshow=&HITS=10&hits=10&RESULTFORMAT=1&author1=Tarcea%2C+VG&andorexacttitle=and&andorexacttitleabs=and&andorexactfulltext=and&searchid=1&FIRSTINDEX=0&sortspec=relevance&resourcetype=HWCIT" target="_blank">link</a></p>
				<p><em> The abstract: Molecular interaction data exists in a number of repositories, each with its own data format, molecule 
				identifier and information coverage. Michigan molecular interactions (MiMI) assists scientists searching through this 
				profusion of molecular interaction data. The original release of MiMI gathered data from well-known protein interaction 
				databases, and deep merged this information while keeping track of provenance. Based on the feedback received from users, 
				MiMI has been completely redesigned. This article describes the resulting MiMI Release 2 (MiMIr2). New functionality includes 
				extension from proteins to genes and to pathways; identification of highlighted sentences in source publications; seamless 
				two-way linkage with Cytoscape; query facilities based on MeSH/GO terms and other concepts; approximate graph matching to 
				find relevant pathways; support for querying in bulk; and a user focus-group driven interface design. MiMI is part of the 
				NIH's; National Center for Integrative Biomedical Informatics (NCIBI) and is publicly available at: <a href="http://mimi.ncibi.org"> 
				http://mimi.ncibi.org</a>.</em></p>
				
				<p>Magesh Jayapandian, Adriane Chapman, V. Glenn
				   Tarcea, Cong Yu, Aaron Elkiss, Angela Ianni, Bin Liu, Arnab Nandi,
				   Carlos Santos, Philip Andrews, Brian Athey, David States, H.V.
				   Jagadish: Michigan Molecular Interactions (MiMI): Putting the Jigsaw
				   Puzzle Together. <strong>Nucleic Acids Research</strong>, 2007, Vol. 35, Database issue D566-D571. <br>
				
				    <br>
				   The URL: <a href="http://nar.oxfordjournals.org/cgi/content/full/35/suppl_1/D566" target="_blank">
				   http://nar.oxfordjournals.org/cgi/content/full/35/suppl_1/D566</a></p>
				<p><em> The abstract: Protein interaction data exists in a number of
				   repositories. Each repository has its own data format, molecule identifier and supplementary information. Michigan Molecular
				   Interactions (MiMI) assists scientists searching through this overwhelming amount of protein interaction data. MiMI gathers data from
				   well-known protein interaction databases and deep-merges the information. Utilizing an identity function, molecules that may have
				   different identifiers but represent the same real-world object are merged. Thus, MiMI allows the users to retrieve information from many
				   different databases at once, highlighting complementary and contradictory information. To help scientists judge the usefulness of a
				   piece of data, MiMI tracks the provenance of all data. Finally, a simple yet powerful user interface aids users in their 
				   queries, and frees them from the onerous task of knowing the data format or learning a query language. MiMI allows 
				   scientists to query all data, whether corroborative or contradictory, and specify which sources to utilize. MiMI is part 
				   of the National Center for Integrative Biomedical Informatics (NCIBI) and is publicly available at: 
				   <a href="http://mimi.ncibi.org/" target="_blank">http://mimi.ncibi.org/</a>.</em></p>	   
				<br />
				<h4>Data Source Terms of Use</h4>
				<p>Sources of data and their terms of use are as follows:</p>
				<table class="tableStyle" cellspacing="0" cellpadding="0">
				   <tbody>
				      <tr>
				         <th width="15%" scope="col">Source</th>
				         <th width="85%" scope="col">Terms of Use</th>
				      </tr>
				      <tr>
				         <td valign="top">BIND</td>
				
				         <td valign="top">There   are no license conditions attached to the use of BIND if you are using BIND   data for 
				         internal research purposes. Unleashed Informatics Limited holds an   exclusive commercial license to intellectual 
				         property including U.S. patent   number 6,745,204 - &quot;System for electronically managing, finding, and/or  
				         displaying biomolecular interactions&quot; - also known as the BIND patent.   The USPTO document can be found 
				         <a href="http://patft.uspto.gov/netahtml/PTO/srchnum.htm" target="_blank">here</a>.   
				         (http://patft.uspto.gov/netahtml/PTO/srchnum.htm)<br>
				            For-profit organizations selling a biomolecular interaction software system or employing such a software 
				            system specification in a product for sale which   falls under the claims of the above patent will require a 
				            commercial, fee-based license from Unleashed Informatics. Academic and commercial users of BOND will be 
				            unaffected by the enforcement of this patent. </td>
				      </tr>
				      <tr>
				         <td valign="top">BioGRID</td>
				
				         <td valign="top"> <a href="http://www.thebiogrid.org/viewdocument.php?documentid=6">
				         http://www.thebiogrid.org/viewdocument.php?documentid=6</a> </td>
				      </tr>
				      <tr>
				         <td valign="top">
				            DIP</td>
				         <td valign="top"> <a href="http://dip.doe-mbi.ucla.edu/termsofuse.html">http://dip.doe-mbi.ucla.edu/termsofuse.html</a> </td>
				      </tr>
				      <tr>
				         <td valign="top">
				            GO</td>
				         <td valign="top"> <a href="http://www.geneontology.org/GO.cite.shtml">http://www.geneontology.org/GO.cite.shtml</a> </td>
				      </tr>
				      <tr>
				         <td valign="top">
				            HPRD</td>
				
				         <td valign="top"> <a href="http://www.hprd.org/">http://www.hprd.org</a> </td>
				      </tr>
				      <tr>
				         <td valign="top">
				            IntAct</td>
				         <td valign="top"> <a href="http://www.ebi.ac.uk/intact/site/index.jsf">http://www.ebi.ac.uk/intact/site/index.jsf</a> </td>
				
				      </tr>
				      <tr>
				         <td valign="top">
				            InterPro</td>
				         <td valign="top"> <a href="http://www.ebi.ac.uk/interpro/User-FAQ-InterPro.html">http://www.ebi.ac.uk/interpro/User-FAQ-InterPro.html</a> </td>
				      </tr>
				      <tr>
				
				         <td valign="top">
				            IPI</td>
				         <td valign="top"> <a href="http://www.ebi.ac.uk/IPI/IPIhelp.html">http://www.ebi.ac.uk/IPI/IPIhelp.html</a> </td>
				      </tr>
				      <tr>
				         <td valign="top">
				            KEGG</td>
				
				         <td valign="top"> <a href="http://www.genome.jp/kegg/kegg1.html">http://www.genome.jp/kegg/kegg1.html</a> </td>
				      </tr>
				      <tr>
				         <td valign="top">
				            Max Delbreuck Center </td>
				         <td valign="top">Stelzl   U, Worm U, Lalowski M, Haenig C, Brembeck FH, Goehler H, Stroedicke M,   Zenkner M, 
				         Schoenherr A, Koeppen S, Timm J, Mintzlaff S, Abraham C, Bock N,   Kietzmann S, Goedde A, Toksˆz E, Droege A, 
				         Krobitsch S, Korn B, Birchmeier W,   Lehrach H, Wanker EE.; A human protein-protein interaction network: a   
				         resource for annotating the proteome.; Cell 2005 Sep 23;122(6):957-68. <br>
				
				            PMID:   16169070</td>
				      </tr>
				      <tr>
				         <td valign="top">
				            MiBLAST</td>
				         <td valign="top"> <a href="http://www.eecs.umich.edu/miblast/download.html">http://www.eecs.umich.edu/miblast/download.html</a> </td>
				
				      </tr>
				      <tr>
				         <td valign="top">
				            NCBI   Gene</td>
				         <td valign="top"> <a href="http://www.ncbi.nlm.nih.gov/About/disclaimer.html">http://www.ncbi.nlm.nih.gov/About/disclaimer.html</a> </td>
				      </tr>
				      <tr>
				
				         <td valign="top">
				            Organelle   DB</td>
				         <td valign="top"> <a href="http://organelledb.lsi.umich.edu/index.php">http://organelledb.lsi.umich.edu/index.php</a> </td>
				      </tr>
				      <tr>
				         <td valign="top">
				            OrthoMCL   DB</td>
				
				         <td valign="top"> <a href="http://www.orthomcl.org/cgi-bin/OrthoMclWeb.cgi?rm=orthomcl#Acknowledgement">
				         http://www.orthomcl.org/cgi-bin/OrthoMclWeb.cgi?rm=orthomcl#Acknowledgement</a> </td>
				      </tr>
				      <tr>
				         <td valign="top">
				            PFam</td>
				         <td valign="top"> <a href="http://pfam.sanger.ac.uk/help?tab=helpReferencesBlock">
				         http://pfam.sanger.ac.uk/help?tab=helpReferencesBlock</a> </td>
				
				      </tr>
				      <tr>
				         <td valign="top">
				            ProtoNet</td>
				         <td valign="top"> <a href="http://www.protonet.cs.huji.ac.il/prototeam.php?global=protonet|no|5|51|lifetime|1|2|2">
				         http://www.protonet.cs.huji.ac.il/prototeam.php?global=protonet|no|5|51|lifetime|1|2|2</a> </td>
				      </tr>
				      <tr>
				
				         <td valign="top">
				            PubMed</td>
				         <td valign="top">
				            See NCBI Gene</td>
				      </tr>
				      <tr>
				         <td valign="top">
				            PubMed NLP Mining</td>
				
				         <td valign="top">
				            See MiMI Terms of Use</td>
				      </tr>
				      <tr>
				         <td valign="top">
				            Reactome</td>
				         <td valign="top"> <a href="http://www.reactome.org/">http://www.reactome.org/</a> </td>
				
				      </tr>
				      <tr>
				        <td valign="top">
				            MINT</td>
				        <td valign="top">
				           <a href="http://mint.bio.uniroma2.it/mint/download.do">http://mint.bio.uniroma2.it/mint/download.do</a></td>
				      </tr>
				   </tbody>
				</table>   
			</div>
			
			<hr>
			
			<div id="download" class="sectionStyle">
				<div class="itemSubTitle">Downloading MiMI Data</div>
				<p>The MiMI data is available in PSI-MITAB Format. These files represent a subset 
				of the data available in MiMI. Only UniProt and RefSeq identifiers are included for each interactor, pathways and 
				metabolomics data is not included, and provenance is not included for each interaction. If you need access to the full 
				MiMI dataset please send an email to mimi-help@umich.edu.</p>
				<p><a href="/mimi_data/mimi_mitab_export.tar.gz">Download MiMI</a></p>
			</div>
			
			<hr>
			
			<div id="api" class="sectionStyle">
				<div class="itemSubTitle">MiMI Web Service API</div>
				<p>The MiMI data is queryable through a web services api. To read more about this api see 
				<a href="./main/webservice.jsp">MiMI Web Service API.</a></p>
			</div>
			
			<hr>
			
			<div id="merge" class="sectionStyle">
				<div class="itemSubTitle">The MiMI Merge Process</div>
				<p>Protein interaction data exists in a number of repositories. Each repository has its own data format, molecule 
				identifier, and supplementary information. MiMI assists scientists searching through this overwhelming amount of protein 
				interaction data. MiMI gathers data from well-known protein interaction databases and deep-merges the information.</p>
				<p>Utilizing an identity function, molecules that may have different identifiers but represent the same real-world object 
				are merged. Thus, MiMI allows the user to retrieve information from many different databases at once, highlighting 
				complementary and contradictory information.</p>
				<p>There are several steps needed to create the final MiMI dataset. They are:</p>
				<ol start="1" type="1">
				   <li>The original source datasets are obtained, and transformed into the MiMI schema, except KEGG, NCBI Gene, Uniprot, Ensembl.</li>
				   <li>Molecules that can be rolled into a gene are annotated to that gene record.</li>
				   <li>Using all known identifiers of a merged molecule, sources such as Organelle DB or miBLAST, are queried to annotate specific molecular fields.</li>
				   <li>The resulting dataset is loaded into a relational database.</li>
				</ol>
				<p>Because this is an automated process, and no curation occurs, any errors or misnomers in the original data sources will 
				also exist in MiMI. For example, if a source indicates that the organism is unknown, MiMI will as well.</p>
				<p>If you find that a molecule has been incorrectly merged under a gene record, please contact us immediately. Because 
				MiMI is completely automatically generated, and there is no data curation, it is possible that we have merged molecules 
				with gene records incorrectly. If made aware of the error, we can and will correct the situation. Please report any problems 
				of this kind to <a href="mailto:mimi-help@umich.edu">mimi-help@umich.edu</a>.<br>
				</p>
				<h4>Rules and Assumptions</h4>
				<p>MiMI is not merged by 'experts' - everything is done automatically. When you look into genes of interest it is important 
				to understand why your target gene contains the attributes and associated annotations; you also may want to know why 
				conflicting data are displayed in the merged data. Some of the assumptions and rules that MiMI uses in deep merging that 
				may be relevant to understanding and being confident in its displays include the following:<br></p>
				<h4>Source differences in quality</h4>
				<p">Not all sources are created equal. While each source has a particular strength, each also has its drawback. Some 
				important things to know about the curation processes in these different databases that might affect your interpretations 
				and confidence include:</p>		
				<ul>
				   <li>BIND - Has a large number of interactions, many based on high-throughput data.</li>
				   <li>IntAct - Lists molecules as 'interacting' when they co-locate.</li>
				</ul>
				<h4>Source content</h4>
				<p>Not only do sources have different strengths and weaknesses, they also organize content differently. For example, 
				IntAct will associate publications with individual molecules while BIND associates publications with interactions only. 
				MiMI remains true to individual sources and how they assign publications to molecules or interactions.</p>
				<h4>Source data not used</h4>
				<p>In general, MiMI uses all data from each source. However, there are some data from each source that are not incorporated 
				into MiMI. For instance, sequence data is never stored within the MiMI dataset.</p>
			</div>

			<hr>

			<div id="funding" class="sectionStyle">
				<div class="itemSubTitle">MiMI Support and Funding</div>
				<ul>
					<li><a href="http://www.nsf.gov/" target="_blank">National Science Foundation: Grant IIS 0219513</a></li>
					<li><a href="http://www.nih.gov/" target="_blank">National Institutes of Health: Grants R01 LM008106 and U54 DA021519</a></li>
					<li><a href="http://www.ncibi.org/" target="_blank">National Center for Integrative Biomedical Informatics</a></li>
					<li><a href="http://www.promisingminds.com/" target="_blank">Pfizer, Medical &amp; Academic Partnerships (MAP)</a></li>
					<li><a href="http://www.hhmi.org/" target="_blank">Howard Hughes Medical Institute (HHMI)</a></li>
					<li><a href="http://www.microsoft.com/" target="_blank">Microsoft Corporation</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>