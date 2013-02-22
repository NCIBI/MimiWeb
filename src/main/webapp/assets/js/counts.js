$(document).ready(function() {
			CountWebService.getHtmlMeshCountForGene2Mesh(search, taxid, 
	                      	function(data) 
	                      	{
	            	  			dwr.util.setValue("gene2mesh-mesh-count-here", data, 
	    	            	  			{ escapeHtml:false });
	                      	});
		      CountWebService.getHtmlConceptCountForConceptgen(search,
				      function(data)
				      {
			      			dwr.util.setValue("conceptgen-count-here", data, { escapeHtml:false });
				      });
              CountWebService.getHtmlGeneCountForGene2Mesh(search, taxid, 
                      	function(data) 
                      	{      			
            	  			dwr.util.setValue("gene2mesh-gene-count-here", data, 
                    	  				{ escapeHtml:false });
                      	});
});