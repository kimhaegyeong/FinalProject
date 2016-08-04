<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>

<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<h2> ${page_write} </h2>

<body onload="writefocus()">
	<form method="post" action="boardWritePro.do"
		name="writeform" onsubmit="return writecheck()">
		
		<input type="hidden" name="no" value="${no}">
		<input type="hidden" name="writer" value="${writer}">
		<input type="hidden" name="refe" value="${refe}">
		<input type="hidden" name="re_step" value="${re_step}">
		<input type="hidden" name="re_level" value="${re_level}">
	
		<table style="width:700px">
			<tr>
				<th colspan="2" align="right">
					<a href="list.do">${str_tolist}</a>&nbsp;&nbsp;&nbsp;
				</th>
			</tr>
			<c:if test="${check==3}">
				<tr>
					<th colspan="2" align="left">
						<c:if test="${no == 0}">
							<input type="radio" name="notice" value="1" checked="checked"> 공지사항
						</c:if>
						<c:if test="${no != 0}">
							&nbsp;&nbsp;&nbsp;&nbsp; 댓글쓰기
							<input type="hidden" name="notice" value="0">
						</c:if>
					</th>
				</tr>
			</c:if>			
			<tr>
				<th> ${str_writer} </th>
				<td>${writer}</td>
			</tr>
			<tr>
				<th> ${str_subject} </th>
				<td>
					<input class="input" type="text" name="subject"
						maxlength="50" style="width:600px">
				</td>
			</tr>
			<tr>
				<th> ${str_content} </th>
				<td>
					<textarea name="content" cols="33" rows="10" style="width:600px"></textarea>
				</td>
			</tr>
			<tr>
				<th> ${str_passwd} </th>
				<td>
					<input class="input" type="password" name="passwd" 
						maxlength="12">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="${btn_write}">
					<input class="inputbutton" type="reset" value="${btn_cancel}">
					<input class="inputbutton" type="button" value="${btn_list}"
						onclick="location='list.do'">
				</th>
			</tr>			
		</table>	
	</form>
</body>























    