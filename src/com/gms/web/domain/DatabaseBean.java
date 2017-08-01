package com.gms.web.domain;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;

import com.gms.web.constant.DB;

public class DatabaseBean implements Serializable{
   private static final long serialVersionUID = 1L;//아이디를 다쓸라고 빈끼리 연동
   private String driver,url,username,password;
   private Connection connection;
   public DatabaseBean(String driver, String url, String username, String password) {
      super();
      this.driver = driver;
      this.url = url;
      this.username = username;
      this.password = password;
   }
   public Connection geConnection(){
      try {
         Class.forName(DB.ORACLE_DRIVER);
         connection=DriverManager.getConnection(DB.ORACLE_URL,DB.USERNAME,DB.PASSWORD);
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return connection;
      
   }
}