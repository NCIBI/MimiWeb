package org.ncibi.mimiweb.page;

import java.util.ArrayList;
import java.util.List;

import org.ncibi.db.EntityManagers;
import org.ncibi.db.PersistenceSession;
import org.ncibi.db.PersistenceUnit;
import org.ncibi.db.mimi2.GeneGeneInteraction;
import org.ncibi.util.NumUtils;

public class InteractionSearch {

	PersistenceSession persistence = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("mimi"));

	public List<InteractionRecord> doSearch(String gene1, String gene2) {
		List<InteractionRecord> ret = new ArrayList<InteractionRecord>();
		if((gene1 == null || gene1.isEmpty()) && (gene2 == null || gene2.isEmpty()))
			return ret;
		
		String symbol1 = null;
		String symbol2 = null;
		Integer geneid1 = null;
		Integer geneid2 = null;
		
		if(NumUtils.toInteger(gene1) != null) geneid1 = NumUtils.toInteger(gene1);
		else symbol1 = gene1;
		
		if(NumUtils.toInteger(gene2) != null) geneid2 = NumUtils.toInteger(gene2);
		else symbol2 = gene2;
		
		String query = "from mimi.GeneGeneInteraction where";
		if(symbol1 != null && !symbol1.isEmpty()) {
			query = query + " symbol1='" + symbol1 + "'";
		}
		else if(geneid1 != null) {
			query = query + " geneid1='" + geneid1 + "'";
		}
		if((gene1 != null && !gene1.isEmpty()) && (gene2 != null && !gene2.isEmpty())) {
			query = query + " and";
		}
		if(symbol2 != null && !symbol2.isEmpty()) {
			query = query + " symbol2='" + symbol2 + "'";
		}
		else if(geneid2 != null) {
			query = query + " geneid2='" + geneid2 + "'";
		}

		List<GeneGeneInteraction> output = persistence.hqlQuery(persistence.session(), query).list();
		for(GeneGeneInteraction interaction: output) {
			InteractionRecord result = new InteractionRecord(interaction);
			ret.add(result);
		}

		return ret;
	}

	public List<String> getGeneSymbolsForInteraction(int ggIntId) {
		List<String> geneSymbols = new ArrayList<String>();
		String sql = "select symbol1, symbol2 from denorm.GeneGeneInteraction where ggIntID=" + ggIntId;
		Object[] values = persistence.sqlQuery(sql).single();
		if ((values == null) || (values.length < 2) || (!(values[0] instanceof String)))
				return null;
		for (Object o: values){
			geneSymbols.add((String)o);
		}
		return geneSymbols;
	}
}
