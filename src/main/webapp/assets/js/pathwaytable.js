$(document).ready(function() {
	$('#pathwayContainer').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="pathwayTable"></table>' );
	
	$('#pathwayTable').dataTable({
		"bJQueryUI": true,
		"bAutoWidth": false,
		"aaData": pathways,
		"aaSorting": [],
		"sDom": '<"H"lfr>t<"F"ipT>',
		"oTableTools": {
            "sSwfPath": "assets/js/datatables/extras/TableTools/media/swf/copy_cvs_xls_pdf.swf",
            "aButtons": ["copy",
                {
            		"sExtends": "csv",
            		"sFieldBoundary": '"',
            		"sFileName": "pathways.csv"
                },
	            {
	        		"sExtends": "xls",
	        		"sButtonText": "TSV",
	        		"sFileName": "pathways.tsv"
	            },
	            {
	        		"sExtends": "pdf",
	        		"sFileName": "pathways.pdf",
	        		"sTitle": "Pathways"
	            },
	            "print"
            ]
		},
		"sPaginationType": "full_numbers",
		"aoColumns": [
			{ "sTitle": "Id","sWidth": "10%"},  
		    { "sTitle": "Name" , "sWidth": "60%" },
		    { "sTitle": "Source" , "sWidth": "10%" },
		    { "sTitle": "Genes Related to Pathway" , "sWidth": "20%" },
		  ]
	});
	
});