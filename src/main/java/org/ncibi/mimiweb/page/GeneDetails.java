package org.ncibi.mimiweb.page;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ncibi.commons.io.FileUtilities;
import org.ncibi.db.EntityManagers;
import org.ncibi.db.PersistenceSession;
import org.ncibi.db.PersistenceUnit;
import org.ncibi.db.metdb.ReactionEquationDenorm;
import org.ncibi.db.mimi2.GeneGeneInteraction;
import org.ncibi.hibernate.ColumnAnnotatedResultTransformer;
import org.ncibi.mimiweb.model.Citation;
import org.ncibi.mimiweb.model.ClassifiedInteraction;
import org.ncibi.mimiweb.model.ClassifiedInteractionAndType;
import org.ncibi.mimiweb.model.GeneCompound;
import org.ncibi.mimiweb.model.GeneEnzyme;
import org.ncibi.mimiweb.model.GeneInfo;
import org.ncibi.mimiweb.model.GenePathway;
import org.ncibi.mimiweb.model.GeneSynonym;
import org.ncibi.mimiweb.model.ReactomePathway;
import org.ncibi.util.PropertyUtil;

import com.google.common.base.Charsets;
import com.google.common.io.Files;

public class GeneDetails {
	private int geneId;
	private GeneInfo geneInfo;
	private GeneInfo geneInfoFullname;
	private List<String> otherDescriptions;
	private List<String> processes;
	private List<String> components;
	private List<String> functions;
	private List<GeneCompound> geneCompounds;
	private List<GeneEnzyme> geneEnzymes;
	private List<Object> pathways;
	private List<InteractionRecord> proteinInteractions;
	private List<ClassifiedInteraction> nlpInteractions;
	private List<String> reactions;
	private List<Citation> citations;
	private String geneSynonymsString = "";

	public GeneDetails(int geneId) {
		this.geneId = geneId;
		query();
	}

	private void query() {
		PersistenceSession persistence = new PersistenceUnit(
				EntityManagers.newEntityManagerFromProject("mimi"));
		setProcesses(queryProcesses(persistence));
		setComponents(queryComponents(persistence));
		setFunctions(queryFunctions(persistence));
		setOtherDescriptions(queryOtherDescriptions(persistence));
		setGeneInfo(queryGeneInfo(persistence));
		setGeneSynonymsString(formatGeneSynonyms(queryGeneSynonyms(persistence)));
		setGeneInfoFullname(queryGeneInfoFullname(persistence));
		setGeneCompounds(queryGeneCompounds(persistence));
		setGeneEnzymes(queryGeneEnzymes(persistence));
		setPathways(queryPathways(persistence));
		setProteinInteractions(queryProteinInteractions(persistence));
		setNlpInteractions(queryNlpInteractions());
		setReactions(queryReactions());
		setCitations(queryCitations());
	}

	private List<String> queryProcesses(PersistenceSession persistence) {
		String sql = "select distinct attrValue from denorm.GeneAttribute where geneid="
				+ geneId + " and attrType = 'process'";
		return persistence.sqlQuery(persistence.session(), sql).list();
	}

	private List<String> queryComponents(PersistenceSession persistence) {
		String sql2 = "select distinct attrValue from denorm.GeneAttribute where geneid="
				+ geneId + " and attrType = 'Component'";
		return persistence.sqlQuery(persistence.session(), sql2).list();
	}

	private List<String> queryFunctions(PersistenceSession persistence) {
		String sql3 = "select distinct attrValue from denorm.GeneAttribute where geneid="
				+ geneId + " and attrType = 'Function'";
		return persistence.sqlQuery(persistence.session(), sql3).list();
	}

	private List<String> queryOtherDescriptions(PersistenceSession persistence) {
		String sql4 = "select distinct geneName from dbo.GeneInfo where geneid="
				+ geneId + " and geneType = 'OtherName'";
		return persistence.sqlQuery(persistence.session(), sql4).list();
	}

	private GeneInfo queryGeneInfo(PersistenceSession persistence) {
		String hql = "from mimi.GeneInfo where geneid=" + geneId;
		return persistence.hqlQuery(persistence.session(), hql).single();
	}

