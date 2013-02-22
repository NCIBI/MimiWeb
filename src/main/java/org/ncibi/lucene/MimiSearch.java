package org.ncibi.lucene;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;
import org.ncibi.util.PropertyUtil;

public class MimiSearch
{
	
    private String _searchDir;
    private IndexReader _reader;
    private IndexSearcher _searcher;
    private Analyzer _analyzer;
    private int numHits = 0;

    private QueryParser _parserAllExceptInteractions;
    private QueryParser _parserAllQueryFields;
    
    public static final String allQueryFields[] =
    { MimiLuceneFields.FIELD_BIOLOGICAL_PROCESS, MimiLuceneFields.FIELD_CELLULAR_COMPONENT,
            MimiLuceneFields.FIELD_EXTERNALREF, MimiLuceneFields.FIELD_GENE_DESCRIPTION,
            MimiLuceneFields.FIELD_GENEID, MimiLuceneFields.FIELD_GENESYMBOL,
            MimiLuceneFields.FIELD_GENETYPE, MimiLuceneFields.FIELD_INTERACTION_GENE_SYMBOLS,
            MimiLuceneFields.FIELD_MOLECULAR_FUNCTION,
            MimiLuceneFields.FIELD_MOLECULE_DESCRIPTION, MimiLuceneFields.FIELD_MOLECULE_NAME,
            MimiLuceneFields.FIELD_SCITAXNAME, MimiLuceneFields.FIELD_TAX_NAME,
            MimiLuceneFields.FIELD_TAXID };

    public static final String allExceptInteractions[] =
    { MimiLuceneFields.FIELD_BIOLOGICAL_PROCESS, MimiLuceneFields.FIELD_CELLULAR_COMPONENT,
            MimiLuceneFields.FIELD_EXTERNALREF, MimiLuceneFields.FIELD_GENE_DESCRIPTION,
            MimiLuceneFields.FIELD_GENEID, MimiLuceneFields.FIELD_GENESYMBOL,
            MimiLuceneFields.FIELD_GENETYPE, MimiLuceneFields.FIELD_MOLECULAR_FUNCTION,
            MimiLuceneFields.FIELD_MOLECULE_DESCRIPTION, MimiLuceneFields.FIELD_MOLECULE_NAME,
            MimiLuceneFields.FIELD_SCITAXNAME, MimiLuceneFields.FIELD_TAX_NAME,
            MimiLuceneFields.FIELD_TAXID };
    
    public static MimiSearch createMimiSearch() throws IOException {
		String luceneDir = PropertyUtil.getLuceneDirProperty();
		if (luceneDir == null) {
			throw new IOException("Directory Path for Lucene is unavailable (null from properteis file)");
		}
		MimiSearch ms = new MimiSearch(luceneDir);
		return ms;
	}

    private MimiSearch(String dir) throws CorruptIndexException, IOException
    {
        _searchDir = dir;

        _reader = IndexReader.open(new SimpleFSDirectory(new File(_searchDir)));
        _searcher = new IndexSearcher(_reader);
        _analyzer = new StandardAnalyzer(Version.LUCENE_34);
        _parserAllExceptInteractions = new MultiFieldQueryParser(Version.LUCENE_34,allExceptInteractions, _analyzer);
        _parserAllQueryFields = new MultiFieldQueryParser(Version.LUCENE_34,allQueryFields, _analyzer);
    }

    private TopDocs rawSearch(String searchStr, int limit, int taxid, QueryParser parser) throws IOException,
            ParseException
    {
        Query query = parser.parse(searchStr);
        BooleanQuery modifiedQuery = new BooleanQuery();
        modifiedQuery.add(query, Occur.MUST);

        if (taxid != -1)
        {
            Term taxidTerm = new Term("taxid", Integer.toString(taxid));
            modifiedQuery.add(new TermQuery(taxidTerm), Occur.MUST);
        }

        return _searcher.search(modifiedQuery, limit);
    }

    private TopDocs rawSearchUsingQuery(Query query, int limit, int taxid) throws IOException, ParseException
    {
        BooleanQuery queryWithTaxid = new BooleanQuery();
        queryWithTaxid.add(query, Occur.MUST);
        if (taxid != -1)
        {
            Term taxidTerm = new Term("taxid", Integer.toString(taxid));
            queryWithTaxid.add(new TermQuery(taxidTerm), Occur.MUST);
        }

        return _searcher.search(queryWithTaxid, limit);
    }

