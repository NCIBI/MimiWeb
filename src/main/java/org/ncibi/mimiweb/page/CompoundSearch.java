package org.ncibi.mimiweb.page;

import java.util.ArrayList;
import java.util.List;

import org.ncibi.commons.collections.ListUtilities;
import org.ncibi.db.EntityManagers;
import org.ncibi.db.PersistenceSession;
import org.ncibi.db.PersistenceUnit;
import org.ncibi.db.metdb.Compound;

public class CompoundSearch {

	PersistenceSession persistence = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("metdb"));

	public List<CompoundRecord> doSearch(List<String> cids) {

		List<CompoundRecord> ret = new ArrayList<CompoundRecord>();
		if( cids == null || cids.isEmpty())
			return ret;
		String cidsForQuery = ListUtilities.createQuotedCommaJoinedString(cids);
		String query = "from metdb.Compound where cid in (" + cidsForQuery + ")";

		List<Compound> output = persistence.hqlQuery(persistence.session(), query).list();
		for(Compound compound: output) {
			CompoundRecord result = new CompoundRecord(compound);
			ret.add(result);
		}

		return ret;
	}

}
