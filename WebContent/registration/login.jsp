<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}">
	<c:if test="${result==1}">
		${sessionScope.check = check}
		${sessionScope.id = id}
		<c:redirect url="main.do"/>
	</c:if>
	<c:if test="${result==0}">
		<script type="text/javascript">
			<!--
			alert("아이디 혹은 비밀번호를 확인해 주세요");
			-->
		</script>			
		<meta http-equiv="refresh" content="0;url=index.do">		
	</c:if>
</c:if>
<c:if test="${check==2}">
	<c:if test="${result==1}">
		${sessionScope.check = check}
		${sessionScope.id = id}
		<c:redirect url="main.do"/>
	</c:if>
	<c:if test="${result==0}">
		<script type="text/javascript">
			<!--
			alert("아이디 혹은 비밀번호를 확인해 주세요");
			-->
		</script>
		<meta http-equiv="refresh" content="0;url=index.do">
	</c:if>
</c:if>
<c:if test="${check==3}">
	<c:if test="${result==1}">
		${sessionScope.check = check}
		${sessionScope.id = email}
		<c:redirect url="adminOrderView.do"/>
	</c:if>
	<c:if test="${result==0}">
		<script type="text/javascript">
			<!--
			alert("아이디 혹은 비밀번호를 확인해 주세요");
			-->
		</script>
		<meta http-equiv="refresh" content="0;url=index.do">
	</c:if>
</c:if>