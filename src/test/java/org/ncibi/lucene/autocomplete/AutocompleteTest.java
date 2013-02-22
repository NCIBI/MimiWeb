package org.ncibi.lucene.autocomplete;

import java.util.List;

import junit.framework.Assert;

import org.junit.Test;

public class AutocompleteTest {
	
	@Test
	public void test1() {
		String input = "CSF1R";
		List<AutocompleteResult> results = Autocomplete.doAutocomplete(input);
		for(AutocompleteResult result: results) {
			String matchedString = result.getMatchedString();
			int matchedPosition = result.getMatchedPosition();
			Assert.assertTrue
				(matchedString.substring(matchedPosition,matchedPosition+input.length()).equals(input));
		}
	}
}
