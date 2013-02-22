package org.ncibi.lucene.autocomplete;

import org.ncibi.lucene.MimiDocument;

public class AutocompleteResult {
	private String matchedString;
	private int matchedPosition;
	private AutocompleteType type;
	private MimiDocument document;
	
	public AutocompleteResult(AutocompleteType type, String input, String matchedString, MimiDocument document) {
		this.type = type;
		this.matchedString = matchedString;
		this.document = document;
		this.matchedPosition = matchedString.indexOf(input);
	}
	
	public String getMatchedString() {
		return matchedString;
	}
	public void setMatchedString(String matchedString) {
		this.matchedString = matchedString;
	}
	public int getMatchedPosition() {
		return matchedPosition;
	}
	public void setMatchedPosition(int matchedPosition) {
		this.matchedPosition = matchedPosition;
	}
	public AutocompleteType getType() {
		return type;
	}
	public void setType(AutocompleteType type) {
		this.type = type;
	}
	public MimiDocument getDocument() {
		return document;
	}
	public void setDocument(MimiDocument document) {
		this.document = document;
	}

}
