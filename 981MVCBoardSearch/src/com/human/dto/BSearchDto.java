package com.human.dto;

public class BSearchDto extends BPageDto {
	private String searchVal;
	private String searchCol;
	
	public void makePage(int page, int pageDataCount, int totalDataCount, String searchCol, String searchVal) {
		makePage(page, pageDataCount, totalDataCount);
		this.searchCol=searchCol;
		this.searchVal=searchVal;
	}
	
	public String getSearchVal() {
		return searchVal;
	}
	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	public String getSearchCol() {
		return searchCol;
	}
	public void setSearchCol(String searchCol) {
		this.searchCol = searchCol;
	}
	@Override
	public String toString() {
		return super.toString()+"\nBSearchDto [searchVal=" + searchVal + ", searchCol=" + searchCol + "]";
	}
	
	
	
}
