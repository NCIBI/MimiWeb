package org.ncibi.mimiweb.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.ncibi.util.PropertyUtil;

@Entity(name = "pubmed.Citation")
@Table (name = "Citation", schema = "dbo")
public class Citation implements java.io.Serializable
{
	private static final long serialVersionUID = -153572773007114915L;

	private int citationId;
    private int pmid;
    private String type;
    private String issn;
    private String isoAbr;
    private String nlmTa;
    private String nlmId;
    private String volume;
    private String issue;
    private String pages;
    private String title;
    private String abstract_;
    private String authorList;
    private Date date;
    
    @Id
    @Column(name = "citationID", unique = true, nullable = false)
	public int getCitationId() {
		return citationId;
	}
	public void setCitationId(int citationId) {
		this.citationId = citationId;
	}

    @Column(name = "PMID")
	public int getPmid() {
		return pmid;
	}
	public void setPmid(int pmid) {
		this.pmid = pmid;
	}

    @Column(name = "type")
    public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

    @Column(name = "ISSN")
	public String getIssn() {
		return issn;
	}
	public void setIssn(String issn) {
		this.issn = issn;
	}
	
    @Column(name = "isoAbr")
	public String getIsoAbr() {
		return isoAbr;
	}
	public void setIsoAbr(String isoAbr) {
		this.isoAbr = isoAbr;
	}
	
    @Column(name = "nlmTA")
	public String getNlmTa() {
		return nlmTa;
	}
	public void setNlmTa(String nlmTa) {
		this.nlmTa = nlmTa;
	}

    @Column(name = "nlmID")
	public String getNlmId() {
		return nlmId;
	}
	public void setNlmId(String nlmId) {
		this.nlmId = nlmId;
	}

    @Column(name = "volume")
	public String getVolume() {
		return volume;
	}
	public void setVolume(String volume) {
		this.volume = volume;
	}

    @Column(name = "issue")
	public String getIssue() {
		return issue;
	}
	public void setIssue(String issue) {
		this.issue = issue;
	}

    @Column(name = "pages")
	public String getPages() {
		return pages;
	}
	public void setPages(String pages) {
		this.pages = pages;
	}

    @Column(name = "title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

    @Column(name = "abstract")
	public String getAbstract() {
		return abstract_;
	}
	public void setAbstract(String abstract_) {
		this.abstract_ = abstract_;
	}

    @Column(name = "authorList")
	public String getAuthorList() {
		return authorList;
	}
	public void setAuthorList(String authorList) {
		this.authorList = authorList;
	}

    @Column(name = "date")
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString()
	{
		int pubmedId = getPmid();
		int year = Integer.parseInt(new SimpleDateFormat("yyyy").format(getDate()));
		String citation = getNlmTa() + " -\\n" 
			+ getVolume() + "(" + getIssue() + ")" + ":"+getPages()+ ",\\n" 
			+ new SimpleDateFormat("MM/dd/yyyy").format(getDate());  
		String title = getTitle().replace("\"", "\\\"");
		String authors = getAuthorList();
		
		return "[ \"" + PropertyUtil.cleanNullValues(pubmedId) + "\", \"" + "View" + "\", \""
				+ PropertyUtil.cleanNullValues(year) + "\", \"" + PropertyUtil.cleanNullValues(citation) + "\", \"" 
				+ PropertyUtil.cleanNullValues(title) + "\", \"" + PropertyUtil.cleanNullValues(authors) + "\"]";
	}

}
