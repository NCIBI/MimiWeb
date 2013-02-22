package org.ncibi.mimiweb.page;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.ncibi.mimiweb.model.Citation;

public class DocumentDetailCitationCover {
	
	private final Citation c;
	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy MMM d");	

	DocumentDetailCitationCover(Citation c){
		this.c = c;
	}

	public String getPmid() {
		return "" + c.getPmid();
	}
	
	public String getTitle() {
		return c.getTitle();
	}
	
	public String getAuthorList() {
		return c.getAuthorList();
	}
	
	public String getJournal(){
		return c.getIsoAbr();
	}
	
	public String getDate() {
		Date d = c.getDate();
		return dateFormat.format(d);
	}
	
	public String getVolumn(){
		return c.getVolume();
	}
	
	public String getIssue(){
		return c.getIssue();
	}
	
	public String getPages(){
		return c.getPages();
	}

	public String makePublicationString(Citation c){
		// for 19351817: Cancer Res. 2009 Apr 15;69(8):3681-8. Epub 2009 Apr 7.
		Date d = c.getDate();
		return c.getIsoAbr() + " " + dateFormat.format(d) + ";" + c.getVolume() + "(" + c.getIssue() + ")" +
				":" + c.getPages();
	}

}
