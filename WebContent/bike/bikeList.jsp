<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<div>
	<table border="1">
		<tr>
			<th>번호판</th>
			<th>보험번호</th>
		</tr>
		<c:forEach var="dto" items="${bikelist}">	
			<tr>
				<td>${dto.id}</td>
				<td>${dto.ins}</td>
				<td><input type="button" value="삭제하기"></td>
			</tr>
		</c:forEach>
	</table>
</div>

<div>
	<jsp:include page="/bike/bikeAdd.jsp"></jsp:include>
</div>