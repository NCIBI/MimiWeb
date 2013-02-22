package org.ncibi.mimiweb.page;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;

public class InteractionSearchTest {

	
	@Test
	public void test1(){
		List<InteractionRecord> results = 
			(new InteractionSearch().doSearch("CSF1R", "CBL"));
		Assert.assertTrue(results.size() == 2);
	}
}
