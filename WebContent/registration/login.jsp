<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
	<c:if test="${check==1}">
		<!-- 1로 로그인한 경우 -->
		<c:if test="${result==1}">
			<!-- 로그인 성공한 경우 -->
			<c:redirect url="main.do">
				<c:param name="check" value="${check}"/>
				<c:param name="id" value="${id}"/>
			</c:redirect>
		</c:if>
		<c:if test="${result==0}">
			<!-- 로그인에 실패한 경우 -->
			<script type="text/javascript">
				<!--
				alert("아이디 혹은 비밀번호를 확인해 주세요");
				-->
			</script>			
			<meta http-equiv="refresh" content="0;url=index.do">		
		</c:if>
	</c:if>
	<c:if test="${check==2}">
		<!-- 2로 로그인한 경우 -->
		<c:if test="${result==1}">
			<c:redirect url="main.do">
				<c:param name="check" value="${check}"/>
				<c:param name="check" value="${id}"/>
			</c:redirect>
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
		<!-- 3로 로그인한 경우 -->
		<c:if test="${result==1}">
			<c:redirect url="adminOrderView.do">
				<c:param name="check" value="${check}"/>
				<c:param name="id" value="${id}"/>
			</c:redirect>
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
</body>
