package org.ncibi.lucene;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.util.Version;

public class LuceneUtils
{  
    public static Query addTaxidToQuery(Query originalQuery, int taxid)
    {
        if (taxid == -1)
        {
            return originalQuery ;
        }
        
        BooleanQuery queryWithTaxid = new BooleanQuery() ;
        queryWithTaxid.add(originalQuery, Occur.MUST) ;
        Term taxidTerm = new Term("taxid", Integer.toString(taxid)) ;
        queryWithTaxid.add(new TermQuery(taxidTerm), Occur.MUST) ;
        
        return queryWithTaxid ;
    }
    
    public static Query string2LuceneQuery(String queryString, QueryParser queryParser)
    {
        try
        {
            return queryParser.parse(queryString) ;
        }
        catch (ParseException e)
        {
            e.printStackTrace() ;
            return null ;
        }
    }
    
    public static Query string2LuceneQueryUsingDefaultField(String queryString, String defaultField, Analyzer analyzer)
    {
        try
        {
            QueryParser parser = new QueryParser(Version.LUCENE_34, defaultField, analyzer);
            return parser.parse(queryString);
        }
        catch (ParseException e)
        {
            e.printStackTrace();
            return null ;
        }
    }

}
