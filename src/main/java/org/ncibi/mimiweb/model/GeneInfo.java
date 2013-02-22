package org.ncibi.mimiweb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "mimi.GeneInfo")
@Table (name = "GeneInfo")
public class GeneInfo
{
    private int geneid;
    private int taxid;
    private String symbol;
    private String locustag;
    private String chromosome;
    private String maploc;
    private String geneDescription;
    private String geneName;
    private String geneType;
    private String taxclass; 
    private String taxname;

    @Id
    @Column (name = "geneid", unique = true, nullable = false)
    public int getGeneid()
    {
        return geneid;
    }

    public void setGeneid(int geneid)
    {
        this.geneid = geneid;
    }

    @Column(name = "taxid")
    public int getTaxid()
    {
        return taxid;
    }

    public void setTaxid(int taxid)
    {
        this.taxid = taxid;
    }

    @Column(name="symbol")
    public String getSymbol()
    {
        return symbol;
    }

    public void setSymbol(String symbol)
    {
        this.symbol = symbol;
    }

    @Column(name="locustag")
    public String getLocustag()
    {
        return locustag;
    }

    public void setLocustag(String locustag)
    {
        this.locustag = locustag;
    }

    @Column(name="chromosome")
    public String getChromosome()
    {
        return chromosome;
    }

    public void setChromosome(String chromosome)
    {
        this.chromosome = chromosome;
    }

    @Column(name="maploc")
    public String getMaploc()
    {
        return maploc;
    }

    public void setMaploc(String maploc)
    {
        this.maploc = maploc;
    }

    @Column(name="geneDescription")
    public String getGeneDescription()
    {
        return geneDescription;
    }

    public void setGeneDescription(String geneDescription)
    {
        this.geneDescription = geneDescription;
    }

    @Column(name="geneName")
    public String getGeneName()
    {
        return geneName;
    }

    public void setGeneName(String geneName)
    {
        this.geneName = geneName;
    }

    @Column(name="geneType")
    public String getGeneType()
    {
        return geneType;
    }

    public void setGeneType(String geneType)
    {
        this.geneType = geneType;
    }

    @Column(name="taxclass")
    public String getTaxclass()
    {
        return taxclass;
    }

    public void setTaxclass(String taxclass)
    {
        this.taxclass = taxclass;
    }

    @Column(name="taxname")
    public String getTaxname()
    {
        return taxname;
    }

    public void setTaxname(String taxname)
    {
        this.taxname = taxname;
    }

    @Override
    public String toString()
    {
        return "GeneInfo [geneid=" + geneid + ", taxid=" + taxid + ", symbol=" + symbol + ", locustag="
                + locustag + ", chromosome=" + chromosome + ", maploc=" + maploc + ", geneDescription="
                + geneDescription + ", geneName=" + geneName + ", geneType=" + geneType + ", taxclass="
                + taxclass + ", taxname=" + taxname + "]";
    }
}
