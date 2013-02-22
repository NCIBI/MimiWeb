package org.ncibi.mimiweb.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.ncibi.util.PropertyUtil;

@Entity(name = "mimi.GeneEnzyme")
@Table (name = "GeneEnzyme")
public class GeneEnzyme
{
    private GeneEnzymePk id;

    @Id
    public GeneEnzymePk getId()
    {
        return id;
    }

    public void setId(GeneEnzymePk id)
    {
        this.id = id;
    }

    @Transient
    public int getGeneid()
    {
        return id.getGeneid();
    }

    @Transient
    public String getEcnum()
    {
        return id.getEcnum();
    }  

    @Transient
    public String getName()
    {
        return id.getName();
    }

    @Override
    public String toString()
    {
    	return "[ \"" + PropertyUtil.cleanNullValues(getEcnum()) + "\",   \"" + PropertyUtil.cleanNullValues(getName()) + "\"]";
    }
}
