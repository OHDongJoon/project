package com.lec.dto;

import java.sql.Date;

public class NoticeDto {
	private int nid;
	private String aid;
	private String atitle;
	private String acontent;
	private Date   ardate;
	private String aip;
	private String aname;
	public NoticeDto() {}
	public NoticeDto(int nid, String aid, String atitle, String acontent, Date ardate, String aip, String aname) {
		super();
		this.nid = nid;
		this.aid = aid;
		this.atitle = atitle;
		this.acontent = acontent;
		this.ardate = ardate;
		this.aip = aip;
		this.aname = aname;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public Date getArdate() {
		return ardate;
	}
	public void setArdate(Date ardate) {
		this.ardate = ardate;
	}
	public String getAip() {
		return aip;
	}
	public void setAip(String aip) {
		this.aip = aip;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	@Override
	public String toString() {
		return "NoticeDto [nid=" + nid + ", aid=" + aid + ", atitle=" + atitle + ", acontent=" + acontent + ", ardate="
				+ ardate + ", aip=" + aip + ", aname=" + aname + "]";
	}
	
}