	private List<GeneSynonym> queryGeneSynonyms(PersistenceSession persistence) {
		String hql2 = "from mimi.GeneSynonym where geneid=" + geneId;
		return persistence.hqlQuery(persistence.session(), hql2).list();
	}

	private String formatGeneSynonyms(List<GeneSynonym> synonyms) {
		String geneSynonyms = "";
		for (GeneSynonym g : synonyms) {
			geneSynonyms += ", " + g.getName();
		}
		return geneSynonyms.replaceFirst(", ", "");
	}

	private List<Object> queryPathways(PersistenceSession persistence) {
		List<Object> ret = new ArrayList<Object>();
		String hql3 = "from mimi.GenePathway where geneid=" + geneId;
		List<GenePathway> ehmnPathways = persistence.hqlQuery(
				persistence.session(), hql3).list();
		ret.addAll(ehmnPathways);
		String reactomeSql = "select id, name as description, stableidentifier as pathname "
				+ " from reactome.pcount.geneid_pathway where geneid = "
				+ geneId;
		PersistenceSession reactome = new PersistenceUnit(
				EntityManagers.newEntityManagerFromProject("reactome"));
		List<ReactomePathway> reactomePathways = persistence
				.sqlQuery(reactome.session(), reactomeSql)
				.to(new ColumnAnnotatedResultTransformer(ReactomePathway.class))
				.list();
		ret.addAll(reactomePathways);
		return ret;
	}

	private GeneInfo queryGeneInfoFullname(PersistenceSession persistence) {
		String hql4 = "from mimi.GeneInfo where geneid=" + geneId
				+ " and geneType = 'Fullname' ";
		return persistence.hqlQuery(persistence.session(), hql4).single();
	}

	private List<GeneCompound> queryGeneCompounds(PersistenceSession persistence) {
		String hql5 = "from mimi.GeneCompound where geneid=" + geneId;
		return persistence.hqlQuery(persistence.session(), hql5).list();
	}

	private List<InteractionRecord> queryProteinInteractions(
			PersistenceSession persistence) {
		String hql7 = "from mimi.GeneGeneInteraction where geneid1=" + geneId;
		List<GeneGeneInteraction> interactions = persistence.hqlQuery(
				persistence.session(), hql7).list();
		List<InteractionRecord> records = new ArrayList<InteractionRecord>();
		for (GeneGeneInteraction interaction : interactions) {
			if (sameSpecies(interaction.getTaxid1(), interaction.getTaxid2())) {
				records.add(new InteractionRecord(interaction));
			}
		}
		return records;
	}

	private boolean sameSpecies(int taxid1, int taxid2) {
		return taxid1 == taxid2;
	}

