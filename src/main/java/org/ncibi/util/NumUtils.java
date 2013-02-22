package org.ncibi.util;

import java.text.NumberFormat;
import java.text.ParsePosition;

public class NumUtils {

	private NumUtils() {};

	private static NumberFormat numberFormat = NumberFormat.getInstance();

	public static Integer toInteger(String value) {
		if(value != null) {
			value = value.trim();
			ParsePosition pos = new ParsePosition(0);
			Number returnValue = numberFormat.parse(value,pos);
			if(returnValue != null && pos.getIndex() == value.length())
				return returnValue.intValue();
		}
		return null;
	}
	
}
