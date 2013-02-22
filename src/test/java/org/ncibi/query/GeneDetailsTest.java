package org.ncibi.query;

import junit.framework.Assert;

import org.junit.Test;
import org.ncibi.mimiweb.page.GeneDetails;

public class GeneDetailsTest
{

	@Test
	public void testGeneDetails() {
		GeneDetails geneDetails = new GeneDetails(1436);
		Assert.assertNotNull(geneDetails.getCitations());
	}
}
