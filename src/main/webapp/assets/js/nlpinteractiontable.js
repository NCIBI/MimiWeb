

$(document).ready(function() {
	$('#nlpInteractionContainer').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="nlpInteractionTable"></table>' );
	
	$('#nlpInteractionTable').dataTable({
		"bJQueryUI": true,
		"bAutoWidth": false,
		"aaData": nlpInteractions,
		"aaSorting": [[1, 'asc']],
		"sDom": '<"H"lfr>t<"F"ipT>',
		"oTableTools": {
            "sSwfPath": "assets/js/datatables/extras/TableTools/media/swf/copy_cvs_xls_pdf.swf",
            "aButtons": ["copy",
                {
            		"sExtends": "csv",
            		"sFieldBoundary": '"',
            		"sFileName": "nlpInteractions.csv"
                },
	            {
	        		"sExtends": "xls",
	        		"sButtonText": "TSV",
	        		"sFileName": "nlpInteractions.tsv"
	            },
	            {
	        		"sExtends": "pdf",
	        		"sFileName": "nlpInteractions.pdf",
	        		"sTitle": "Literature Mined Interactions"
	            },
	            "print"
            ]
		},
		"sPaginationType": "full_numbers",
		"aoColumns": [
		    { "bVisible": false, "aTargets": [0] },         
			{
			  "sTitle": "Gene 1",
			  "sWidth": "7.5%",
			  "fnRender": function(obj) {
			     var link = '<a  href="'+ geneLink + obj.aData[0]+'">'+obj.aData[1]+'</a>';
				 return link;
			  }
		    },
		    { "sTitle": "Tag 1" , "sWidth": "7.5%" },
		    { "bVisible": false, "aTargets": [3] },
		    {
		      "sTitle": "Gene 2",
		      "sWidth": "7.5%",
			  "fnRender": function(obj) {
				  var link = '<a  href="'+ geneLink + obj.aData[3]+'">'+obj.aData[4]+'</a>';
				  return link;
			   }
			},
			{ "sTitle": "Tag 2" , "sWidth": "7.5%" },
		    { "sTitle": "Interaction Type" , "sWidth": "10%" },
		    { "sTitle": "Sentence" , "sWidth": "55%" },
		    {
				"bUseRendered": false,
				"sTitle": "Pubmed Id",
				"sWidth": "5%",
				"fnRender": function(obj) {
					var link = '<a href="'+ pubmedLink + obj.aData[8]+'">'+obj.aData[8]+'</a>';
					return link;
			  }
		    },
		    { 
		    	"sTitle": "See Mined Text", 
		    	"sWidth": "3.33%",
		    	"fnRender": function(obj) {
				     var link = '<a href="'+ documentLink + obj.aData[8]+'">'+obj.aData[9]+'</a>';
					 return link;
				}
		    },
		  ]
	});		
	
});