	/**
	 * Retrieve the GIN NLP derived interactions for a given geneid.
	 * 
	 * @param geneid
	 *            The geneid to retrieve NLP derived interactions for.
	 * @return A list of classified interactions from GIN.
	 */
	public List<ClassifiedInteraction> queryNlpInteractions() {
		final String sql11 = " select distinct T.* from "
				+ " ( "
				+ " select ci.interactionID, ci.geneID1, ci.tag1, "
				+ "  ci.geneID2, ci.tag2, ci.sentenceID, ci.typeID, cit.type, "
				+ "  ci.fact, ci.provenanceID, s.sentence, d.PMID, "
				+ "  g.symbol as symbol1, g2.symbol as symbol2 "
				+ " from gin.ClassifiedInteraction ci "
				+ "   left join gin.ClassifiedInteractionType cit on ci.typeID=cit.typeID "
				+ "   join Sentence s on s.sentenceID = ci.sentenceID "
				+ "   join Paragraph p on s.paragraphID = p.paragraphID "
				+ "   join Section section on p.sectionID = section.sectionID "
				+ "   join Document d on section.documentID = d.documentID "
				+ "   join geneR2.dbo.Gene g on ci.geneID1 = g.geneid "
				+ "   join geneR2.dbo.Gene g2 on ci.geneID2 = g.geneid "
				+ " where geneID1 = "
				+ geneId
				+ " and g.taxid = g2.taxid union "
				+ " select ci.interactionID, ci.geneID2 as geneID1, ci.tag2 as tag1, "
				+ "  ci.geneID1 as geneID2, ci.tag1 as tag2, ci.sentenceID, ci.typeID, cit.type, "
				+ "  ci.fact, ci.provenanceID, s.sentence, d.PMID, "
				+ "  g2.symbol as symbol1, g.symbol as symbol2 "
				+ " from gin.ClassifiedInteraction ci "
				+ "   left join gin.ClassifiedInteractionType cit on ci.typeID=cit.typeID "
				+ "   join Sentence s on s.sentenceID = ci.sentenceID "
				+ "   join Paragraph p on s.paragraphID = p.paragraphID "
				+ "   join Section section on p.sectionID = section.sectionID "
				+ "   join Document d on section.documentID = d.documentID "
				+ "   join geneR2.dbo.Gene g on ci.geneID1 = g.geneid "
				+ "   join geneR2.dbo.Gene g2 on ci.geneID2 = g2.geneid "
				+ " where ci.geneID2 = " + geneId
				+ " and g.taxid = g2.taxid ) T ";

		String sql12 = "select * from pubmed.gin.ClassifiedInteractionAndType ci where ci.geneID1 = "
				+ geneId;

		PersistenceSession pubmed = new PersistenceUnit(
				EntityManagers.newEntityManagerFromProject("pubmed"));
		final List<ClassifiedInteraction> ciList = pubmed
				.sqlQuery(pubmed.session(), sql11)
				.to(new ColumnAnnotatedResultTransformer(
						ClassifiedInteraction.class)).list();
		final Map<String, ClassifiedInteraction> uniqueCi = new HashMap<String, ClassifiedInteraction>();
		for (final ClassifiedInteraction ci : ciList) {
			final String key = ci.getGeneID2() + " _" + ci.getSentenceID()
					+ "_" + ci.getPmid();
			uniqueCi.put(key, ci);
		}

		List<ClassifiedInteractionAndType> interactionTypes = pubmed
				.sqlQuery(pubmed.session(), sql12)
				.to(new ColumnAnnotatedResultTransformer(
						ClassifiedInteractionAndType.class)).list();

		if (interactionTypes != null) {
			for (final ClassifiedInteractionAndType ciType : interactionTypes) {
				final String key = ciType.getGeneID2() + " _"
						+ ciType.getSentenceID() + "_" + ciType.getPmid();
				ClassifiedInteraction ci = uniqueCi.get(key);
				if (ci != null) {
					if (ci.getType() == null || "".equals(ci.getType())) {
						ci.setType(ciType.getType());
					} else {
						String existingTypes = ci.getType();
						String typeToAdd = ciType.getType();
						if (!existingTypes.contains(typeToAdd)) {
							ci.setType(existingTypes + "," + ciType.getType());
						}
					}
				}
			}
		}

		return new ArrayList<ClassifiedInteraction>(uniqueCi.values());
	}

	private List<GeneEnzyme> queryGeneEnzymes(PersistenceSession persistence) {
		String hql8 = "from mimi.GeneEnzyme where geneid=" + geneId;
		return persistence.hqlQuery(persistence.session(), hql8).list();
	}

	private List<String> queryReactions() {
		PersistenceSession persistence = new PersistenceUnit(
				EntityManagers.newEntityManagerFromProject("metdb"));
		String sql10 = "select rd.* from humdb.metdb.Gene2Enzyme g2e"
				+ " join humdb.metdb.Reaction2Enzyme r2e on r2e.enzymeid=g2e.enzymeid"
				+ " join humdb.metdb.Reaction r on r.id = r2e.reactionid"
				+ " join humdb.metdb.ReactionEquationDenorm rd on rd.rid = r.rid"
				+ " where g2e.geneid = " + geneId;

		List<ReactionEquationDenorm> reactions = persistence
				.sqlQuery(persistence.session(), sql10)
				.bind(ReactionEquationDenorm.class).list();
		List<String> ret = new ArrayList<String>();
		for (ReactionEquationDenorm r : reactions) {
			ret.add("[ \"" + PropertyUtil.cleanNullValues(r.getRid())
					+ "\", \"" + PropertyUtil.cleanNullValues(r.isReversible())
					+ "\", \"" + PropertyUtil.cleanNullValues(r.getEquation())
					+ "\"]");
		}
		return ret;
	}

