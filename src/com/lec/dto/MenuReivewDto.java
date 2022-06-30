package com.lec.dto;

import java.sql.Date;

public class MenuReivewDto {
  private int mid;
  private String cid;
  private int foodid;
  private int star;
  private String mtitle;
  private String mcontent;
  private String mphoto;
  private Date rdate;
  private int mhit;
  private int mgroup;
  private int mstep;
  private int mindent;
  private String mip;
  
  public MenuReivewDto() {}

public MenuReivewDto(int mid, String cid, int foodid, int star, String mtitle, String mcontent, String mphoto,
		Date rdate, int mhit, int mgroup, int mstep, int mindent, String mip) {
	this.mid = mid;
	this.cid = cid;
	this.foodid = foodid;
	this.star = star;
	this.mtitle = mtitle;
	this.mcontent = mcontent;
	this.mphoto = mphoto;
	this.rdate = rdate;
	this.mhit = mhit;
	this.mgroup = mgroup;
	this.mstep = mstep;
	this.mindent = mindent;
	this.mip = mip;
}

public int getMid() {
	return mid;
}

public void setMid(int mid) {
	this.mid = mid;
}

public String getCid() {
	return cid;
}

public void setCid(String cid) {
	this.cid = cid;
}

public int getFoodid() {
	return foodid;
}

public void setFoodid(int foodid) {
	this.foodid = foodid;
}

public int getStar() {
	return star;
}

public void setStar(int star) {
	this.star = star;
}

public String getMtitle() {
	return mtitle;
}

public void setMtitle(String mtitle) {
	this.mtitle = mtitle;
}

public String getMcontent() {
	return mcontent;
}

public void setMcontent(String mcontent) {
	this.mcontent = mcontent;
}

public String getMphoto() {
	return mphoto;
}

public void setMphoto(String mphoto) {
	this.mphoto = mphoto;
}

public Date getRdate() {
	return rdate;
}

public void setRdate(Date rdate) {
	this.rdate = rdate;
}

public int getMhit() {
	return mhit;
}

public void setMhit(int mhit) {
	this.mhit = mhit;
}

public int getMgroup() {
	return mgroup;
}

public void setMgroup(int mgroup) {
	this.mgroup = mgroup;
}

public int getMstep() {
	return mstep;
}

public void setMstep(int mstep) {
	this.mstep = mstep;
}

public int getMindent() {
	return mindent;
}

public void setMindent(int mindent) {
	this.mindent = mindent;
}

public String getMip() {
	return mip;
}

public void setMip(String mip) {
	this.mip = mip;
}

@Override
public String toString() {
	return "MenuReivewDto [mid=" + mid + ", cid=" + cid + ", foodid=" + foodid + ", star=" + star + ", mtitle=" + mtitle
			+ ", mcontent=" + mcontent + ", mphoto=" + mphoto + ", rdate=" + rdate + ", mhit=" + mhit + ", mgroup="
			+ mgroup + ", mstep=" + mstep + ", mindent=" + mindent + ", mip=" + mip + "]";
}
  
}