    private MimiDocument document2MimiDocument(Document doc)
    {
        MimiDocument mdoc = new MimiDocument();

        mdoc.cellularComponents = MimiLuceneDocument.getCellularComponent(doc);
        mdoc.biologicalProcesses = MimiLuceneDocument.getBiologicalProcess(doc);
        mdoc.molecularFunctions = MimiLuceneDocument.getMolecularFunction(doc);
        mdoc.moleculeDescriptions = MimiLuceneDocument.getMoleculeDescription(doc);
        mdoc.moleculeNames = MimiLuceneDocument.getMoleculeNames(doc);
        mdoc.externalRefs = MimiLuceneDocument.getExternalRefs(doc);
        mdoc.taxid = MimiLuceneDocument.getTaxId(doc);
        mdoc.geneDescription = MimiLuceneDocument.getGeneDescriptions(doc);
        mdoc.taxname = MimiLuceneDocument.getTaxNames(doc);
        mdoc.pubCount = MimiLuceneDocument.getPubCount(doc);
        mdoc.interactionCount = MimiLuceneDocument.getInteractionCount(doc);
        mdoc.geneid = MimiLuceneDocument.getGeneId(doc);
        mdoc.geneSymbol = MimiLuceneDocument.getGeneSymbol(doc);
        mdoc.geneType = MimiLuceneDocument.getGeneType(doc);
        mdoc.sciTaxName = MimiLuceneDocument.getSciTaxName(doc);
        mdoc.interactionGeneIds = MimiLuceneDocument.getInteractionGeneIds(doc);
        mdoc.interactionGeneSymbols = MimiLuceneDocument.getInteractionGeneSymbols(doc);
        mdoc.pathwayCount = MimiLuceneDocument.getPathwayCount(doc);

        return mdoc;
    }

    private ArrayList<MimiDocument> search2MimiDocument(String searchStr, int taxid,
            QueryParser parser) throws IOException, ParseException
    {
        TopDocs topDocs = rawSearch(searchStr, 100, taxid, parser);

        numHits = topDocs.totalHits;
        ArrayList<MimiDocument> mlist = new ArrayList<MimiDocument>();
        for (ScoreDoc scoreDoc : topDocs.scoreDocs)
        {
            Document doc = _searcher.doc(scoreDoc.doc);
            mlist.add(document2MimiDocument(doc));
        }

        return mlist;
    }
    
    private final List<MimiDocument> search2MimiDocument(final String searchStr, final int taxid, final int limit, final QueryParser parser)
        throws IOException, ParseException
    {
        final TopDocs topDocs = rawSearch(searchStr, limit, taxid, parser);
        numHits = topDocs.totalHits;
        final List<MimiDocument> mlist = new ArrayList<MimiDocument>(numHits);
        for (ScoreDoc scoreDoc : topDocs.scoreDocs)
        {
            Document doc = _searcher.doc(scoreDoc.doc);
            mlist.add(document2MimiDocument(doc));
        }
        
        return mlist;
    }

    private ArrayList<Document> search2Document(String searchStr, int taxid, QueryParser parser)
            throws IOException, ParseException
    {
        TopDocs topDocs = rawSearch(searchStr, 100, taxid, parser);
        numHits = topDocs.totalHits;
        ArrayList<Document> dlist = new ArrayList<Document>();
        for (ScoreDoc scoreDoc : topDocs.scoreDocs)
        {
            Document doc = _searcher.doc(scoreDoc.doc);
            dlist.add(doc);
        }

        return dlist;
    }

    public ArrayList<Document> searchUsingQuery(Query query, int taxid) throws IOException,
            ParseException
    {
        TopDocs topDocs = rawSearchUsingQuery(query, 100, taxid);
        numHits = topDocs.totalHits;
        ArrayList<Document> dlist = new ArrayList<Document>();
        for (ScoreDoc scoreDoc : topDocs.scoreDocs)
        {
            Document doc = _searcher.doc(scoreDoc.doc);
            dlist.add(doc);
        }

        return dlist;
    }

    public ArrayList<MimiDocument> searchAll2MimiDocument(String searchStr, int taxid)
            throws IOException, ParseException
    {
        return search2MimiDocument(searchStr, taxid, _parserAllQueryFields);
    }

    public ArrayList<MimiDocument> searchAllExceptInteractions2MimiDocument(String searchStr,
            int taxid) throws IOException, ParseException
    {
        return search2MimiDocument(searchStr, taxid, _parserAllExceptInteractions);
    }

    public final List<MimiDocument> SearchAllExceptInteraction2MimiDocument(final String searchStr, final int taxid,
            final int limit) throws IOException, ParseException
    {
        return search2MimiDocument(searchStr, taxid, limit, _parserAllExceptInteractions);
    }

    public ArrayList<Document> searchAll2Document(String searchStr, int taxid) throws IOException,
            ParseException
    {
        return search2Document(searchStr, taxid, _parserAllQueryFields);
    }

    public ArrayList<Document> searchAllExceptInteractions2Document(String searchStr, int taxid)
            throws IOException, ParseException
    {
        return search2Document(searchStr, taxid, _parserAllExceptInteractions);
    }

    public int getNumberOfMatches()
    {
        return numHits;
    }
}