	private List<Citation> queryCitations() {
		PersistenceSession persistence = new PersistenceUnit(
				EntityManagers.newEntityManagerFromProject("pubmed"));
		String sql11 = "select c.* from pubmed.dbo.Gene2Pubmed as g2p "
				+ "join pubmed.dbo.Citation as c on g2p.PMID=c.PMID "
				+ "where g2p.geneID=" + geneId + " order by c.date desc";
		return persistence.sqlQuery(persistence.session(), sql11)
				.bind(Citation.class).list();
	}

	private List<List<String>> parseTextList(List<String> list) {
		List<List<String>> parsedList = new ArrayList<List<String>>();
		for (String p : list) {
			List<String> pl = new ArrayList<String>();
			String[] n = p.split("\\[");
			pl.add(n[0].trim());
			pl.add(n[1].replaceAll("\\]", "").trim());
			parsedList.add(pl);
		}
		return parsedList;
	}

	public List<GeneCompound> getGeneCompounds() {
		return geneCompounds;
	}

	public void setGeneCompounds(List<GeneCompound> geneCompounds) {
		this.geneCompounds = geneCompounds;
	}

	public GeneInfo getGeneInfoFullname() {
		return geneInfoFullname;
	}

	public void setGeneInfoFullname(GeneInfo geneInfoFullname) {
		this.geneInfoFullname = geneInfoFullname;
	}

	public int getGeneId() {
		return geneId;
	}

	public void setGeneId(int geneId) {
		this.geneId = geneId;
	}

	public GeneInfo getGeneInfo() {
		return geneInfo;
	}

	public void setGeneInfo(GeneInfo geneInfo) {
		this.geneInfo = geneInfo;
	}

	public List<List<String>> getProcesses() {
		return parseTextList(processes);
	}

	public void setProcesses(List<String> processes) {
		this.processes = processes;
	}

	public List<List<String>> getComponents() {
		return parseTextList(components);
	}

	public void setComponents(List<String> components) {
		this.components = components;
	}

	public List<List<String>> getFunctions() {
		return parseTextList(functions);
	}

	public void setFunctions(List<String> functions) {
		this.functions = functions;
	}

	public String getGeneSynonymsString() {
		return geneSynonymsString;
	}

	public void setGeneSynonymsString(String geneSynonymsString) {
		this.geneSynonymsString = geneSynonymsString;
	}

	public List<String> getOtherDescriptions() {
		return otherDescriptions;
	}

	public void setOtherDescriptions(List<String> otherDescriptions) {
		this.otherDescriptions = otherDescriptions;
	}

	public List<Object> getPathways() {
		return pathways;
	}

	public void setPathways(List<Object> pathways) {
		this.pathways = pathways;
	}

	public List<InteractionRecord> getProteinInteractions() {
		return proteinInteractions;
	}

	public void setProteinInteractions(
			List<InteractionRecord> proteinInteractions) {
		this.proteinInteractions = proteinInteractions;
	}

	public List<ClassifiedInteraction> getNlpInteractions() {
		return nlpInteractions;
	}

	public void setNlpInteractions(List<ClassifiedInteraction> nlpInteractions) {
		this.nlpInteractions = nlpInteractions;
	}

	public List<GeneEnzyme> getGeneEnzymes() {
		return geneEnzymes;
	}

	public void setGeneEnzymes(List<GeneEnzyme> geneEnzymes) {
		this.geneEnzymes = geneEnzymes;
	}

	public List<String> getReactions() {
		return reactions;
	}

	public void setReactions(List<String> reactions) {
		this.reactions = reactions;
	}

	public List<Citation> getCitations() {
		return citations;
	}

	public void setCitations(List<Citation> citations) {
		this.citations = citations;
	}

}
