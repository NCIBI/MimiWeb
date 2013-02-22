package org.ncibi.mimiweb.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.ncibi.db.metdb.Compound;
import org.ncibi.util.JavascriptUtil;
import org.ncibi.util.PropertyUtil;

public class CompoundJSTableModel {
	
	private Collection<Compound> compounds;
	
	public CompoundJSTableModel(Collection<Compound> compounds) {
		this.compounds = compounds;
	}
	
	public String toString() {
		List<String> ret = new ArrayList<String>();
		for(Compound compound: compounds) {
			String entry = "[ \"" + PropertyUtil.cleanNullValues(compound.getCid()) + "\", \"" + PropertyUtil.cleanNullValues(compound.getName()) + "\", \""
			+ PropertyUtil.cleanNullValues(compound.getFormula()) + "\", \"" + PropertyUtil.cleanNullValues(compound.getMw()) + "\", \""
			+ PropertyUtil.cleanNullValues(compound.getCasnum()) + "\",   \"" + PropertyUtil.cleanNullValues(compound.getSmile()) + "\"]";
			ret.add(entry);
		}
		return JavascriptUtil.toJSArray(ret);
	}

}
