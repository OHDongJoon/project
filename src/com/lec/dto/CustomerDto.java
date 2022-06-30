package com.lec.dto;

import java.sql.Date;

public class CustomerDto {
 private String cId;
 private String cPw;
 private String cName;
 private String cEmail;
 private Date   cBirth;
 private String cAddress;
 private Date   cRdate;
public CustomerDto() {}
public CustomerDto(String cId, String cPw, String cName, String cEmail, Date cBirth, String cAddress, Date cRdate) {
	this.cId = cId;
	this.cPw = cPw;
	this.cName = cName;
	this.cEmail = cEmail;
	this.cBirth = cBirth;
	this.cAddress = cAddress;
	this.cRdate = cRdate;
}
public String getcId() {
	return cId;
}
public void setcId(String cId) {
	this.cId = cId;
}
public String getcPw() {
	return cPw;
}
public void setcPw(String cPw) {
	this.cPw = cPw;
}
public String getcName() {
	return cName;
}
public void setcName(String cName) {
	this.cName = cName;
}
public String getcEmail() {
	return cEmail;
}
public void setcEmail(String cEmail) {
	this.cEmail = cEmail;
}
public Date getcBirth() {
	return cBirth;
}
public void setcBirth(Date cBirth) {
	this.cBirth = cBirth;
}
public String getcAddress() {
	return cAddress;
}
public void setcAddress(String cAddress) {
	this.cAddress = cAddress;
}
public Date getcRdate() {
	return cRdate;
}
public void setcRdate(Date cRdate) {
	this.cRdate = cRdate;
}
@Override
public String toString() {
	return "CustomerDto [cId=" + cId + ", cPw=" + cPw + ", cName=" + cName + ", cEmail=" + cEmail + ", cBirth=" + cBirth
			+ ", cAddress=" + cAddress + ", cRdate=" + cRdate + "]";
}
 
}
