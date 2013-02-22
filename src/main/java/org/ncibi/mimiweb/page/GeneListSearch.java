package org.ncibi.mimiweb.page;

import java.util.ArrayList;
import java.util.List;

import org.ncibi.lucene.MimiDocument;
import org.ncibi.util.NumUtils;

public class GeneListSearch {

	FullTextSearch queryInterface = new FullTextSearch();

	public List<GeneRecord> doSearch(List<String> geneIdOrSymbolList, int taxid) {
		
		List<GeneRecord> ret = new ArrayList<GeneRecord>();
		
		String prefix = "genesymbol:";
		if (listIsIds(geneIdOrSymbolList)) prefix = "geneid:";
	
		for (String input: geneIdOrSymbolList){
			List<MimiDocument> output = queryInterface.query(prefix + input, taxid);
			for(MimiDocument document: output) {
				GeneRecord result = new GeneRecord(document);
				ret.add(result);
			}
		}
		
		return ret;
	}

	private boolean listIsIds(List<String> stringList) {
		int count = 0;
		for (String probe: stringList){
			if (NumUtils.toInteger(probe) != null) count++;
		}
		return count == stringList.size();
	}
}
