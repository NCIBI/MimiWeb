package org.ncibi.mimiweb.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.ncibi.db.metdb.ReactionEquationDenorm;
import org.ncibi.util.JavascriptUtil;
import org.ncibi.util.PropertyUtil;

public class ReactionJSTableModel {
	
	private Collection<ReactionEquationDenorm> reactions;
	
	public ReactionJSTableModel(Collection<ReactionEquationDenorm> reactions) {
		this.reactions = reactions;
	}
	
	public String toString() {
		List<String> ret = new ArrayList<String>();
		for(ReactionEquationDenorm r: reactions) {
			ret.add("[ \"" + PropertyUtil.cleanNullValues(r.getRid()) + "\", \"" + PropertyUtil.cleanNullValues(r.isReversible()) + "\", \""
                + PropertyUtil.cleanNullValues(r.getEquation()) + "\"]");
		}
		return JavascriptUtil.toJSArray(ret);
	}

}
