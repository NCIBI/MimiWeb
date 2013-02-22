package org.ncibi.mimiweb.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.ncibi.db.metdb.Pathway;
import org.ncibi.util.JavascriptUtil;
import org.ncibi.util.PropertyUtil;

public class PathwayJSTableModel {
	
	private Collection<Pathway> pathways;
	
	public PathwayJSTableModel(Collection<Pathway> pathways) {
		this.pathways = pathways;
	}
	
	public String toString() {
		List<String> ret = new ArrayList<String>();
		for(Pathway pathway: pathways) {
	    	String geneLink = "<a href=pathway?pathwayid=" + pathway.getPid() + ">View Related</a>";
			String entry = "[ \"" + PropertyUtil.cleanNullValues(pathway.getPid()) + "\", \""
			+ PropertyUtil.cleanNullValues(pathway.getName()) + "\", \"" 
			+ PropertyUtil.cleanNullValues(pathway.getProvenance().getProvSource()) + "\", \"" 
			+ geneLink + "\"]";
			ret.add(entry);
		}
		return JavascriptUtil.toJSArray(ret);
	}

}
