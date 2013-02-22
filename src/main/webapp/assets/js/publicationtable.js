$(document).ready(function() {
	$('#publicationContainer').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="publicationTable"></table>' );
	
	$('#publicationTable').dataTable({
		"bJQueryUI": true,
		"bAutoWidth": false,
		"aaData": publications,
		"aaSorting": [],
		"sDom": '<"H"lfr>t<"F"ipT>',
		"oTableTools": {
            "sSwfPath": "assets/js/datatables/extras/TableTools/media/swf/copy_cvs_xls_pdf.swf",
            "aButtons": ["copy",
                {
            		"sExtends": "csv",
            		"sFieldBoundary": '"',
            		"sFileName": "publications.csv"
                },
	            {
	        		"sExtends": "xls",
	        		"sButtonText": "TSV",
	        		"sFileName": "publications.tsv"
	            },
	            {
	        		"sExtends": "pdf",
	        		"sFileName": "publications.pdf",
	        		"sTitle": "Publications"
	            },
	            "print"
            ]
		},
		"sPaginationType": "full_numbers",
		"aoColumns": [
			{
				"bUseRendered": false,
				"sTitle": "Pubmed Id",
				"sWidth": "6.67%",
				"fnRender": function(obj) {
					var link = '<a href="'+ pubmedLink + obj.aData[0]+'">'+obj.aData[0]+'</a>';
					return link;
			  }
		    },
		    { 
		    	"sTitle": "See Mined Text", 
		    	"sWidth": "3.33%",
		    	"fnRender": function(obj) {
				     var link = '<a href="'+ documentLink + obj.aData[0]+'">'+obj.aData[1]+'</a>';
					 return link;
				}
		    },
		    { "sTitle": "Year" , "sWidth": "3.33%"},
		    { "sTitle": "Citation" , "sWidth": "11.67%"},
		    { "sTitle": "Title" , "sWidth": "25%"},
		    { "sTitle": "Author(s)" , "sWidth": "50%"},
		  ]
	});	
	
});