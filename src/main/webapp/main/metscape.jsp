<% response.setContentType("application/x-java-jnlp-file"); %>
<?xml version="1.0" encoding="utf-8"?>
<jnlp codebase="http://portal.ncibi.org/cytoscape" href="cytoscape.jnlp">

  <information>
    <title>Cytoscape with NCIBI Plugins</title>
    <vendor>University of Michigan</vendor>
    <homepage href="http://portal.ncibi.org/cytoscape/"/>
    <description>Cytoscape with NCIBI Plugins</description>
    <offline-allowed/>
  </information>
  <security>
     <all-permissions/>
  </security>
  <resources>
    <j2se version="1.5+" max-heap-size="1024M"/>
     
<jar href="lib/application-2.8.2-jar-with-dependencies.jar" main="true"/>
<jar href="lib/advanced-network-merge-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/automatic-layout-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/biomart-client-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/biopax-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/editor-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/equation-functions-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/manual-layout-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/ncbi-client-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/psi-mi-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/rfilters-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/sbml-reader-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/table-import-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/attribute-browser-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/cpath-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/cpath2-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/linkout-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/quickfind-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/filters-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/core-commands-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/network-analyzer-2.8.2-jar-with-dependencies.jar"/>
<jar href="lib/y-layouts-1.0.1.jar"/>
<jar href="lib/metscape2-plugin-2.3.1.jar"/>
<jar href="lib/mimi-plugin-3.1.1.jar"/>

  </resources>
  <application-desc main-class="cytoscape.CyMain">
    <argument>-p</argument>
    <argument>csplugins.network.merge.NetworkMergePlugin</argument>
    <argument>-p</argument>
    <argument>csplugins.layout.LayoutPlugin</argument>
    <argument>-p</argument>
    <argument>edu.ucsd.bioeng.idekerlab.biomartclient.BiomartClientPlugin</argument>
    <argument>-p</argument>
    <argument>cytoscape.coreplugins.biopax.BiopaxPlugin</argument>
    <argument>-p</argument>
    <argument>browser.AttributeBrowserPlugin</argument>
    <argument>-p</argument>
    <argument>org.cytoscape.coreplugin.cpath.plugin.CPathPlugIn</argument>
    <argument>-p</argument>
    <argument>org.cytoscape.coreplugin.cpath2.plugin.CPathPlugIn2</argument>
    <argument>-p</argument>
    <argument>cytoscape.editor.CytoscapeEditorPlugin</argument>
    <argument>-p</argument>
    <argument>org.cytoscape.EquationFunctions.EquationFunctionsPlugin</argument>
    <argument>-p</argument>
    <argument>filter.cytoscape.CsFilter</argument>
    <argument>-p</argument>
    <argument>cytoscape.filters.FilterPlugin</argument>
    <argument>-p</argument>
    <argument>linkout.LinkOutPlugin</argument>
    <argument>-p</argument>
    <argument>ManualLayout.ManualLayoutPlugin</argument>
    <argument>-p</argument>
    <argument>edu.ucsd.bioeng.idekerlab.ncbiclient.NCBIClientPlugin</argument>
    <argument>-p</argument>
    <argument>org.cytoscape.coreplugin.psi_mi.plugin.PsiMiPlugIn</argument>
    <argument>-p</argument>
    <argument>csplugins.quickfind.plugin.QuickFindPlugIn</argument>
    <argument>-p</argument>
    <argument>sbmlreader.SBMLReaderPlugin</argument>
    <argument>-p</argument>
    <argument>edu.ucsd.bioeng.coreplugin.tableImport.TableImportPlugin</argument>
    <argument>-p</argument>
    <argument>yfiles.YFilesLayoutPlugin</argument>
    <argument>-p</argument>
    <argument>org.ncibi.cytoscape.metscape.plugin.MetScapePlugin</argument>
    <argument>-p</argument>
    <argument>org.ncibi.cytoscape.mimi.plugin.MiMIPlugin</argument>
    <%
  	String cids = request.getParameter("cids");
  	if(cids != null && cids.length() > 0) { %>
  		<argument>-P</argument>
  		<argument>cids=<%= cids %></argument> <% 
  	}
  	String geneids = request.getParameter("geneids");
  	if(geneids != null && geneids.length() > 0) { %>
		<argument>-P</argument>
		<argument>geneids=<%= geneids %></argument> <% 
	} %>
  </application-desc>
</jnlp>

 