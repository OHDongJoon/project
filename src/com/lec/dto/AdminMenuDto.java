package com.lec.dto;

public class AdminMenuDto {
	private int foodId;
	private String menuName;
	private String menuPrice;
	private String aPhoto;
	private String foodContent;
	private int star;
	public AdminMenuDto() {}
	public AdminMenuDto(int foodId, String menuName, String menuPrice, String aPhoto, String foodContent, int star) {
		super();
		this.foodId = foodId;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.aPhoto = aPhoto;
		this.foodContent = foodContent;
		this.star = star;
	}
	public int getFoodId() {
		return foodId;
	}
	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getaPhoto() {
		return aPhoto;
	}
	public void setaPhoto(String aPhoto) {
		this.aPhoto = aPhoto;
	}
	public String getFoodContent() {
		return foodContent;
	}
	public void setFoodContent(String foodContent) {
		this.foodContent = foodContent;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	@Override
	public String toString() {
		return "AdminMenuDto [foodId=" + foodId + ", menuName=" + menuName + ", menuPrice=" + menuPrice + ", aPhoto="
				+ aPhoto + ", foodContent=" + foodContent + ", star=" + star + "]";
	}
	
	
}
