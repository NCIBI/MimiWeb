package org.ncibi.util;

import org.ncibi.commons.config.ProjectConfiguration;

public class PropertyUtil
{
	private PropertyUtil()
	{
	}

	public static <T> String cleanNullValues(T value)
	{
		return value == null ? "" : value.toString();
	}

	public static String getLuceneDirProperty() {
	    return ProjectConfiguration.getDefaultedProjectProperty("lucene.dir", "/lucene.dir/not/set");
	}
}
