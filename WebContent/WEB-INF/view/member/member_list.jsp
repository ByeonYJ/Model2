<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/common_head.jsp"/>
	<header>
	<h1 class="gms-h1">Member List</h1>
	</header>
	<hr /><br />
		<table id="mem-list-tab">
			<tr>
				<th style="width: 5%">No</th>
				<th style="width: 10%">아이디</th>
				<th style="width: 10%">이름</th>
				<th style="width: 10%">생년월일</th>
				<th style="width: 10%">전화번호</th>
				<th style="width: 15%">이메일</th>
				<th style="width: 20%">수강과목</th>
				<th style="width: 10%">등록일</th>
				<th style="width: 10%">수정/삭제</th>
			</tr>
			<c:forEach var="i" items="${requestScope.list}"><!--action tag, requestScope는 값을 주고 사라져야한다-->
			<tr>
				<td style="widtd: 5%">${i.num}</td>
				<td style="widtd: 10%">${i.id}</td>
				<td style="widtd: 10%">${i.name}</td>
				<td style="widtd: 20%">${i.ssn}</td>
				<td style="widtd: 10%">${i.phone}</td>
				<td style="widtd: 15%">${i.email}</td>
				<td style="widtd: 10%">${i.title}</td>
				<td style="widtd: 10%">${i.regdate}</td>
				<td style="widtd: 10%">수정/삭제</td>
			</tr>
			</c:forEach>
		</table>
		<nav aria-label="Page navigation" style="width:450px; margin:0 auto;">
		  <ul class="pagination">
		  	<c:if test="${requestScope.prevBlock gt 0}">
		  <li><a href="#"><span class="glyphicon glyphicon-backward" aria-hidden="true"></span></a></li>
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    </c:if>
		    <c:forEach varStatus="i" begin="${requestScope.startPage}" end="${requestScope.endPage}" step="1"> 
		    	<c:choose>
		    		<c:when test="${i.index eq requestScope.pageNumber}">
				    	<li class="active"><a href="#">${i.index}</a></li>
		    		</c:when>
		    		<c:otherwise>
				    	<li> <a onclick="list('member','member_list',${i.index})">${i.index}</a></li>
		    		</c:otherwise>
		    	</c:choose>
		    </c:forEach>
		    <c:if test="${requestScope.nextBlock le requestScope.theNumberOfPages}">
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		    <li><a href="#"><span class="glyphicon glyphicon-forward" aria-hidden="true"></span></a></li>
		  	</c:if>
		  </ul>
		</nav>
<jsp:include page="../common/footer.jsp"/>