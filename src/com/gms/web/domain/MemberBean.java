package com.gms.web.domain;

import java.io.Serializable;

public class MemberBean implements Serializable {
   private static final long Serializable = 1L;
      
   private String id,name,password,ssn,regdate,email,major,subject,phone;
   
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getMajor() {
      return major;
   }
   public void setMajor(String major) {
      this.major = major;
   }
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public void setId(String id){
      this.id=id;
   }
   public String getId(){
      return id;
   }
   public void setName(String name){
      this.name=name;
   }
   public String getName(){
      return name;
   }
   public void setPassword(String password){
      this.password=password;
   }
   public String getPassword(){
      return password;
   }
   public void setSsn(String ssn){
      this.ssn=ssn;
   }
   public String getSsn(){
      return ssn;
   }
   public void setRegdate(String regdate){
      this.regdate=regdate;
   }
   public String getRegdate(){
      return regdate;
   }
   @Override
   public String toString() {
      return "[id=" + id + ", name=" + name + ", password=" + password + ", ssn=" + ssn + ", regdate="
            + regdate + "] \n";
   }
}