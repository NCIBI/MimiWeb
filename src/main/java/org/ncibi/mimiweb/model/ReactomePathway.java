package org.ncibi.mimiweb.model;

import org.ncibi.util.PropertyUtil;

public class ReactomePathway
{
    private Integer id ;
    private String pathname ;
    private String description ;
    
    public Integer getId()
    {
        return id;
    }
    
    public void setId(Integer id)
    {
        this.id = id;
    }
    
    public String getPathname()
    {
        return pathname ;
    }
    
    public void setPathname(String pathname)
    {
        this.pathname = pathname ;
    }
    
    public String getDescription()
    {
        return description ;
    }
    
    public void setDescription(String description)
    {
        this.description = description;
    }
    
    @Override
	public String toString()
	{
		String reactomeLink = "<a href=http://www.reactome.org/cgi-bin/eventbrowser_st_id?ST_ID=" 
			+ getPathname() + ">" +getPathname() + "</a>";
    	return "[ \"" + reactomeLink + "\", \"" + PropertyUtil.cleanNullValues(getDescription())
			+ "\", \"" + "Reactome" + "\", \"" + "-" + "\"]";
	}
}
