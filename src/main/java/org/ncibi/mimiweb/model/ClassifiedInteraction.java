package org.ncibi.mimiweb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.ncibi.util.PropertyUtil;

/**
 * This is a derived class, it doesn't quite look like the table (never mind the @Table designator).
 * 
 * @author gtarcea
 *
 */
@Entity
@Table(name="ClassifiedInteraction", schema="gin")
public class ClassifiedInteraction
{
    @Id @Column(name = "interactionID")
    private Integer interactionID;
    
    @Column(name = "geneID1")
    private Integer geneID1;
    
    @Column(name = "symbol1")
    private String symbol1;
    
    @Column(name = "tag1")
    private String tag1;
    
    @Column(name = "geneID2")
    private Integer geneID2;
    
    @Column(name = "symbol2")
    private String symbol2;
    
    @Column(name = "tag2")
    private String tag2;
    
    @Column(name = "sentenceID")
    private Integer sentenceID;
    
    @Column(name = "sentence")
    private String sentence;
    
    @Column(name = "typeID")
    private Integer typeID;
    
    @Column(name = "type")
    private String type;
    
    @Column(name = "fact")
    private Byte fact;
    
    @Column(name = "provenanceID")
    private Integer provenanceID;
    
    @Column(name = "PMID")
    private Integer pmid;

    /**
     * @return the interactionID
     */
    public Integer getInteractionID()
    {
        return interactionID;
    }

    /**
     * @param interactionID The interactionID to set
     */
    public void setInteractionID(Integer interactionID)
    {
        this.interactionID = interactionID;
    }

    /**
     * @return the geneID1
     */
    public Integer getGeneID1()
    {
        return geneID1;
    }

    /**
     * @param geneID1 The geneID1 to set
     */
    public void setGeneID1(Integer geneID1)
    {
        this.geneID1 = geneID1;
    }
    
    /**
     * @return the symbol1
     */
    public String getSymbol1()
    {
        return symbol1;
    }

    /**
     * @param symbol1 The symbol1 to set
     */
    public void setSymbol1(String symbol1)
    {
        this.symbol1 = symbol1;
    }

    /**
     * @return the tag1
     */
    public String getTag1()
    {
        return tag1;
    }

    /**
     * @param tag1 The tag1 to set
     */
    public void setTag1(String tag1)
    {
        this.tag1 = tag1;
    }

    /**
     * @return the geneID2
     */
    public Integer getGeneID2()
    {
        return geneID2;
    }

    /**
     * @param geneID2 The geneID2 to set
     */
    public void setGeneID2(Integer geneID2)
    {
        this.geneID2 = geneID2;
    }
    
    /**
     * @return the symbol2
     */
    public String getSymbol2()
    {
        return symbol2;
    }

    /**
     * @param symbol2 The symbol2 to set
     */
    public void setSymbol2(String symbol2)
    {
        this.symbol2 = symbol2;
    }

    /**
     * @return the tag2
     */
    public String getTag2()
    {
        return tag2;
    }

    /**
     * @param tag2 The tag2 to set
     */
    public void setTag2(String tag2)
    {
        this.tag2 = tag2;
    }

    /**
     * @return the sentenceID
     */
    public Integer getSentenceID()
    {
        return sentenceID;
    }

    /**
     * @param sentenceID The sentenceID to set
     */
    public void setSentenceID(Integer sentenceID)
    {
        this.sentenceID = sentenceID;
    }

    /**
     * @return the typeID
     */
    public Integer getTypeID()
    {
        return typeID;
    }

    /**
     * @param typeID The typeID to set
     */
    public void setTypeID(Integer typeID)
    {
        this.typeID = typeID;
    }

    /**
     * @return the type
     */
    public String getType()
    {
        return type;
    }

    /**
     * @param type The type to set
     */
    public void setType(String type)
    {
        this.type = type;
    }

    /**
     * @return the fact
     */
    public Byte getFact()
    {
        return fact;
    }

    /**
     * @param fact The fact to set
     */
    public void setFact(Byte fact)
    {
        this.fact = fact;
    }

    /**
     * @return the provenanceID
     */
    public Integer getProvenanceID()
    {
        return provenanceID;
    }

    /**
     * @param provenanceID The provenanceID to set
     */
    public void setProvenanceID(Integer provenanceID)
    {
        this.provenanceID = provenanceID;
    }

    /**
     * @return the sentence
     */
    public String getSentence()
    {
        return sentence;
    }

    /**
     * @param sentence The sentence to set
     */
    public void setSentence(String sentence)
    {
        this.sentence = sentence;
    }

    /**
     * @return the pmid
     */
    public Integer getPmid()
    {
        return pmid;
    }

    /**
     * @param pmid The pmid to set
     */
    public void setPmid(Integer pmid)
    {
        this.pmid = pmid;
    }
    
    public String toString() {
    	return "[ \"" + PropertyUtil.cleanNullValues(getGeneID1()) + "\", " +
    	"  \"" + PropertyUtil.cleanNullValues(getSymbol1()) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(getTag1()) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(getGeneID2()) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(getSymbol2()) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(getTag2()) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(getType()) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(getSentence()) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(getPmid()) + "\", " +
		"  \"" + "View" + "\"]";
    }
}
