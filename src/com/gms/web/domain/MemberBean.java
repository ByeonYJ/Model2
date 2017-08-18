package com.gms.web.domain;
import lombok.Data;
@Data 
public class MemberBean {
	private String id,name,password,ssn,regdate,email,major,phone,profile;
	private String[] subject;
}