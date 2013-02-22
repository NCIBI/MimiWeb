package org.ncibi.mimiweb.page;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.queryParser.ParseException;
import org.ncibi.lucene.MimiDocument;
import org.ncibi.lucene.MimiSearch;
import org.ncibi.lucene.model.FullTextSearchResult;

public class FullTextSearch {
	
	List<FullTextSearchResult> resultList = new ArrayList<FullTextSearchResult>();
	private MimiSearch ms = null;
	
	public List<MimiDocument> query(String request, int taxid){

        ArrayList<MimiDocument> matches = new ArrayList<MimiDocument>()  ;
    	try {
	        if (ms == null) {
	        	ms = MimiSearch.createMimiSearch();
	        }
	        matches = ms.searchAllExceptInteractions2MimiDocument(request, taxid) ;
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} 
        
        return matches;

	}


}
