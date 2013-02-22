package org.ncibi.query;

import java.util.List;

import org.hibernate.Session;
import org.junit.Test;
import org.ncibi.db.EntityManagers;
import org.ncibi.db.PersistenceSession;
import org.ncibi.db.PersistenceUnit;
import org.ncibi.hibernate.SessionFunction;
import org.ncibi.hibernate.Sessions;
import org.ncibi.mimiweb.model.GeneAttribute2;

public class SqlQueryExampleTests
{
	private static PersistenceSession persistence = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("mimi"));

	// @Test
	public void testSimpleSqlQueryUsingSessions()
	{
		/*
		 * When using SQL you can't use the Hibernate name for object, you have
		 * to use the SQL path.
		 */
		final String sql = "select distinct attrValue from denorm.GeneAttribute where geneid=1436 and attrType = 'process'";
		List<String> processes = Sessions.withSession(persistence.session(), new SessionFunction<List<String>>()
		{
			@SuppressWarnings("unchecked")
			public List<String> apply(Session session)
			{
				return session.createSQLQuery(sql).list();
			}
		});

		System.out.println(processes);
	}

	@Test
	public void testSimpleSqlQueryUsingPersistenceDotSqlQuery()
	{
		final String sql = "select distinct attrValue from denorm.GeneAttribute where geneid=1436 and attrType = 'process'";
		List<String> processes = persistence.sqlQuery(persistence.session(), sql).list();
		System.out.println(processes);
	}

	// @Test
	public void testHibernateObjectSqlQuery()
	{
		String sql = "select distinct * from denorm.GeneAttribute where geneid=1436";
		List<GeneAttribute2> attributes = persistence.sqlQuery(persistence.session(), sql).bind(GeneAttribute2.class).list();
		System.out.println(attributes);
	}
}
