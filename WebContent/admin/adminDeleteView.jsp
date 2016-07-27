<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	//<!--
	function checkAdminDelete(){
		if(!adminDelete.sd.value){
			alert("검색할 가게 유형을 선택해주세요");
			return false;
		}else if(!adminDelete.finder.value){
			alert("검색할 가게 내용을 적어주세요");
			return false;
		}
	}
	//-->
</script>

<form method="post" action="adminDeleteView.do" name="adminDelete" onsubmit="return checkAdminDelete()">
	<input type="hidden" name="view" value=1>
	<div>
		<jsp:include page="/default/top.jsp"></jsp:include>
	</div>
	<h2>사용자 삭제하기</h2>
	<div>
		<input type="radio" name=sd value=1>Stores
		<input type="radio" name=sd value=2>Delivery<br>
		<select name="find">
			<option value=1>사업자명으로 찾기</option>
			<option value=2>가게명으로 찾기</option>
		</select>
		<input type="text" name="finder">
		<input type="submit" name="검색하기">
	</div>
	
	<c:if test = "${view==1}">
		<table border="1">
			<tr>
				<th>id</th><th>사업자명</th><th>가게명</th><th>전화번호</th><th>주소</th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<td>${dto.sid}</td>
				<td>${dto.tel}</td>
			</c:forEach>
		</table>
	</c:if>
		
</form>
	