package org.ncibi.mimiweb.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.ncibi.util.PropertyUtil;

@Entity(name = "mimi.GeneReaction")
@Table(name = "GeneReaction")
public class GeneReaction
{
    private GeneReactionPk id;

    @Id
    public GeneReactionPk getId()
    {
        return id;
    }

    public void setId(GeneReactionPk id)
    {
        this.id = id;
    }
    
    @Transient
    public int getGeneid()
    {
    	return id.getGeneid();
    }

    @Transient
    public String getRid()
    {
        return id.getRid();
    }

    @Transient
    public boolean isReversible()
    {
        return id.isReversible();
    }

    @Transient
    public String getEquation()
    {
        return id.getEquation();
    }

    @Override
    public String toString()
    {
        return "[ \"" + PropertyUtil.cleanNullValues(getRid()) + "\", \"" + isReversible() + "\", \""
                + PropertyUtil.cleanNullValues(getEquation()) + "\"]";
    }
}
