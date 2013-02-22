package org.ncibi.mimiweb.page;

import junit.framework.Assert;

import org.junit.Test;

public class DocumentDetailTest {
	
	private static final int PMID = 19351817;
	private static final String probeText = "smoking";
	private static final String probeTitle = "Genetic mutations associated with cigarette smoking in pancreatic cancer.";
	

	@Test
	public void annotatedTextTest(){
		
		DocumentDetail dd = new DocumentDetail(PMID);
		String annotatedText = dd.getAnnotatedText();
		//System.out.println(annotatedText);
		Assert.assertNotNull(annotatedText);
		Assert.assertTrue(annotatedText.contains(probeText));
		
	}
	
	@Test
	public void citationTest(){
		
		DocumentDetail dd = new DocumentDetail(PMID);
		DocumentDetailCitationCover c = dd.getCitation();
		Assert.assertNotNull(c);
		Assert.assertEquals(""+PMID, c.getPmid());
		String title = c.getTitle();
		Assert.assertEquals(probeTitle, title);
	}
}
