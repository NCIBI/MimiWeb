package org.ncibi.mimiweb.page;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;

public class GeneListSearchTest {

	String[] geneIdArray = {"6827","6829","6830","6832",
			"6833","6834","6835","6836","6837","6839","6840",
			"6843","6844","6845","6847","6850","6853","6854","6855","6857"};
	String[] geneSymbolArray = {"CSF!R","CSF1","CSF","PWP1"};
	
	@Test
	public void test1(){
		List<String> geneIdList = new ArrayList<String>();
		for (String s: geneIdArray) geneIdList.add(s);
		
		List<GeneRecord> results = 
			(new GeneListSearch().doSearch(geneIdList, 9606));
		boolean found = false;
		for (GeneRecord result: results) {
			if (result.toString().contains("6835")) found = true;
		}
		Assert.assertTrue(found);
	}

	public void test2(){
		List<String> geneSymbolList = new ArrayList<String>();
		for (String s: geneSymbolArray) geneSymbolList.add(s);

		List<GeneRecord> results = 
			(new GeneListSearch().doSearch(geneSymbolList, 9606));
		boolean found = false;
		for (GeneRecord result: results) {
			if (result.toString().contains("CSF1R")) found = true;
		}
		Assert.assertTrue(found);
		
	}
}
