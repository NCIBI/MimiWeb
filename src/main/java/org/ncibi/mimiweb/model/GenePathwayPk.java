package org.ncibi.mimiweb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class GenePathwayPk implements Serializable
{

	private int geneid;
	private String name;
	private String pid;
	private String source;
	private static final long serialVersionUID = 1L;

	@Column(name = "geneid")
	public int getGeneid()
	{
		return geneid;
	}

	public void setGeneid(int geneid)
	{
		this.geneid = geneid;
	}
	
	@Column(name = "pid")
	public String getPid()
	{
		return pid;
	}

	public void setPid(String pid)
	{
		this.pid = pid;
	}

	@Column(name = "name")
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	@Column(name = "source")
	public String getSource()
	{
		return source;
	}

	public void setSource(String source)
	{
		this.source = source;
	}
}
