package org.ncibi.mimiweb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class GeneEnzymePk implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    private int geneid;
    private String ecnum;   
    private String name;

    @Column(name = "geneid")
    public int getGeneid()
    {
        return geneid;
    }

    public void setGeneid(int geneid)
    {
        this.geneid = geneid;
    }

    @Column(name = "ecnum")
    public String getEcnum()
    {
        return ecnum;
    }

    public void setEcnum(String ecnum)
    {
        this.ecnum = ecnum;
    }

    @Column(name = "name")
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }
}
