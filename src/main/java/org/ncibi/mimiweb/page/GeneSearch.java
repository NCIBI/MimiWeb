package org.ncibi.mimiweb.page;

import java.util.ArrayList;
import java.util.List;

import org.ncibi.lucene.MimiDocument;

public class GeneSearch {

	FullTextSearch queryInterface = new FullTextSearch();

	public List<GeneRecord> doSearch(String searchString, int taxid) {
		
		List<GeneRecord> ret = new ArrayList<GeneRecord>();

		List<MimiDocument> output = queryInterface.query(searchString, taxid);
		for(MimiDocument document: output) {
			GeneRecord result = new GeneRecord(document);
			ret.add(result);
		}
		
		return ret;
	}

}
