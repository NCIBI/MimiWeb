package org.ncibi.query;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.ncibi.db.EntityManagers;
import org.ncibi.db.PersistenceSession;
import org.ncibi.db.PersistenceUnit;
import org.ncibi.db.metdb.Reaction;
import org.ncibi.mimiweb.model.GeneCompound;
import org.ncibi.mimiweb.model.GeneEnzyme;
import org.ncibi.mimiweb.model.GeneInfo;
import org.ncibi.mimiweb.model.GenePathway;
import org.ncibi.mimiweb.model.GeneProvenance;
import org.ncibi.mimiweb.model.GeneReaction;
import org.ncibi.mimiweb.model.GeneSynonym;

public class MimiModelQueryTests
{
	private static PersistenceSession persistence = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("mimi"));

	@Test
	public void testQueryGeneInfo()
	{
		String hql = "from mimi.GeneInfo where geneid=1436";
		GeneInfo info = persistence.hqlQuery(persistence.session(), hql).single();
		Assert.assertNotNull(info);
	}

	@Test
	public void testQueryGeneSynonym()
	{
		String hql = "from mimi.GeneSynonym where geneid=1436";
		List<GeneSynonym> gs = persistence.hqlQuery(persistence.session(), hql).list();
		Assert.assertNotNull(gs);
		Assert.assertTrue(gs.size() > 0);
	}

	//@Test
	public void testQueryGeneProvenance()
	{
		String hql = "from mimi.GeneProvenance where geneid=1436";
		List<GeneProvenance> gp = persistence.hqlQuery(persistence.session(), hql).list();
		Assert.assertNotNull(gp);
		Assert.assertTrue(gp.size() > 0);
	}

	@Test
	public void testQueryGenePathway()
	{
		String hql = "from mimi.GenePathway where geneid=30";
		List<GenePathway> gp = persistence.hqlQuery(persistence.session(), hql).list();
		Assert.assertNotNull(gp);
		Assert.assertTrue(gp.size() > 0);
	}

	@Test
	public void testQueryGeneCompound()
	{
		String hql = "from mimi.GeneCompound where geneid=1436";
		List<GeneCompound> gc = persistence.hqlQuery(persistence.session(), hql).list();
		Assert.assertNotNull(gc);
		Assert.assertTrue(gc.size() > 0);
	}

	@Test
	public void testQueryGeneEnzyme()
	{
		String hql = "from mimi.GeneEnzyme where geneid=1436";
		List<GeneEnzyme> ge = persistence.hqlQuery(persistence.session(), hql).list();
		Assert.assertNotNull(ge);
		Assert.assertTrue(ge.size() > 0);
	}
	
	@Test
	public void testQueryGeneReaction()
	{
	    String hql = "from mimi.GeneReaction where rid='R00006'";
	    GeneReaction gr = persistence.hqlQuery(persistence.session(), hql).single();
	    Assert.assertNotNull(gr);
	    Assert.assertTrue("R00006".equals(gr.getRid()));
	}
	
	@Test
	public void testQueryGeneReaction2(){
		PersistenceSession metdb = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("metdb"));
	    String hql = "from metdb.Reaction where rid='R00006'";
	    List<Reaction> reactionList = metdb.hqlQuery(metdb.session(), hql).list();
	    System.out.println("Reactions: ");
	    for (Reaction r: reactionList){
	    	System.out.println("  " + r.getRid() + r.getEnzymes());
	    }
	}
}
