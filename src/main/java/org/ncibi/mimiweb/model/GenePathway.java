package org.ncibi.mimiweb.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.ncibi.util.PropertyUtil;

@Entity(name = "mimi.GenePathway")
@Table (name = "GenePathway")
public class GenePathway
{
    private GenePathwayPk id;

    @Id
    public GenePathwayPk getId()
    {
        return id;
    }

    public void setId(GenePathwayPk id)
    {
        this.id = id;
    }
    
    @Transient
    public int getGeneid()
    {
        return id.getGeneid();
    }
    
    @Transient
    public String getPid()
    {
        return id.getPid();
    }
    
    @Transient
    public String getName()
    {
        return id.getName();
    }
    
    @Transient
    public String getSource()
    {
        return id.getSource();
    }

    @Override
	public String toString()
	{
    	String geneLink = "<a href=pathway?pathwayid=" + getPid() + ">View Related</a>";
		return "[ \"" + PropertyUtil.cleanNullValues(getPid()) + "\", \"" + PropertyUtil.cleanNullValues(getName())
			+ "\", \"" + PropertyUtil.cleanNullValues(getSource()) + "\", \"" + geneLink + "\"]";
	}
}
