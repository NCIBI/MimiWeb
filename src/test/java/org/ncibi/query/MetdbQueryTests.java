package org.ncibi.query;

import junit.framework.Assert;

import org.junit.Test;
import org.ncibi.db.EntityManagers;
import org.ncibi.db.PersistenceSession;
import org.ncibi.db.PersistenceUnit;
import org.ncibi.db.metdb.Reaction;

public class MetdbQueryTests
{
    private static PersistenceSession persistence = new PersistenceUnit(
            EntityManagers.newEntityManagerFromProject("metdb"));
    
    @Test
    public void testReactionQuery()
    {
        String hql = "from metdb.Reaction where rid = 'RE3036'";
        Reaction r = persistence.hqlQuery(persistence.session(), hql).single();
        Assert.assertNotNull(r);
        Assert.assertNotNull(r.getEnzymes());
        Assert.assertTrue(r.getEnzymes().size() != 0);
    }
}
