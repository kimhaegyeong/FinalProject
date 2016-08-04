<%@page import="java.text.SimpleDateFormat"%>
<%@page import="qna.QnADataBean"%>
<%@page import="qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<link href="${project}style.css" rel="stylesheet" type="text/css">

<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<h2> ${page_list} ( ${str_list} : ${count} ) </h2>
<form method="post" action="list.do" name="listform" onsubmit="return searchcheck()">
	<table>
		<tr>
			<th colspan="5" align="right">
				<a href="boardWriteForm.do">${str_write}</a>&nbsp;&nbsp;&nbsp;			
			</th>
		</tr>
		<tr>
			<th style="width:5%"> ${str_num} </th>
			<th style="width:50%"> ${str_subject} </th>
			<th style="width:10%"> ${str_writer} </th>
			<th style="width:15%"> ${str_reg_date} </th>
			<th style="width:7%"> ${str_readcount} </th>	
		</tr>	
		
		<c:if test="${count == 0}">			
			<tr>
				<td colspan="6" align="center">	
						글이 없습니다					
				</td>
			</tr>			
		</c:if>
		<c:if test="${count != 0}">		
			<c:forEach var="dto" items="${list}">
				<tr>					
					<td align="center">
						<c:if test="${dto.category == 1}">
							공지
							<c:set var="number" value="${number-1}"/>
						</c:if>
						<c:if test="${dto.category == 0}">
							${number}
							<c:set var="number" value="${number-1}"/>
						</c:if>														 
					</td>
					<td>
						&nbsp;&nbsp;
						<c:set var="wid" value="${(dto.re_level - 1) *10}"/>
						<c:if test="${dto.re_level > 1}">
							<img src="${project}images/level.gif" border="0" height="15" width="${wid}">
						</c:if>
						<c:if test="${dto.re_level > 0}">
							<img src="${project}images/re.gif" border="0" height="15" width="20">
						</c:if>
						<c:if test="${dto.category == 1}">
							<img src="${project}images/notice.gif" border="0" height="15" width="20">
						</c:if>							
						<a href="boardContent.do?no=${dto.no}&pageNum=${pageNum}&number=${number+1}&category=${dto.category}">
							${dto.subject}
						</a>
						<c:if test="${dto.readcount >= 20}">
							<img src="${project}images/hot.gif" border="0" height="15" width="20">
						</c:if>						
					</td>
					<td align="center">
						${dto.writer}
					</td>
					<td align="center">
						<fmt:formatDate value="${dto.reg_date }"
							pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<td	align="center">
						${dto.readcount}
					</td>
				</tr>	
			</c:forEach>					
		</c:if>
	</table>
	<br>
	<select name="searchArticle">
		<option value="1">제목</option>
		<option value="2">작성자</option>
	</select> 
	&nbsp;&nbsp; 
	<input type="text" name="search">
	&nbsp;&nbsp; 
	<input type="submit" value="검색">
	
	<br>
	<c:if test="${count > 0}">
		<c:if test="${startPage > pageBlock }">	
			<a href="list.do?pageNum=1">[◀◀]</a>
			<a href="list.do?pageNum=${startPage-pageBlock}">[◀]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${i == currentPage}">
				<span><b>[${i}]</b></span>
			</c:if>
			<c:if test="${i != currentPage}">
				<a href="list.do?pageNum=${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${pageCount > endPage}">
			<a href="list.do?pageNum=${startPage+pageBlock}">[▶]</a>
			<a href="list.do?pageNum=${pageCount}">[▶▶]</a>
		</c:if>
	</c:if>
</form>







		