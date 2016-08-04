<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>
<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<h2> ${page_modify} </h2>

<body onload="passwdfocus()">
	<form method="post" action="boardModifyView.do"
		name="passwdform" onsubmit="return passwdcheck()">
		<input type="hidden" name="no" value="${no}">
		<input type="hidden" name="pageNum" value="${pageNum}">
			<table style="width:350px"> 
			<tr>
				<th colspan="2">
					${msg_passwd}
				</th>
			</tr>
			<tr>
				<th> ${str_passwd} </th>
				<td>
					<input class="input" type="password" name="passwd"
						maxlength="12" style="width:200px">
				</td>				
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="${btn_mod}">
					<input class="inputbutton" type="button" value="${btn_mod_cancel}"
						onclick="location='list.do?pageNum=${pageNum}'">
				</th>
			</tr>			
		</table>
	</form>
</body>














