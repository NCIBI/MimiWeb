$(document).ready(function() {

$('#reactionContainer').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="reactionTable"></table>' );	
	$('#reactionTable').dataTable({
		"bJQueryUI": true,
		"bAutoWidth": false,
		"aaData": reactions,
		"sDom": '<"H"lfr>t<"F"ipT>',
		"oTableTools": {
            "sSwfPath": "assets/js/datatables/extras/TableTools/media/swf/copy_cvs_xls_pdf.swf",
            "aButtons": ["copy",
                {
            		"sExtends": "csv",
            		"sFieldBoundary": '"',
            		"sFileName": "reactions.csv"
                },
	            {
	        		"sExtends": "xls",
	        		"sButtonText": "TSV",
	        		"sFileName": "reactions.tsv"
	            },
	            {
	        		"sExtends": "pdf",
	        		"sFileName": "reactions.pdf",
	        		"sTitle": "Reactions"
	            },
	            "print"
            ]
		},
		"sPaginationType": "full_numbers",
		"aoColumns": [
			{
			  "sTitle": "RID",
			  "sWidth": "25%",
			  "fnRender": function(obj) {
			     var link = '<a href="'+ reactionLink + obj.aData[0]+'">'+obj.aData[0]+'</a>';
				 return link;
			  }
		    },
		    { "sTitle": "Reversible" , "sWidth": "25%"},
		    { "sTitle": "Equation" , "sWidth": "50%"},
		  ]
	});	
	
});