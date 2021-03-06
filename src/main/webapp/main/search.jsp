<%@ page import="org.ncibi.lucene.*,org.ncibi.mimiweb.page.*, org.ncibi.util.*, java.io.*, java.util.*, net.sf.json.*"%>

<!--  HEADER FILE ------------------------------------------------------------------------------------------------------------------------->

<jsp:include page="/header">
	<jsp:param name="pageTitle" value="Advanced Search" />
</jsp:include>



<div id="layoutBody">

	<div id="pageTitleHeader">
		<div id="pageTitle">Advanced Search</div>
	</div>
	
	<div class="container">
		<form action="results" method="post">
			<div id="searchStep1">
				<div class="itemTitle">Step 1: Choose Organism</div>
				<div id="organismSearchBox">
					<select name="taxid">
	            		<option value="-1" >All Organisms</option>
            			<option value="9606" selected >Homo sapiens</option>
            			<option value="4932" >Saccharomyces cerevisiae</option>
            			<option value="7227" >Drosophila melanogaster</option>
            			<option value="6239" >Caenorhabditis elegans</option>
            			<option value="10090" >Mus musculus</option>
            			<option value="562" >Escherichia coli</option>
            			<option value="10116" >Rattus norvegicus</option>
            			<option value="3702" >Arabidopsis thaliana</option>
            			<option value="85962" >Helicobacter pylori 26695</option>
            			<option value="36329" >Plasmodium falciparum 3D7</option>
            			<option value="83333" >Escherichia coli K12</option>
            			<option value="-1" >----------------</option>
            			<option value="358" >Agrobacterium tumefaciens</option>
            			<option value="176299" >Agrobacterium tumefaciens str. C58</option>
            			<option value="4151" >Antirrhinum majus</option>
            			<option value="3818" >Arachis hypogaea</option>
            			<option value="354" >Azotobacter vinelandii</option>
            			<option value="1423" >Bacillus subtilis</option>
            			<option value="224308" >Bacillus subtilis subsp. subtilis str. 168</option>
            			<option value="283166" >Bartonella henselae str. Houston-1</option>
            			<option value="9913" >Bos taurus</option>
            			<option value="10559" >Bovine papillomavirus type 1</option>
            			<option value="3712" >Brassica oleracea</option>
            			<option value="5476" >Candida albicans</option>
            			<option value="9615" >Canis familiaris</option>
            			<option value="190650" >Caulobacter crescentus CB15</option>
            			<option value="155892" >Caulobacter vibrioides</option>
            			<option value="3055" >Chlamydomonas reinhardtii</option>
            			<option value="9534" >Chlorocebus aethiops</option>
            			<option value="1515" >Clostridium thermocellum</option>
            			<option value="10029" >Cricetulus griseus</option>
            			<option value="7955" >Danio rerio</option>
            			<option value="44689" >Dictyostelium discoideum</option>
            			<option value="162425" >Emericella nidulans</option>
            			<option value="10665" >Enterobacteria phage T4</option>
            			<option value="10760" >Enterobacteria phage T7</option>
            			<option value="556" >Erwinia chrysanthemi</option>
            			<option value="9031" >Gallus gallus</option>
            			<option value="1422" >Geobacillus stearothermophilus</option>
            			<option value="210" >Helicobacter pylori</option>
            			<option value="10407" >Hepatitis B virus</option>
            			<option value="11103" >Hepatitis C virus</option>
            			<option value="31647" >Hepatitis C virus subtype 1b</option>
            			<option value="10299" >Herpes simplex virus (type 1 / strain 17)</option>
            			<option value="4513" >Hordeum vulgare</option>
            			<option value="112509" >Hordeum vulgare subsp. vulgare</option>
            			<option value="10515" >Human adenovirus 2</option>
            			<option value="28285" >Human adenovirus 5</option>
            			<option value="28282" >Human adenovirus type 12</option>
            			<option value="10298" >Human herpesvirus 1</option>
            			<option value="10376" >Human herpesvirus 4</option>
            			<option value="10377" >Human herpesvirus 4 (strain B95-8)</option>
            			<option value="10360" >Human herpesvirus 5 strain AD169</option>
            			<option value="37296" >Human herpesvirus 8</option>
            			<option value="11676" >Human immunodeficiency virus 1</option>
            			<option value="10580" >Human papillomavirus type 11</option>
            			<option value="333760" >Human papillomavirus type 16</option>
            			<option value="11908" >Human T-lymphotropic virus 1</option>
            			<option value="211044" >Influenza A virus (A/Puerto Rico/8/34(H1N1))</option>
            			<option value="573" >Klebsiella pneumoniae</option>
            			<option value="28985" >Kluyveromyces lactis</option>
            			<option value="40674" >Mammalia</option>
            			<option value="10036" >Mesocricetus auratus</option>
            			<option value="187420" >Methanothermobacter thermautotrophicus str. Delta H</option>
            			<option value="1773" >Mycobacterium tuberculosis</option>
            			<option value="83332" >Mycobacterium tuberculosis H37Rv</option>
            			<option value="5141" >Neurospora crassa</option>
            			<option value="4097" >Nicotiana tabacum</option>
            			<option value="9986" >Oryctolagus cuniculus</option>
            			<option value="4530" >Oryza sativa</option>
            			<option value="39947" >Oryza sativa (japonica cultivar-group)</option>
            			<option value="9940" >Ovis aries</option>
            			<option value="12208" >Pea seed-borne mosaic virus</option>
            			<option value="4102" >Petunia x hybrida</option>
            			<option value="4922" >Pichia pastoris</option>
            			<option value="3888" >Pisum sativum</option>
            			<option value="12215" >Potato virus A</option>
            			<option value="287" >Pseudomonas aeruginosa</option>
            			<option value="208964" >Pseudomonas aeruginosa PAO1</option>
            			<option value="303" >Pseudomonas putida</option>
            			<option value="186497" >Pyrococcus furiosus DSM 3638</option>
            			<option value="1076" >Rhodopseudomonas palustris</option>
            			<option value="272951" >Rickettsia sibirica 246</option>
            			<option value="602" >Salmonella typhimurium</option>
            			<option value="99287" >Salmonella typhimurium LT2</option>
            			<option value="227859" >SARS coronavirus</option>
            			<option value="4896" >Schizosaccharomyces pombe</option>
            			<option value="284812" >Schizosaccharomyces pombe 972h-</option>
            			<option value="623" >Shigella flexneri</option>
            			<option value="10633" >Simian virus 40</option>
            			<option value="4081" >Solanum lycopersicum</option>
            			<option value="4113" >Solanum tuberosum</option>
            			<option value="3562" >Spinacia oleracea</option>
            			<option value="1280" >Staphylococcus aureus</option>
            			<option value="1314" >Streptococcus pyogenes</option>
            			<option value="2287" >Sulfolobus solfataricus</option>
            			<option value="9823" >Sus scrofa</option>
            			<option value="32046" >Synechococcus elongatus</option>
            			<option value="1140" >Synechococcus elongatus PCC 7942</option>
            			<option value="1148" >Synechocystis sp. PCC 6803</option>
            			<option value="32630" >synthetic construct</option>
            			<option value="2336" >Thermotoga maritima</option>
            			<option value="300852" >Thermus thermophilus HB8</option>
            			<option value="11084" >Tick-borne encephalitis virus</option>
            			<option value="4565" >Triticum aestivum</option>
            			<option value="5691" >Trypanosoma brucei</option>
            			<option value="10245" >Vaccinia virus</option>
            			<option value="10254" >Vaccinia virus WR</option>
            			<option value="190486" >Xanthomonas axonopodis pv. citri str. 306</option>
            			<option value="8355" >Xenopus laevis</option>
            			<option value="630" >Yersinia enterocolitica</option>
            			<option value="4577" >Zea mays</option>	
					</select>
				</div>
			</div>
			
			<hr >
			
			<div id="searchStep2">
				<div class="itemTitle">Step 2: Choose Search Option</div>
				<table id="searchTable">
					<tr>
						<td class="searchTableColumn">
							<input type="radio" name="searchOption" value="fullText" checked="checked" class="inputForm"/>Full Text
						</td>
						<td><input type="text" name="fullTextSearch" size="40" class="inputForm" onfocus="elements[1].checked=true"/></td>
						<td><div id="queryFieldSelection">
							<select name="queryField">
							<option value="">All Fields</option>
							<%
							for(String searchField: MimiSearch.allQueryFields) {
								%>
								<option value=<%=searchField %> ><%= searchField %></option>
							<% 
							}
							%>
							</select>
						</div></td>
					</tr>
					<tr>
						<td colspan="2"><hr/></td>
					</tr>
					<tr>
						<td class="searchTableColumn">
							<input type="radio" name="searchOption" value="list" class="inputForm"/>List
						</td>
						<td><textarea name="listSearch" cols="40" rows="6" class="inputForm" onfocus="elements[4].checked=true"></textarea>
							<br/>
							Type or insert a list of IDs or symbols into text box
							<br/>
							<input type="radio" name="typeSelection" value="genes" checked /> Genes
							<input type="radio" name="typeSelection" value="compounds"  /> Compounds
						</td>
					</tr>
					<tr>
						<td colspan="2"><hr/></td>
					</tr>
					<tr>
						<td class="searchTableColumn">
							<input type="radio" name="searchOption" value="geneInteraction"/>Gene Interaction 
						</td>
						<td>
							Gene 1 : <input type="text" name="gene1" size="20" class="inputForm" onfocus="elements[8].checked=true"/>
							<br/>
							Gene 2 : <input type="text" name="gene2" size="20" class="inputForm" onfocus="elements[8].checked=true"/>
							<br/>
						</td>
					</tr>
					<tr>
						<td colspan="2"><hr/></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Submit Search" /></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>