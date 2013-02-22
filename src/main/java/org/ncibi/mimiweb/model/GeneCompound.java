package org.ncibi.mimiweb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.ncibi.util.PropertyUtil;

@Entity(name = "mimi.GeneCompound")
@Table(name = "GeneCompound")
public class GeneCompound
{

	private GeneCompoundPk id;
	private String compoundName;
	private String formula;
	private String molecularWeight;
	private String casnum;
	private String smile;

	@Id
	public GeneCompoundPk getId()
	{
		return id;
	}

	public void setId(GeneCompoundPk id)
	{
		this.id = id;
	}

	@Transient
	public int getGeneid()
	{
		return id.getGeneid();
	}

	@Transient
	public String getCid()
	{
		return id.getCid();
	}

	@Column(name = "compoundName")
	public String getCompoundName()
	{
		return compoundName;
	}

	public void setCompoundName(String compoundName)
	{
		this.compoundName = compoundName;
	}

	@Column(name = "formula")
	public String getFormula()
	{
		return formula;
	}

	public void setFormula(String formula)
	{
		this.formula = formula;
	}

	@Column(name = "molecularWeight")
	public String getMolecularWeight()
	{
		return molecularWeight;
	}

	public void setMolecularWeight(String molecularWeight)
	{
		this.molecularWeight = molecularWeight;
	}

	@Column(name = "casnum")
	public String getCasnum()
	{
		return casnum;
	}

	public void setCasnum(String casnum)
	{
		this.casnum = casnum;
	}

	@Column(name = "smile")
	public String getSmile()
	{
		return smile;
	}

	public void setSmile(String smile)
	{
		this.smile = smile;
	}

	@Override
	public String toString()
	{
		return "[ \"" + PropertyUtil.cleanNullValues(getCid()) + "\", \"" + PropertyUtil.cleanNullValues(getCompoundName()) + "\", \""
				+ PropertyUtil.cleanNullValues(getFormula()) + "\", \"" + PropertyUtil.cleanNullValues(getMolecularWeight()) + "\", \""
				+ PropertyUtil.cleanNullValues(getCasnum()) + "\",   \"" + PropertyUtil.cleanNullValues(getSmile()) + "\"]";
	}
}
