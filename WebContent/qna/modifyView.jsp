<%@page import="qna.QnADataBean"%>
<%@page import="qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>    
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>

<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<h2> ${page_modify} </h2>

<c:if test="${result == 0}">
	<script>
		<!--
		erroralert( passwderror );
		//-->
	</script>
</c:if>
<c:if test="${result != 0}">	
	<body onload="modifyfocus()">
		<form method="post" action="boardModifyPro.do"
			name="modifyform" onsubmit="return modifycheck()">
			<input type="hidden" name="no" value="${no}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<table style="width:700px">
				<tr>
					<th colspan="2">
						${msg_modify}
					</th>						
				</tr>
				<tr>
					<th> ${str_writer} </th>
					<td> ${dto.writer} </td>
				</tr>				
				<tr>
					<th> ${str_subject} </th>
					<td>
						<input class="input" type="text" name="subject" value="${dto.subject}" style="width:600px">
					</td>
				</tr>
				<tr>
					<th> ${str_content} </th>
					<td>
						<textarea name="content" cols="33" rows="10" style="width:600px">${dto.content}</textarea>
					</td>
				</tr>
				<tr>
					<th> ${str_passwd} </th>
					<td>
						<input class="input" type="password" name="passwd"
							maxlength="12" value="${dto.passwd}">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="${btn_mod}">
						<input class="inputbutton" type="reset" value="${btn_cancel}">
						<input class="inputbutton" type="button" value="${btn_mod_cancel}"
							onclick="location='list.do?pageNum=${pageNum}'">
					</th>
				</tr>
			</table>				
		</form>
	</body>
</c:if>		











