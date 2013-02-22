package org.ncibi.mimiweb.page;

import org.ncibi.db.mimi2.GeneGeneInteraction;
import org.ncibi.db.mimi2.GeneGeneInteractionAttribute;
import org.ncibi.util.PropertyUtil;

public class InteractionRecord {
	
	private GeneGeneInteraction interaction;
	
	public InteractionRecord(GeneGeneInteraction interaction) {
		this.interaction = interaction;
	}
	
	public String toString() {
		String provenance = "";
		String litLink = "0";
		String interactionType = "";
		String experiments = "";
		int litCount = 0;
		for(GeneGeneInteractionAttribute attr: interaction.getAttributes()) {
			if(attr.getAttrType().equals("Provenance")) {
				if(!provenance.equals("")) provenance += ", ";
				provenance += attr.getAttrValue();
			}
			else if(attr.getAttrType().equals("PubMed")) {
				litCount++;
			}
			else if(attr.getAttrType().equals("InteractionType")) {
				if(!interactionType.equals("")) interactionType += ", ";
				String[] terms = attr.getAttrValue().replace("\"", "\\\"").split("\\[");
				if(terms.length > 1) {
					terms[1] = terms[1].replace(']',' ').trim();
					interactionType += 
						"<a href=http://www.ebi.ac.uk/ontology-lookup/?termId=" + terms[1] + ">" +terms[0] + "</a>";
				}
				else interactionType += terms[0];
			}
			else if(attr.getAttrType().equals("Experiment")) {
				if(!experiments.equals("")) experiments += ", ";
				String[] terms = attr.getAttrValue().replace("\"", "\\\"").split("\\[");
				if(terms.length > 1) {
					terms[1] = terms[1].replace(']',' ').trim();
					experiments += 
						"<a href=http://www.ebi.ac.uk/ontology-lookup/?termId=" + terms[1] + ">" +terms[0] + "</a>";
				}
				else experiments += terms[0];
			}
		}
		if(litCount > 0) {
			litLink = "<a href=documents?interactionid=" + 
				interaction.getGgIntID() + ">"+ litCount + "</a>";
		}
		String pathwayLink = "<a href=pathways?interactionid=" + 
			interaction.getGgIntID() + ">View</a>";
		return "[ \"" + PropertyUtil.cleanNullValues(interaction.getGeneid1()) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(interaction.getSymbol1()) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(interaction.getGeneid2()) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(interaction.getSymbol2()) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(provenance) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(litLink) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(interactionType) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(experiments) + "\", " +
				"  \"" + PropertyUtil.cleanNullValues(pathwayLink) + "\"]";
	}
}
