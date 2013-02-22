package org.ncibi.mimiweb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "mimi.GeneAttribute")
@Table (name = "GeneAttribute", schema = "denorm")
public class GeneAttribute2
{
    private int geneid;
    private String attrType;   
    private String attrValue;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column (name = "geneid", unique = false, nullable = false)
    public int getGeneid()
    {
        return geneid;
    }

    public void setGeneid(int geneid)
    {
        this.geneid = geneid;
    }

    @Column(name = "attrType")
    public String getAttrType()
    {
        return attrType;
    }

    public void setAttrType(String attrType)
    {
        this.attrType = attrType;
    }

    @Column(name = "attrValue")
    public String getAttrValue()
    {
        return attrValue;
    }

    public void setAttrValue(String attrValue)
    {
        this.attrValue = attrValue;
    }

    @Override
    public String toString()
    {
        return "GeneAttribute2 [geneid=" + geneid + ", attrType=" + attrType + ", attrValue=" + attrValue
                + "]";
    }
}
