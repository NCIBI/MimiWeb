package org.ncibi.mimiweb.page;

import org.ncibi.db.metdb.Compound;
import org.ncibi.util.PropertyUtil;

public class CompoundRecord {
	
	private Compound compound;
	
	public CompoundRecord(Compound compound) {
		this.compound = compound;
	}
	
	public String toString() {
		return "[ \"" + PropertyUtil.cleanNullValues(compound.getCid()) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(compound.getName()) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(compound.getFormula()) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(compound.getMw()) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(compound.getCasnum()) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(compound.getSmile()) + "\"]";
	}
}
