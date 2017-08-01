<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Hello HTML</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/member.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="wrapper">
<header>
<h1 class="gms-h1">Index</h1>
</header>
<div class="gms-right">Time :</div>
<br />
<hr />
<div id="container">
<table id="index-tab">
	<tr id="index-tab-tr">
		<td><i class="fa fa-heart"></i> 학생관리</td>
		<td><i class="fa fa-file"></i> 성적관리</td>
		<td><i class="fa fa-bars"></i> 게시판</td>
		</tr>
	<tr>
		<td>
			<ul class="index-ul" >
				<li><a href="<%=request.getContextPath() %>/member.do?action=move&page=member_add">학생정보 추가</a></li>
				<li><a href="<%=request.getContextPath() %>/member.do?action=move&page=member_list">학생정보 목록</a></li>
				<li><a href="<%=request.getContextPath() %>/member.do?action=move&page=member_detail">학생 상세정보</a></li>
				<li><a href="<%=request.getContextPath() %>/member.do?action=move&page=member_update">학생정보 수정</a></li>
				<li><a href="<%=request.getContextPath() %>/member.do?action=move&page=member_delete">학생정보 삭제</a></li>
			</ul>
		</td>
		<td>
		<ul  class="index-ul">
				<li><a href="../grade/grade_add.jsp">성적 입력</a></li>
				<li><a href="../grade/grade_list.jsp">성적 목록</a></li>
				<li><a href="../grade/grade_detail.jsp">성적 상세</a></li>
				<li><a href="../grade/grade_update.jsp">성적 수정</a></li>
				<li><a href="../grade/grade_delete.jsp">성적 삭제</a></li>
		</ul>
		</td>
		<td >
		<ul  class="index-ul">
				<li><a href="../board/board_write.jsp">게시글 쓰기</a></li>
				<li><a href="../board/board_list.jsp">게시글 목록</a></li>
				<li><a href="../board/board_detail.jsp">게시글 내용</a></li>
				<li><a href="../board/board_update.jsp">게시글 수정</a></li>
				<li><a href="../board/board_delete.jsp">게시글 삭제</a></li>
		</ul>
		</td>
			</tr>
</table>
</div>	
<%@ include file = "footer.jsp" %>