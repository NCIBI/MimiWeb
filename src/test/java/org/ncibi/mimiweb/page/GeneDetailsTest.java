package org.ncibi.mimiweb.page;

import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.ncibi.mimiweb.model.GeneEnzyme;

public class GeneDetailsTest
{
	@Test
	public void run()
	{
		int geneId = 1436;
		GeneDetails geneDetails = new GeneDetails(geneId);
		Assert.assertTrue(geneDetails.getGeneId() == geneId);
	}
	
	@Test
	public void testGeneEnzyme() {
		int geneId = 1436;
		GeneDetails geneDetails = new GeneDetails(geneId);
		List<GeneEnzyme> geneEnzyme = geneDetails.getGeneEnzymes();
		Assert.assertNotNull(geneEnzyme);
		Assert.assertEquals("Receptor protein-tyrosine kinase.", geneEnzyme.get(0).getName());
	}
	
	@Test
	public void testGeneReaction() {
		int geneId = 1436;
		GeneDetails geneDetails = new GeneDetails(geneId);
		List<String> reactions = geneDetails.getReactions();
		Assert.assertNotNull(reactions);
		Assert.assertNotNull(reactions.get(0));
	}
}
