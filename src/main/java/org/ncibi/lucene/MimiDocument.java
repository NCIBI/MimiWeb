package org.ncibi.lucene;

public class MimiDocument
{
    // fields shared with Hibernate interface
    // (see src/org/ncibi/mimiweb/hibernate/GeneMolecule.java)
    public int geneid;
    public int taxid;
    public String taxname;
    public String sciTaxName;

    public String geneType;
    public String geneSymbol;
    public String geneDescription;

    // Interaction data
    public String interactionIds;
    public String interactionGeneSymbols;
    public String interactionGeneIds;

    // fields that are translated to sets in Hibernate interface
    public String cellularComponents;
    public String biologicalProcesses;
    public String molecularFunctions;
    public String moleculeDescriptions;
    public String moleculeNames;
    public String externalRefs;

    // fields that are summary information particular to the Lucene interface
    public int interactionCount;
    public int pubCount;
    public int pathwayCount ;

    public MimiDocument()
    {
        geneid = 0;
        taxid = 0;
        taxname = "";
        sciTaxName = "";
        geneType = "";
        geneSymbol = "";
        geneDescription = "";
        interactionIds = "";
        interactionGeneSymbols = "";
        interactionGeneIds = "";
        cellularComponents = "";
        biologicalProcesses = "";
        molecularFunctions = "";
        moleculeDescriptions = "";
        moleculeNames = "";
        externalRefs = "";
        interactionCount = 0;
        pubCount = 0;
        pathwayCount = 0 ;
    }
    
    public void print(java.io.BufferedWriter out) throws java.io.IOException
    {
        out.write("=====================") ;
        out.write("  \ngeneid = " + geneid) ;
        out.write("  \ntaxid = " + taxid) ;
        out.write("  \ntaxname = " + taxname) ;
        out.write("  \nsciTaxName = " + sciTaxName) ;
        out.write("  \ngeneType = " + geneType) ;
        out.write("  \ngeneSymbol = " + geneSymbol) ;
        out.write("  \ngeneDescription = " + geneDescription);
        //interactionIds = "";
        out.write("  \ninteractionGeneSymbols = " + interactionGeneSymbols) ;
        out.write("  \ninteractionGeneIds = " + interactionGeneIds) ;
        out.write("  \ncellularComponents = " + cellularComponents) ;
        out.write("  \nbiologicalProcesses = " + biologicalProcesses) ;
        out.write("  \nmolecularFunctions = " + molecularFunctions) ;
        out.write("  \nmoleculeDescriptions = " + moleculeDescriptions) ;
        out.write("  \nmoleculeNames = " + moleculeNames) ;
        out.write("  \nexternalRefs = " + externalRefs) ;
        out.write("  \ninteractionCount = " + interactionCount) ;
        out.write("  \npubCount = " + pubCount) ;
        out.write("\n=====================") ;
    }

    public void print()
    {
        System.out.println("=====================") ;
        System.out.println("  geneid = " + geneid) ;
        System.out.println("  taxid = " + taxid) ;
        System.out.println("  taxname = " + taxname) ;
        System.out.println("  sciTaxName = " + sciTaxName) ;
        System.out.println("  geneType = " + geneType) ;
        System.out.println("  geneSymbol = " + geneSymbol) ;
        System.out.println("  geneDescription = " + geneDescription);
        //interactionIds = "";
        System.out.println("  interactionGeneSymbols = " + interactionGeneSymbols) ;
        System.out.println("  interactionGeneIds = " + interactionGeneIds) ;
        System.out.println("  cellularComponents = " + cellularComponents) ;
        System.out.println("  biologicalProcesses = " + biologicalProcesses) ;
        System.out.println("  molecularFunctions = " + molecularFunctions) ;
        System.out.println("  moleculeDescriptions = " + moleculeDescriptions) ;
        System.out.println("  moleculeNames = " + moleculeNames) ;
        System.out.println("  externalRefs = " + externalRefs) ;
        System.out.println("  interactionCount = " + interactionCount) ;
        System.out.println("  pubCount = " + pubCount) ;
        System.out.println("=====================") ;
    }
}
