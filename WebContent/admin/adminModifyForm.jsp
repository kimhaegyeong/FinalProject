<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
	<div>
		<jsp:include page="/default/top.jsp"></jsp:include>
	</div>
	
	<h2>관리자 수정 페이지입니다S.</h2>
	<div>
	<table>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="passwd1"><br>
				<input type="password" name="passwd2">
			</td>
		</tr>
		<tr>
			<th>수수료</th>
			<td><input type="text" maxlength="5">원</td>
		</tr>
	</table>
	</div>
</body>