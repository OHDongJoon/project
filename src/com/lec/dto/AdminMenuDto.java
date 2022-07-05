package com.lec.dto;

public class AdminMenuDto {
	private int foodid;
	private String menuname;
	private String menuprice;
	private String aphoto;
	private String foodcontent;
	private double avg;
	public AdminMenuDto() {}
	public AdminMenuDto(int foodid, String menuname, String menuprice, String aphoto, String foodcontent, double avg) {
		this.foodid = foodid;
		this.menuname = menuname;
		this.menuprice = menuprice;
		this.aphoto = aphoto;
		this.foodcontent = foodcontent;
		this.avg = avg;
	
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public int getFoodid() {
		return foodid;
	}
	public void setFoodid(int foodid) {
		this.foodid = foodid;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public String getMenuprice() {
		return menuprice;
	}
	public void setMenuprice(String menuprice) {
		this.menuprice = menuprice;
	}
	public String getAphoto() {
		return aphoto;
	}
	public void setAphoto(String aphoto) {
		this.aphoto = aphoto;
	}
	public String getFoodcontent() {
		return foodcontent;
	}
	public void setFoodcontent(String foodcontent) {
		this.foodcontent = foodcontent;
	}
	
	@Override
	public String toString() {
		return "AdminMenuDto [foodid=" + foodid + ", menuname=" + menuname + ", menuprice=" + menuprice + ", aphoto="
				+ aphoto + ", foodcontent=" + foodcontent + "]";
	}
	
}