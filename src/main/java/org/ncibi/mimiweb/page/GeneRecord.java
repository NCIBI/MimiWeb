package org.ncibi.mimiweb.page;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.ncibi.lucene.MimiDocument;
import org.ncibi.util.JavascriptUtil;
import org.ncibi.util.PropertyUtil;

public class GeneRecord {
	
	private MimiDocument document;
	
	public GeneRecord(MimiDocument document) {
		this.document = document;
	}
	
	public String toString() {
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
				"  \"" + PropertyUtil.cleanNullValues(document.pathwayCount) + "\"]";
	}
	
	private String convertStringToJSArray(String input) {
		List<String> output = new ArrayList<String>();
		input = input.trim();
		String[] inputArray = PropertyUtil.cleanNullValues(input).split(";");
		for (String in: inputArray){
			String[] outputTerm = in.split("\\[GO:");
			if(outputTerm.length < 2) continue;
			outputTerm[0] = "\"" +outputTerm[0].trim() + "\"";
			outputTerm[1] = "\"" +outputTerm[1].replace(']',' ').trim() + "\"";
			output.add(JavascriptUtil.toJSArray(Arrays.asList(outputTerm)));
		}
		return JavascriptUtil.toJSArray(output);
	}
}
