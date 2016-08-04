<%@page import="java.text.SimpleDateFormat"%>
<%@page import="qna.QnADataBean"%>
<%@page import="qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">

<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<h2> ${page_content} </h2>

<table style="width:700px">
	<tr>
		<th> ${str_num} </th>
		<td align="center"> ${number} </td>
		<th> ${str_readcount} </th>
		<td align="center"> ${dto.readcount} </td>
	</tr>
	<tr>
		<th> ${str_writer} </th>
		<td align="center"> ${dto.writer} </td>
		<th> ${str_reg_date} </th>
		<td align="center">
			<fmt:formatDate value="${dto.reg_date}"
				pattern="yyyy-MM-dd HH:mm"/>
		</td>
	</tr>
	<tr>
		<th> ${str_subject} </th>
		<td colspan="3"> ${dto.subject} </td>
	</tr>
	<tr>
		<th> ${str_content} </th>
		<td colspan="3"> <pre>${dto.content}</pre> </td>
	</tr>
	<tr>
		<th colspan="4">
			<c:if test="${check==3}"> 
				<input class="inputbutton" type="button" value="${btn_modify}"
				onclick="location='boardModifyForm.do?no=${dto.no}&pageNum=${pageNum}'">
				<input class="inputbutton" type="button" value="${btn_delete}"
				onclick="location='boardDeleteForm.do?no=${dto.no}&pageNum=${pageNum}'">
				<c:if test="${category == 0}">
					<input class="inputbutton" type="button" value="${btn_reply}"
					onclick="location='boardWriteForm.do?no=${dto.no}&refe=${dto.refe}&re_step=${dto.re_step}&re_level=${dto.re_level}'">
				</c:if>
			</c:if>
			<c:if test="${category == 0 and check != 3}"> 
				<input class="inputbutton" type="button" value="${btn_delete}"
				onclick="location='boardDeleteForm.do?no=${dto.no}&pageNum=${pageNum}'">
			</c:if>
			<c:if test="${category == 0 and check != 3}"> 
			<input class="inputbutton" type="button" value="${btn_reply}"
				onclick="location='boardWriteForm.do?no=${dto.no}&refe=${dto.refe}&re_step=${dto.re_step}&re_level=${dto.re_level}'">
			</c:if>
			<input class="inputbutton" type="button" value="${btn_list}"
				onclick="location='list.do?pageNum=${pageNum}'">
		</th>
	</tr>
</table>












    