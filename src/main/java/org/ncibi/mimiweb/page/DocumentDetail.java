package org.ncibi.mimiweb.page;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.ncibi.db.EntityManagers;
import org.ncibi.db.PersistenceSession;
import org.ncibi.db.PersistenceUnit;
import org.ncibi.mimiweb.model.Citation;
import org.ncibi.mimiweb.model.DocumentDetailSentence;
import org.ncibi.mimiweb.model.NamedEntityTag;

public class DocumentDetail {
	
	
	private static final String SENTENCE_SQL = 
		"select s.sentenceID as id, c.PMID as pmid, sc.sectionNum as sectionNumber, \n"
		+ "p.paragraphNum as paragraphNumber, s.sentenceNum as sentenceNumber, \n"
		+ "sentence \n"
		+ "from Citation c \n"
		+ "  join Section sc on c.documentID = sc.documentID \n"
		+ "    join Paragraph p on sc.sectionID = p.sectionID \n"
		+ "      join Sentence s on p.paragraphID = s.paragraphID \n"
		+ "where c.PMID = ? \n"
		+ "order by sc.sectionNum, p.paragraphNum, s.sentenceNum";
	
	private static final String TAGGED_ENTITY_QUERY = 
		"select t.*, t2g.* \n"
		+ "from Citation c \n"
		+ "  join Section sc on c.documentID = sc.documentID \n"
		+ "    join Paragraph p on sc.sectionID = p.sectionID \n"
		+ "      join Sentence s on p.paragraphID = s.paragraphID \n"
		+ "        join NamedEntityTag t on s.sentenceID = t.sentenceID \n"
		+ "			 join Tag2Gene t2g on t.tagID = t2g.tagID \n"
		+ "where c.PMID = ? \n"
		+ "order by t.sentenceID, t.firstChar";
	
	private static final String MERGED_GENE_QUERY = "select geneID from Gene2Pubmed "
		+ "where PMID =";
	
	private static final String CITATION_HSQL_QUERY = 
		"from pubmed.Citation where pmid=";
	
	
	private static final String NO_TEXT = "<i>(No abstract text)</i>";
	private static final String ANNOTATION_OPEN_TAG = "<span class=\"doc-detail-text-highlight\">";
	private static final String ANNOTATION_CLOSE_TAG = "</span>";
	
	private static final PersistenceSession persistence = new PersistenceUnit(EntityManagers.newEntityManagerFromProject("pubmed"));
	
	private String annotatedText;
	private List<Integer> mergedGenes;
	private Map<Integer, String> taggedGeneMap;
	private DocumentDetailCitationCover citation;

	public DocumentDetail(int pmid) {
		List<DocumentDetailSentence> sentenceList = buildSentenceList(pmid);
		List<NamedEntityTag> entityList = buildEntityList(pmid);
		citation = fetchCitation(pmid);
		mergedGenes = fetchMergedGenes(pmid);
		annotatedText = buildAnnotatedText(sentenceList, entityList);
		taggedGeneMap = buildTaggedGeneMap(entityList);
	}
	
	public String getAnnotatedText() {
		return annotatedText;
	}

	public Map<Integer, String> getTaggedGeneMap() {
		return taggedGeneMap;
	}
	
	public List<Integer> getMergedGenes() {
		return mergedGenes;
	}

	public DocumentDetailCitationCover getCitation() {
		return citation;
	}
	
	private List<DocumentDetailSentence> buildSentenceList(int pmid){
		String sql = SENTENCE_SQL.replace("?", "" + pmid);
		// System.out.println(sql);
		List<DocumentDetailSentence> ret = persistence.sqlQuery(persistence.session(), sql).bind(DocumentDetailSentence.class).list();
		return ret;
	}
	
	private List<NamedEntityTag> buildEntityList(int pmid) {
		String sql = TAGGED_ENTITY_QUERY.replace("?", "" + pmid);
		// System.out.println(sql);
		List<NamedEntityTag> ret = persistence.sqlQuery(persistence.session(), sql).bind(NamedEntityTag.class).list();
		return ret;
	}
	
