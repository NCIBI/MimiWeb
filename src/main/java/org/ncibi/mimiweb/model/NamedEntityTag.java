package org.ncibi.mimiweb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

@Entity(name = "pubmed.NamedEntityTag")
@Table (name = "NamedEntityTag", schema = "dbo") 
@SecondaryTable(
		name = "Tag2Gene", 
		pkJoinColumns = @PrimaryKeyJoinColumn(name="tagID", referencedColumnName="tagID")
)
public class NamedEntityTag {

    private int id;
    private int sentenceId;
    private int matchTypeId;
    private String actualString;
    private String matchString;
    private int firstChar;
    private int lastChar;
    private int cost;
    private int provenanceId;
    private int mask;
    private int geneID;
    private int nameID;
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column (name = "tagID", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "sentenceID")
	public int getSentenceId() {
		return sentenceId;
	}

	public void setSentenceId(int sentenceId) {
		this.sentenceId = sentenceId;
	}
	
	@Column(name = "matchTypeID")
	public int getMatchTypeId() {
		return matchTypeId;
	}

	public void setMatchTypeId(int matchTypeId) {
		this.matchTypeId = matchTypeId;
	}
	
	@Column(name = "actualString")
	public String getActualString() {
		return actualString;
	}

	public void setActualString(String actualString) {
		this.actualString = actualString;
	}
	
	@Column(name = "matchString")
	public String getMatchString() {
		return matchString;
	}

	public void setMatchString(String matchString) {
		this.matchString = matchString;
	}
	
	@Column(name = "firstChar")
	public int getFirstChar() {
		return firstChar;
	}

	public void setFirstChar(int firstChar) {
		this.firstChar = firstChar;
	}
	
	@Column(name = "lastChar")
	public int getLastChar() {
		return lastChar;
	}

	public void setLastChar(int lastChar) {
		this.lastChar = lastChar;
	}
	
	@Column(name = "cost")
	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	@Column(name = "provenanceID")
	public int getProvenanceId() {
		return provenanceId;
	}

	public void setProvenanceId(int provenanceId) {
		this.provenanceId = provenanceId;
	}
	
	@Column(name = "mask")
	public int getMask() {
		return mask;
	}

	public void setMask(int mask) {
		this.mask = mask;
	}
	
	@Column(table = "Tag2Gene", name = "geneID")
	public int getGeneID() {
		return geneID;
	}

	public void setGeneID(int geneID) {
		this.geneID = geneID;
	}

	@Column(table = "Tag2Gene", name = "nameID")
	public int getNameID() {
		return nameID;
	}

	public void setNameID(int nameID) {
		this.nameID = nameID;
	}
}
