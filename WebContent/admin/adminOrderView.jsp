<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
	<div>
		<jsp:include page="/default/top.jsp"></jsp:include>
	</div>
	
	<h2>현재 진행중인 상태 보기</h2>
	
	<table border="1">
	 	<tr>
	 		<th>주문번호</th>
	 		<th>did</th>
	 		<th>sid</th>
	 		<th>reg_Time</th>
	 		<th>limit_Time</th>
	 		<th>상태</th>
	 		<th>취소하기</th>
	 	</tr>
	 	<c:forEach var="dto" items="${orders}">
		 	<tr>
		 		<td>${dto.onum}</td>
		 		<td>${dto.did}</td>
		 		<td>${dto.sid}</td>
		 		<td>${dto.reg_Time}</td>
		 		<td>${dto.limit_Time}</td>
		 		<td>${dto.state}</td>
		 		<td><input type="button" value="취소하기" onclick="location='adminOrderPro.do?onum=${dto.onum}'"></td>
		 	</tr>
	 	</c:forEach>
	</table>
</body>