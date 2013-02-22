package org.ncibi.mimiweb.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity(name = "mimi.GeneSynonym")
@Table (name = "GeneSynonym")
public class GeneSynonym
{
    private GeneSynonymPk id;

    @Id
    public GeneSynonymPk getId()
    {
        return id;
    }

    public void setId(GeneSynonymPk id)
    {
        this.id = id;
    }
    
    @Transient
    public int getGeneid()
    {
        return id.getGeneid();
    }
    
    @Transient
    public String getName()
    {
        return id.getName();
    }

    @Override
    public String toString()
    {
        return "GeneSynonym [geneid=" + getGeneid() + ", name=" + getName() + "]";
    }
}
