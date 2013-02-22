package org.ncibi.lucene.autocomplete;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.ncibi.lucene.MimiDocument;

public class Autocomplete
{

	public static List<AutocompleteResult> doAutocomplete(String input)
	{
		List<AutocompleteResult> ret = new ArrayList<AutocompleteResult>();
		FullTextSearch fts = new FullTextSearch();
		List<MimiDocument> documents = fts.query(input + "*", 9606);
		for (MimiDocument document : documents)
		{
			String geneid = new Integer(document.geneid).toString();
			if (StringUtils.containsIgnoreCase(geneid, input))
			{
				AutocompleteResult result = new AutocompleteResult(AutocompleteType.ID, input, geneid, document);
				ret.add(result);
			}
			if (StringUtils.containsIgnoreCase(document.geneSymbol, input))
			{
				AutocompleteResult result = new AutocompleteResult(AutocompleteType.SYMBOL, input, document.geneSymbol, document);
				ret.add(result);
			}
			if (StringUtils.containsIgnoreCase(document.geneDescription, input))
			{
				AutocompleteResult result = new AutocompleteResult(AutocompleteType.DESCRIPTION, input, document.geneDescription, document);
				ret.add(result);
			}
		}
		return ret;
	}

}
