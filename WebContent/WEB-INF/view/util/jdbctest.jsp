<%@ page import="com.gms.web.constant.DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.gms.web.constant.DB"%>
<%@ page import="java.sql.* "%>
<%
   Class.forName(DB.ORACLE_DRIVER); // Class는 for name을통해 데이터베이스드라이버를
   // 호출하는거 예를들어닥터스트레인지 유체이탈
   Connection conn = DriverManager.getConnection(DB.ORACLE_URL, DB.USERNAME, DB.PASSWORD);
   Statement stmt = conn.createStatement();// create 는 없던것을 만드는 펙토리 패턴
   String sql = "SELECT * FROM Member WHERE member_id='cho'"; //where if문 아이디가 cho
   ResultSet rs = stmt.executeQuery(sql);// execute는 실행해라 sql문을
   String findName="";
   if (rs.next()) {
      findName = rs.getString("name");
   }
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Document</title>
</head>
<body>
   <<h1> Hellow <%=findName %></h1>
</body>
</html>