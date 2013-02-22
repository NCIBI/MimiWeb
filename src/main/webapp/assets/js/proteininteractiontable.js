

$(document).ready(function() {
	$('#proteinInteractionContainer').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="proteinInteractionTable"></table>' );
	
	$('#proteinInteractionTable').dataTable({
		"bJQueryUI": true,
		"bAutoWidth": false,
		"aaData": proteinInteractions,
		"aaSorting": [[1, 'asc']],
		"sDom": '<"H"lfr>t<"F"ipT>',
		"oTableTools": {
            "sSwfPath": "assets/js/datatables/extras/TableTools/media/swf/copy_cvs_xls_pdf.swf",
            "aButtons": ["copy",
                {
            		"sExtends": "csv",
            		"sFieldBoundary": '"',
            		"sFileName": "proteinInteractions.csv"
                },
	            {
	        		"sExtends": "xls",
	        		"sButtonText": "TSV",
	        		"sFileName": "proteinInteractions.tsv"
	            },
	            {
	        		"sExtends": "pdf",
	        		"sFileName": "proteinInteractions.pdf",
	        		"sTitle": "Protein Interactions"
	            },
	            "print"
            ]
		},
		"sPaginationType": "full_numbers",
		"aoColumns": [
		    { "bVisible": false, "aTargets": [0] },         
			{
			  "sTitle": "Gene 1",
			  "sWidth": "10%",
			  "fnRender": function(obj) {
			     var link = '<a  href="'+ geneLink + obj.aData[0]+'">'+obj.aData[1]+'</a>';
				 return link;
			  }
		    },
		    { "bVisible": false, "aTargets": [2] },
		    {
		      "sTitle": "Gene 2",
		      "sWidth": "10%",
			  "fnRender": function(obj) {
				  var link = '<a  href="'+ geneLink + obj.aData[2]+'">'+obj.aData[3]+'</a>';
				  return link;
			   }
			},
		    { "sTitle": "Provenance" , "sWidth": "20%" },
		    { "sTitle": "Lit Count" , "sWidth": "10%" },
		    { "sTitle": "Interaction Type" , "sWidth": "20%" },
		    { "sTitle": "Experiments" , "sWidth": "20%" },
		    { "sTitle": "Pathways" , "sWidth": "10%" }
		  ]
	});		
	
});

