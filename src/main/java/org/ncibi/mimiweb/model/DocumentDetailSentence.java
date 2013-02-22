package org.ncibi.mimiweb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/*
select c.PMID as pmid, sc.sectionNum as sectionNumber, 
p.paragraphNum as paragraphNumber, s.sentenceNum as sentenceNumber, 
sentence
from Citation c
join Section sc on c.documentID = sc.documentID
	join Paragraph p on sc.sectionID = p.sectionID
		join Sentence s on p.paragraphID = s.paragraphID
where c.PMID = 1828037
order by sc.sectionNum, p.paragraphNum, s.sentenceNum
*/

@Entity(name = "pubmed.DocumentDetailSentence")
public class DocumentDetailSentence {

	@Id
	@Column (name = "id")
	private int id;
	
	@Column (name = "pmid")
	private int pmid;
	
    @Column (name = "sectionNumber")
	private int sectionNumber;
	
    @Column (name = "paragraphNumber")
	private int paragraphNumber;
	
    @Column (name = "sentenceNumber")
	private int sentenceNumber;

    @Column (name = "sentence")
	private String sentence;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPmid() {
		return pmid;
	}

	public void setPmid(int pmid) {
		this.pmid = pmid;
	}

	public int getSectionNumber() {
		return sectionNumber;
	}

	public void setSectionNumber(int sectionNumber) {
		this.sectionNumber = sectionNumber;
	}

	public int getParagraphNumber() {
		return paragraphNumber;
	}

	public void setParagraphNumber(int paragraphNumber) {
		this.paragraphNumber = paragraphNumber;
	}

	public int getSentenceNumber() {
		return sentenceNumber;
	}

	public void setSentenceNumber(int sentenceNumber) {
		this.sentenceNumber = sentenceNumber;
	}

	public String getSentence() {
		return sentence;
	}

	public void setSentence(String sentence) {
		this.sentence = sentence;
	}
	
	
}
