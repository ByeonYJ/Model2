<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
<title>학생관리</title>
<link rel="stylesheet" href="${ctx}/resources/css/member.css" />
</head>
<body>
<div id="wrapper">
	<a href="${ctx}/index.jsp" class="gms-gomain">메인으로 가기</a><br />
<header>
<h1 class="gms-h1">Login Page</h1>
</header>
<hr /><br />
	<div class="gms-image"><a href="${ctx}/index.jsp"><img src="${ctx}/resources/img/login.JPG" alt="" /></a></div><br />
		<form id="login_form">
		<fieldset class="form-edit">
		<legend>로그인</legend>
			<span class="login-span">ID</span>
			<input type="text" id="input_id" name="input_id"><br />
			<label>PASSWORD</label> <input type="password" id="input_pass" name="input_pass" /><br />
			<mark style="font-size: 13px"> *ID는 숫자 포함 8글자 이내*</mark><br />
			<input type="submit" name="login" onclick="loginAlert()" class="submit-pink">
			<input type="reset" name="cancle" class="submit-blue">
			<input type="hidden" name="action" value="login">
			<input type="hidden" name="page" value="main">
		</fieldset>
		</form>
<br /><hr />
<script>
	function loginAlert(){
		var input_id = document.getElementById("input_id").value;
		var input_pass = document.getElementById("input_pass").value;
		if(input_id===""){
			alert("ID 입력");
			return false;
		}
		if(input_pass===""){
			alert('PW 입력');
			return false;
		}
		var form=document.getElementById('login_form');
		form.action="${ctx}/common.do";
		form.method="post";
		return true;
	}
</script>
<footer>
  <div>
  <p>Posted by: ByeonYJ</p>
  <p>Contact information: <a href="mailto:someone@example.com">
  order1986@gmail.com</a>.</p>
  <a href="${ctx}/util/jdbc_test.jsp" />DB 테스트</a>
  <a href="${ctx}/util/update_email.jsp"/>E-mail 테스트</a>
  </div>
</footer>
</body>
</html>
