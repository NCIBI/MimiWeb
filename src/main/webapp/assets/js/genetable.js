

$(document).ready(function() {
	$('#geneContainer').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="geneTable"></table>' );
	$('#geneTable').dataTable({
		"bJQueryUI": true,
		"bAutoWidth": false,
		"aaData": genes,
		"aaSorting": [],
		"sDom": '<"H"lfr>t<"F"ipT>',
		"oTableTools": {
            "sSwfPath": "assets/js/datatables/extras/TableTools/media/swf/copy_cvs_xls_pdf.swf",
            "aButtons": ["copy",
                {
            		"sExtends": "csv",
            		"sFieldBoundary": '"',
            		"sFileName": "genes.csv"
                },
	            {
	        		"sExtends": "xls",
	        		"sButtonText": "TSV",
	        		"sFileName": "genes.tsv"
	            },
	            {
	        		"sExtends": "pdf",
	        		"sFileName": "genes.pdf",
	        		"sTitle": "Genes"
	            },
	            "print"
            ]
		},
		"sPaginationType": "full_numbers",
		"aoColumns": [
		  	{ "bVisible": false},         
		  	{
		  		"bUseRendered": false,
		  		"sTitle": "Gene",
		  		"sWidth": "5%",
		  		"fnRender": function(obj) {
		  			var link = '<a  href="'+ geneLink + obj.aData[0]+'">'+obj.aData[1]+'</a>';
		  			return link;
				}
			},
			{ "sTitle": "Organism", "sWidth": "5%"},
		    { "sTitle": "Type" , "sWidth": "5%"},
		    { "sTitle": "Other Names" , "sWidth": "10%"},
		    { "sTitle": "Description" , "sWidth": "15%"},
		    { 
		    	"sTitle": "Cellular Components" , 
		    	"sWidth": "10%",
		    	"fnRender": function(obj) {
		    		if(obj.aData[6].length == 0) return '';
		    		var item = obj.aData[6][0];
		    		var text = '<a  href="'+ goLink + item[1]+'">'+item[0]+'</a> ';
		    		for(i=1; i<obj.aData[6].length; i++) {
		    			item = obj.aData[6][i];
		    			text = text + ', <a  href="'+ goLink + item[1]+'">'+item[0]+'</a>';
		    		}
		    		return text;
		    	}	
		    },
		    { 
		    	"sTitle": "Biological Processes" , 
		    	"sWidth": "25%",
		    	"fnRender": function(obj) {
		    		if(obj.aData[7].length == 0) return '';
		    		var item = obj.aData[7][0];
		    		var text = '<a  href="'+ goLink + item[1]+'">'+item[0]+'</a> ';
		    		for(i=1; i<obj.aData[7].length; i++) {
		    			item = obj.aData[7][i];
		    			text = text + ', <a  href="'+ goLink + item[1]+'">'+item[0]+'</a>';
		    		}
		    		return text;
		    	}	
		    },
		    { 
		    	"sTitle": "Molecular Functions" , 
		    	"sWidth": "15%",
		    	"fnRender": function(obj) {
		    		if(obj.aData[8].length == 0) return '';
		    		var item = obj.aData[8][0];
		    		var text = '<a  href="'+ goLink + item[1]+'">'+item[0]+'</a> ';
		    		for(i=1; i<obj.aData[8].length; i++) {
		    			item = obj.aData[8][i];
		    			text = text + ', <a  href="'+ goLink + item[1]+'">'+item[0]+'</a>';
		    		}
		    		return text;
		    	}	
		    },
		    { 
		    	"sTitle": "Int" , 
		    	"sWidth": "2.5%",
		    	"fnRender": function(obj) {
		    		if(obj.aData[9] == '0') return obj.aData[9];
		    		return '<a  href="'+ geneInteractionsLink + obj.aData[0]+'#interactions">'+obj.aData[9]+'</a> ';
		    	}	
		    },
		    { 
		    	"sTitle": "Doc" , 
		    	"sWidth": "2.5%",
		    	"fnRender": function(obj) {
		    		if(obj.aData[10] == '0') return obj.aData[10];
		    		return '<a  href="'+ genePublicationsLink + obj.aData[0]+'#publications">'+obj.aData[10]+'</a> ';
		    	}	
		    },
		    { 
		    	"sTitle": "Path" , 
		    	"sWidth": "2.5%",
		    	"fnRender": function(obj) {
		    		if(obj.aData[11] == '0') return obj.aData[11];
		    		return '<a  href="'+ genePathwaysLink + obj.aData[0]+'#pathways">'+obj.aData[11]+'</a> ';
		    	}	
		    },
		  ]
	});
	
});

