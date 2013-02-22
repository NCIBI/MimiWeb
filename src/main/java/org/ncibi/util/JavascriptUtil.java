package org.ncibi.util;

import java.util.ArrayList;
import java.util.List;

import com.google.common.base.Joiner;

public class JavascriptUtil
{
	public static <T> String toJSArray(List<T> objs)
	{
		List<String> objects = new ArrayList<String>();
		for (T g : objs)
		{
			objects.add(g.toString());
		}

		return "[ " + Joiner.on(',').join(objects) + " ]";
	}

}
