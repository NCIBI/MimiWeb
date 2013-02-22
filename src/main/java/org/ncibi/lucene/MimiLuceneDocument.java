package org.ncibi.lucene;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;

public class MimiLuceneDocument
{
    
    private static void setDocField(Document doc, String field, String value)
    {
        doc.add(new Field(field, value, Field.Store.YES, Field.Index.ANALYZED)) ;
    }
    
    public static void setCellularComponent(Document doc, String cc)
    {
        setDocField(doc, MimiLuceneFields.FIELD_CELLULAR_COMPONENT, cc) ;
    }
    
    public static String getCellularComponent(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_CELLULAR_COMPONENT) ;
    }
    
    public static void setBiologicalProcess(Document doc, String bp)
    {
        setDocField(doc, MimiLuceneFields.FIELD_BIOLOGICAL_PROCESS, bp) ;
    }
    
    public static String getBiologicalProcess(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_BIOLOGICAL_PROCESS) ;
    }
    
    public static void setMolecularFunction(Document doc, String mf)
    {
        setDocField(doc, MimiLuceneFields.FIELD_MOLECULAR_FUNCTION, mf) ;
    }
    
    public static String getMolecularFunction(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_MOLECULAR_FUNCTION) ;
    }
    
    public static void setMoleculeDescription(Document doc, String md)
    {
        setDocField(doc, MimiLuceneFields.FIELD_MOLECULE_DESCRIPTION, md) ;
    }
    
    public static String getMoleculeDescription(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_MOLECULE_DESCRIPTION) ;
    }
    
    public static void setMoleculeNames(Document doc, String mnames)
    {
        setDocField(doc, MimiLuceneFields.FIELD_MOLECULE_NAME, mnames) ;
    }
    
    public static String getMoleculeNames(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_MOLECULE_NAME) ;
    }
    
    public static void setExternalRefs(Document doc, String extrefs)
    {
        setDocField(doc,MimiLuceneFields.FIELD_EXTERNALREF, extrefs) ;
    }
    
    public static String getExternalRefs(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_EXTERNALREF) ;
    }
    
    public static void setTaxId(Document doc, int taxid)
    {
        setDocField(doc, MimiLuceneFields.FIELD_TAXID, Integer.toString(taxid)) ;
    }
    
    public static int getTaxId(Document doc)
    {
        return Integer.parseInt(doc.get(MimiLuceneFields.FIELD_TAXID)) ;
    }
    
    public static void setGeneDescriptions(Document doc, String gd)
    {
        setDocField(doc, MimiLuceneFields.FIELD_GENE_DESCRIPTION, gd) ;
    }
    
    public static String getGeneDescriptions(Document doc) 
    {
        return doc.get(MimiLuceneFields.FIELD_GENE_DESCRIPTION) ;
    }
    
    public static void setTaxNames(Document doc, String tn)
    {
        setDocField(doc, MimiLuceneFields.FIELD_TAX_NAME, tn) ;
    }
    
    public static String getTaxNames(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_TAX_NAME) ;
    }
    
    public static void setPubCount(Document doc, int c)
    {
        setDocField(doc, MimiLuceneFields.FIELD_PUBCOUNT, Integer.toString(c)) ;
    }
    
    public static int getPubCount(Document doc)
    {
        return Integer.parseInt(doc.get(MimiLuceneFields.FIELD_PUBCOUNT)) ;
    }
    
    public static void setInteractionCount(Document doc, int c)
    {
        setDocField(doc, MimiLuceneFields.FIELD_INTERACTION_COUNT, Integer.toString(c)) ;
    }
    
    public static int getInteractionCount(Document doc)
    {
        return Integer.parseInt(doc.get(MimiLuceneFields.FIELD_INTERACTION_COUNT)) ;
    }
    
    public static void setGeneId(Document doc, int geneid)
    {
        setDocField(doc, MimiLuceneFields.FIELD_GENEID, Integer.toString(geneid)) ;
    }
    
    public static int getGeneId(Document doc)
    {
        return Integer.parseInt(doc.get(MimiLuceneFields.FIELD_GENEID)) ;
    }
    
    public static void setGeneSymbol(Document doc, String gs)
    {
        setDocField(doc, MimiLuceneFields.FIELD_GENESYMBOL, gs) ;
    }
    
    public static String getGeneSymbol(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_GENESYMBOL) ;
    }
    
    public static void setGeneType(Document doc, String gt)
    {
        setDocField(doc, MimiLuceneFields.FIELD_GENETYPE, gt) ;
    }
    
    public static String getGeneType(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_GENETYPE) ;
    }
    
    public static void setSciTaxName(Document doc, String staxname)
    {
        setDocField(doc, MimiLuceneFields.FIELD_SCITAXNAME, staxname) ;
    }
    
    public static String getSciTaxName(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_SCITAXNAME) ;
    }
    
    public static void setInteractionIds(Document doc, String iids)
    {
        setDocField(doc, MimiLuceneFields.FIELD_INTERACTION_IDS, iids) ;
    }
    
    public static String getInteractionIds(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_INTERACTION_IDS) ;
    }
    
    public static void setInteractionGeneIds(Document doc, String igeneids)
    {
        setDocField(doc, MimiLuceneFields.FIELD_INTERACTION_GENE_IDS, igeneids) ;
    }
    
    public static String getInteractionGeneIds(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_INTERACTION_GENE_IDS) ;
    }
    
    public static void setInteractionGeneSymbols(Document doc, String gsymbols)
    {
        setDocField(doc, MimiLuceneFields.FIELD_INTERACTION_GENE_SYMBOLS, gsymbols) ;
    }
    
    public static String getInteractionGeneSymbols(Document doc)
    {
        return doc.get(MimiLuceneFields.FIELD_INTERACTION_GENE_SYMBOLS) ;
    }
    public static void setPathwayCount(Document doc, int count)
    {
    	setDocField(doc, MimiLuceneFields.FIELD_PATHWAY_COUNT, Integer.toString(count)) ;
    }
    
    public static int getPathwayCount(Document doc)
    {
    	return Integer.parseInt(doc.get(MimiLuceneFields.FIELD_PATHWAY_COUNT)) ;
    }
}
