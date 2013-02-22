package org.ncibi.mimiweb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class GeneReactionPk implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    private int geneid;
    private String rid;
    private boolean reversible;   
    private String equation;
    
    @Column(name = "geneid")
    public int getGeneid()
    {
        return geneid;
    }

    public void setGeneid(int geneid)
    {
        this.geneid = geneid;
    }

    @Column(name = "rid")
    public String getRid()
    {
        return rid;
    }

    public void setRid(String rid)
    {
        this.rid = rid;
    }

    @Column(name = "reversible")
    public boolean isReversible()
    {
        return reversible;
    }

    public void setReversible(boolean reversible)
    {
        this.reversible = reversible;
    }

    @Column(name = "equation")
    public String getEquation()
    {
        return equation;
    }

    public void setEquation(String equation)
    {
        this.equation = equation;
    }

    public static long getSerialversionuid()
    {
        return serialVersionUID;
    }
}
