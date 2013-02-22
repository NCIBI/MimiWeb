package org.ncibi.mimiweb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class GeneCompoundPk implements Serializable
{
	private static final long serialVersionUID = 1L;

	private String cid;
	private int geneid;

	@Column(name = "cid")
	public String getCid()
	{
		return cid;
	}

	public void setCid(String cid)
	{
		this.cid = cid;
	}

	@Column(name = "geneid")
	public int getGeneid()
	{
		return geneid;
	}

	public void setGeneid(int geneid)
	{
		this.geneid = geneid;
	}
}
