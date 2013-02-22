package org.ncibi.lucene.model;

public class FullTextSearchResult {
	
	private String text;

	public FullTextSearchResult(String string) {
		text=string;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
