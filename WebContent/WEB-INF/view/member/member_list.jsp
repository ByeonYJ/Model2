<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "member_head.jsp" %>
	<header>
	<h1 class="gms-h1">Member List</h1>
	</header>
	<hr /><br />
		<!-- id, pwd, name, ssn, regdate, email, major, subject -->
		<table id="mem-list-tab">
			<tr>
				<th style="width: 5%">No</th>
				<th style="width: 10%">아이디</th>
				<th style="width: 10%">이름</th>
				<th style="width: 10%">주민번호</th>
				<th style="width: 15%">이메일</th>
				<th style="width: 10%">전화번호</th>
				<th style="width: 10%">전공</th>
				<th style="width: 10%">학점</th>
				<th style="width: 10%">가입날짜</th>
				<th style="width: 10%">수정/삭제</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td><a href="<%= request.getContextPath()%>/member.do?action=move&page=list"></a></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>java</td>
				<td></td>
				<td><a href="<%= request.getContextPath()%>/member.do?action=move&page=update">수정</a> <a href="<%= request.getContextPath()%>/member.do?action=move&page=delete">삭제</a></td>
			</tr>
		</table>
<%@ include file = "../common/footer.jsp" %>