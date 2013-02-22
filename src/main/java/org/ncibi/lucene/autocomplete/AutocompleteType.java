package org.ncibi.lucene.autocomplete;

public enum AutocompleteType
{
	ID("GeneID"), DESCRIPTION("Description"), SYMBOL("Symbol");

	private final String printName;

	private AutocompleteType(String printName)
	{
		this.printName = printName;
	}

	public String toString()
	{
		return printName;
	}
}