	private DocumentDetailCitationCover fetchCitation(int pmid) {
		Citation c = persistence.hqlQuery(CITATION_HSQL_QUERY + pmid).single();
		return new DocumentDetailCitationCover(c);
	}
	
	private List<Integer> fetchMergedGenes(int pmid) {
		List<Integer> ret = persistence.sqlQuery(MERGED_GENE_QUERY + pmid).list();
		return ret;
	}

	private String mergeWithEntityList(List<DocumentDetailSentence> sentenceList,List<NamedEntityTag> entityList) {
		String ret = "<p>\n";
		int lastParagraph = sentenceList.get(0).getParagraphNumber();
		Iterator<DocumentDetailSentence> i = sentenceList.iterator();
		DocumentDetailSentence sentence = i.next();
		int inputPos = 0;
		entityList = removeDuplicatesByPosition(entityList);
		for (NamedEntityTag t: entityList) {
			// skip tags inside other tags
			if(inputPos > t.getFirstChar()) continue;
			if (sentence != null) {
				while (t.getSentenceId() != sentence.getId()) {
					if (inputPos < sentence.getSentence().length())
						ret += sentence.getSentence().substring(inputPos);
					if (i.hasNext())
						sentence = i.next();
					else
						sentence = null;
					ret += "\n";
					inputPos = 0;
				}
			}
			if (sentence != null) {
				if (lastParagraph != sentence.getParagraphNumber()) {
					ret += "</p>\n<p>";
					lastParagraph = sentence.getParagraphNumber();
				}
				ret += sentence.getSentence().substring(inputPos, t.getFirstChar()) + "\n"
					+ ANNOTATION_OPEN_TAG +  sentence.getSentence().substring(t.getFirstChar(),t.getLastChar()+1) 
					+ ANNOTATION_CLOSE_TAG;
				inputPos = t.getLastChar()+1;
			}
		}
		if (sentence != null) {
			if (inputPos < sentence.getSentence().length())
				ret += sentence.getSentence().substring(inputPos);
			ret += "\n";
		}
		while (i.hasNext()) {
			sentence = i.next();
			if (lastParagraph != sentence.getParagraphNumber()) {
				ret += "</p>\n<p>";
				lastParagraph = sentence.getParagraphNumber();
			}
			ret += sentence.getSentence() + "\n";
		}
		return ret + "</p>\n";
	}

	private String concatenateSentences(List<DocumentDetailSentence> sentenceList) {
		String ret = "<p>\n";
		int lastParagraph = sentenceList.get(0).getParagraphNumber();
		for (DocumentDetailSentence s: sentenceList) {
			if (lastParagraph != s.getParagraphNumber()) {
				ret += "</p>\n<p>";
				lastParagraph = s.getParagraphNumber();
			}
			ret += s.getSentence() + "\n";
		}
		return ret + "</p>\n";
	}

	private List<NamedEntityTag> removeDuplicatesByPosition(List<NamedEntityTag> entityList) {
		List<NamedEntityTag> ret = new ArrayList<NamedEntityTag>();
		int lastSentence = -1;
		int lastPos = -1;
		for (NamedEntityTag t: entityList){
			if (t.getSentenceId() != lastSentence) {
				lastSentence = t.getSentenceId();
				lastPos = -1;
			}
			if (t.getFirstChar() != lastPos) {
				ret.add(t);
				lastPos = t.getFirstChar();
			}
		}
		return ret;
	}
	
	private String buildAnnotatedText(List<DocumentDetailSentence> sentenceList,List<NamedEntityTag> entityList) {
		if (sentenceList.isEmpty()) {
			return NO_TEXT;
		}
		if (entityList.isEmpty()) {
			return concatenateSentences(sentenceList);
		}
		return mergeWithEntityList(sentenceList, entityList);
	}
	
	private Map<Integer,String> buildTaggedGeneMap(List<NamedEntityTag> entityList) {
		Map<Integer, String> taggedGeneMap = new HashMap<Integer, String>();
		for(NamedEntityTag entity: entityList) {
			taggedGeneMap.put(entity.getGeneID(), entity.getActualString());
		}
		return taggedGeneMap;
	}
}
