package org.ncibi.mimiweb.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.ncibi.lucene.MimiDocument;
import org.ncibi.util.JavascriptUtil;
import org.ncibi.util.PropertyUtil;

public class DocumentGeneJSTableModel {
	
	private Collection<MimiDocument> mergedGeneDocs;
	private Collection<MimiDocument> taggedGeneDocs;
	private Map<Integer, String> taggedGeneMap;
	
	public DocumentGeneJSTableModel
		(Collection<MimiDocument> mergedGeneDocs, Collection<MimiDocument> taggedGeneDocs,
				Map<Integer, String> taggedGeneMap) {
		this.mergedGeneDocs = mergedGeneDocs;
		this.taggedGeneDocs = taggedGeneDocs;
		this.taggedGeneMap = taggedGeneMap;
	}
	
	public String toString() {
		List<String> ret = new ArrayList<String>();
		for(MimiDocument document: mergedGeneDocs) {
			ret.add(buildTableEntry(document, "merge", "-"));
		}
		for(MimiDocument document: taggedGeneDocs) {
			ret.add(buildTableEntry(document, "tag", taggedGeneMap.get(document.geneid)));
		}
		return JavascriptUtil.toJSArray(ret);
	}
	
	private String buildTableEntry(MimiDocument document, String from, String tag) {
		return "[ \"" + PropertyUtil.cleanNullValues(document.geneid) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(document.geneSymbol) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(document.sciTaxName) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(document.geneType) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(document.moleculeNames) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(document.geneDescription) + "\", " +
		convertStringToJSArray(document.cellularComponents) + ", " +
		convertStringToJSArray(document.biologicalProcesses) + ", " +
		convertStringToJSArray(document.molecularFunctions) + ", " +
		"  \"" + PropertyUtil.cleanNullValues(document.interactionCount) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(document.pubCount) + "\", " +
		"  \"" + PropertyUtil.cleanNullValues(document.pathwayCount) + "\", " +
		"  \"" + from + "\", " +
		"  \"" + tag + "\"]";
	}
	
	private String convertStringToJSArray(String input) {
		List<String> output = new ArrayList<String>();
		input = input.trim();
		String[] inputArray = PropertyUtil.cleanNullValues(input).split(";");
		for (String in: inputArray){
			String[] outputTerm = in.split("\\[");
			if(outputTerm.length < 2) continue;
			outputTerm[0] = "\"" +outputTerm[0].trim() + "\"";
			outputTerm[1] = "\"" +outputTerm[1].replace(']',' ').trim() + "\"";
			output.add(JavascriptUtil.toJSArray(Arrays.asList(outputTerm)));
		}
		return JavascriptUtil.toJSArray(output);
	}

}
