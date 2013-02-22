package org.ncibi.query;

import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.ncibi.db.EntityManagers;
import org.ncibi.db.PersistenceSession;
import org.ncibi.db.PersistenceUnit;
import org.ncibi.db.mimi2.GeneGeneInteraction;
import org.ncibi.mimiweb.page.InteractionSearch;

public class PageTests {
	
	@Test
	public void GeneSymbolsForInteractions(){
		
		PersistenceSession persistence = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("mimi"));
		
		String gene1 = "CSF1R";
		String gene2 = "CBL";
		
		String query = "from mimi.GeneGeneInteraction where symbol1='" + gene1 + "' and symbol2='" + gene2 + "'";
		List<GeneGeneInteraction> probeList = persistence.hqlQuery(persistence.session(), query).list();

		Assert.assertNotNull(probeList);
		Assert.assertFalse(probeList.isEmpty());
		Assert.assertTrue(probeList.size() > 0);

		GeneGeneInteraction probe = probeList.get(0);

		InteractionSearch source = new InteractionSearch();
		List<String> genes = source.getGeneSymbolsForInteraction(probe.getGgIntID());
		Assert.assertEquals(gene1, genes.get(0));
		Assert.assertEquals(gene2, genes.get(1));
	}

}
