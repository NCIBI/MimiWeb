$(document).ready(function() {
	$('#enzymeContainer').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="enzymeTable"></table>' );
	
	$('#enzymeTable').dataTable({
		"bJQueryUI": true,
		"bAutoWidth": false,
		"aaData": enzymes,
		"sDom": '<"H"lfr>t<"F"ipT>',
		"oTableTools": {
            "sSwfPath": "assets/js/datatables/extras/TableTools/media/swf/copy_cvs_xls_pdf.swf",
            "aButtons": ["copy",
                {
            		"sExtends": "csv",
            		"sFieldBoundary": '"',
            		"sFileName": "enzymes.csv"
                },
	            {
	        		"sExtends": "xls",
	        		"sButtonText": "TSV",
	        		"sFileName": "enzymes.tsv"
	            },
	            {
	        		"sExtends": "pdf",
	        		"sFileName": "enzymes.pdf",
	        		"sTitle": "Enzymes"
	            },
	            "print"
            ]
		},
		"sPaginationType": "full_numbers",
		"aoColumns": [
			{ "sTitle": "Enzyme ID", "sWidth": "20%"},
		    { "sTitle": "Enzyme Name" , "sWidth": "80%"},
		  ]
	});
	
});