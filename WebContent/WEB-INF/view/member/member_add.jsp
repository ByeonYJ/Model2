<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="member_head.jsp"/>
	<header>
	<h1 class="gms-h1">Member Add</h1>
	</header>
	<hr /><br />
		<div id="image" class="gms-image"><a href="${ctx}/index.jsp"><img src="${ctx}/resources/img/join.jpg" alt=""/></a></div><br />
		<form id="join_form" onsubmit="memberAdd()">
			<fieldset>
			<legend>회원가입</legend>
			<span class="join_id">ID</span>
			<input id="id" name="id" type="text" placeholder="아이디"  /><br />
			<label>Password: </label>
			<input id="pass" name="password" type="password" placeholder="비밀번호" value="a"/><br />
			<span class="join-span">Name: </span>
			<input id="name" name="name" type="text" placeholder="이름"  value="고슬링"/><br />
			<span class="join-span">birthday</span>
			<input id="birth" name="birth" type="text" value="2000-05-05"/><br />
			<span class="join-span">email</span>
			<input type="email" name="email" value="order1986@naver.com"/><br />
			<span class="join-span">phone</span>
			<input type="text" name="phone" /><br />
			<input name="gender" type="radio" value="male" checked>남자
			<input name="gender" type="radio" value="female">여자<br />
			<h4>전공</h4>
			<select name="major">
				<option value="computer" selected>컴퓨터공학과</option>
				<option value="economics">경제학</option>
				<option value="tourism">관광학</option>
				<option value="art">미술학</option>
			</select><br />
			<h4>수강과목</h4>
			<input type="checkbox" name="subject" value="java" checked/>Java <br />
			<input type="checkbox" name="subject" value="C" checked/>C<br />
			<input type="checkbox" name="subject" value="html" checked/>HTML<br />
			<input type="checkbox" name="subject" value="css" />CSS<br />
			<input type="checkbox" name="subject" value="javascript" />JavaScript<br />
			<input type="checkbox" name="subject" value="sql" />MySQL<br />
			<input type="checkbox" name="subject" value="python" />Python<br /><br />
			<input id="join_yes_btn" onsubmit="memberAdd()" type="submit" value="등록" onclick="addAlert()" class="submit-pink">
			<input id="join_no_btn" type="reset" value="취소" class="submit-blue">
			<input type="hidden" name="action" value="join"/>
			<input type="hidden" name="page" value="main"/>
			</fieldset>
		</form>
<script>
function addAlert() {
	var id=document.getElementByid("id").value;
	var pass=document.getElementByid("pass").value;
	var name=document.getElementByid("name").value;
	var birth=document.getElementByid("birth").value;
}
function memberAdd() {
	var form=document.getElementById('join_form');
	form.setAttribute('action','${ctx}/member.do');
	form.setAttribute('method','post');
	form.submit();
	return true;/*true일때는 return true 생략이 가능*/
}
</script>
<jsp:include page="../common/footer.jsp"/>