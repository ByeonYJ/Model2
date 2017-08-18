<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="member_head.jsp"/>
	<header>
	<h1 class="gms-h1">Member Detail</h1>
	</header>
	<hr /><br />
	<h1 class="gms-text-center">회원 상세정보</h1>
	<form id="mem_update" action="${ctx}/member/service_update.jsp" method="get">
	<table id = "detail-tab">
		<tr>
			<td colspan="2" rowspan="3" align="left" width="20%"><img src="${ctx}/resources/img/profile.JPG"></td>
			<th> 이름 </th>
			<td></td>
		</tr>
		<tr>
			<th>ID </th>
			<td><input type="hidden" name="reid" value=""></td>
		</tr>
		<tr>
			<th> SSN </th>
			<td></td>
		</tr>
		<tr>
			<th >전화</th>
			<td colspan="3"><input type="text" name="rephone" value=""/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="3"><input type="text" name="reemail" value=""/></td>
		</tr>
		<tr>
			<th>전공</th>
			<td colspan="3"><input type="text" name="remajor" value=""/></td>
		</tr>
	</table>
	<div id="btn_div">
	<br />
	<input type="submit" id="confirm_btn" value="수 정" />
	<input type="button" id="cancle_btn" onclick="javascript:cancle()" value="취 소" />
	</div>
	</form>
	<script>
		function cancle() {
			location.href="${ctx}/member/member_detail.jsp?id=null";
		}
	</script>
	<jsp:include page="../common/footer.jsp"/>