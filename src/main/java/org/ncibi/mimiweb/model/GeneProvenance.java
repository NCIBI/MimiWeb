package org.ncibi.mimiweb.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity(name = "mimi.GeneProvenance")
@Table (name = "GeneProvenance")
public class GeneProvenance
{
    private GeneProvenancePk id;

    @Id
    public GeneProvenancePk getId()
    {
        return id;
    }

    public void setId(GeneProvenancePk id)
    {
        this.id = id;
    }
    
    @Transient
    public int getGeneid()
    {
        return id.getGeneid();
    }
    
    @Transient
    public String getSource()
    {
        return id.getSource();
    }

    @Override
    public String toString()
    {
        return "GeneProvenance [geneid=" + getGeneid() + ", source=" + getSource() + "]";
    }
}
