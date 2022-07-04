package com.lec.dto;

import java.sql.Date;

public class MenuReivewDto {
  private int mid; // 글번호
  private String cid;  // 작성자 id
  private String cname; // 작성자 이름
  private int foodid; // 음식번호 
  private int star;   // 평점
  private String mtitle;  // 글제목
  private String mcontent;  // 글본문
  private String mphoto;  // 글 사진
  private Date mrdate;     // 글 작성 시점
  private int mhit;       // 글조회수
  private int mgroup;     // 글그룹
  private int mstep;      // 글스텝
  private int mindent;    // 글인덴트
  private String mip;     // 글 ip
  
  public MenuReivewDto() {}

public MenuReivewDto(int mid, String cid, String cname, int foodid, int star, String mtitle, String mcontent,
		String mphoto, Date mrdate, int mhit, int mgroup, int mstep, int mindent, String mip) {
	this.mid = mid;
	this.cid = cid;
	this.cname = cname;
	this.foodid = foodid;
	this.star = star;
	this.mtitle = mtitle;
	this.mcontent = mcontent;
	this.mphoto = mphoto;
	this.mrdate = mrdate;
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

public String getCname() {
	return cname;
}

public void setCname(String cname) {
	this.cname = cname;
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

public Date getMrdate() {
	return mrdate;
}

public void setMrdate(Date mrdate) {
	this.mrdate = mrdate;
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
	return "MenuReivewDto [mid=" + mid + ", cid=" + cid + ", cname=" + cname + ", foodid=" + foodid + ", star=" + star
			+ ", mtitle=" + mtitle + ", mcontent=" + mcontent + ", mphoto=" + mphoto + ", mrdate=" + mrdate + ", mhit="
			+ mhit + ", mgroup=" + mgroup + ", mstep=" + mstep + ", mindent=" + mindent + ", mip=" + mip + "]";
}


}
