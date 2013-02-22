package org.ncibi.mimiweb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class GeneProvenancePk implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    private int geneid;    
    private String source;

    @Column(name = "geneid")
    public int getGeneid()
    {
        return geneid;
    }

    public void setGeneid(int geneid)
    {
        this.geneid = geneid;
    }

    @Column(name = "source")
    public String getSource()
    {
        return source;
    }

    public void setSource(String source)
    {
        this.source = source;
    }
    
    
}
