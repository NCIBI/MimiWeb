

$(document).ready(function() {
	$('#compoundContainer').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="compoundTable"></table>' );
	
	$('#compoundTable').dataTable({
		"bJQueryUI": true,
		"bAutoWidth": false,
		"aaData": compounds,
		"sDom": '<"H"lfr>t<"F"ipT>',
		"oTableTools": {
            "sSwfPath": "assets/js/datatables/extras/TableTools/media/swf/copy_cvs_xls_pdf.swf",
            "aButtons": ["copy",
                {
            		"sExtends": "csv",
            		"sFieldBoundary": '"',
            		"sFileName": "compounds.csv"
                },
	            {
	        		"sExtends": "xls",
	        		"sButtonText": "TSV",
	        		"sFileName": "compounds.tsv"
	            },
	            {
	        		"sExtends": "pdf",
	        		"sFileName": "compounds.pdf",
	        		"sTitle": "Compounds"
	            },
	            "print"
            ]
		},
		"sPaginationType": "full_numbers",
		"aoColumns": [
		{
		  "sTitle": "CID",
		  "sWidth": "10%",
		  "fnRender": function(obj) {
		     var link = '<a href="'+ compoundLink + obj.aData[0]+'">'+obj.aData[0]+'</a>';
			 return link;
		  }
	    },
	    { "sTitle": "Compound Name" , "sWidth": "20%"},
	    { "sTitle": "Formula" , "sWidth": "20%"},
	    { "sTitle": "Molecular Weight" , "sWidth": "20%"},
	    { "sTitle": "Casnum" , "sWidth": "10%"},
	    { "sTitle": "Smile", "sWidth": "20%" }
	  ]
	});	
	
});

