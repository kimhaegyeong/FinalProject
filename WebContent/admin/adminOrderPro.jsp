<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result==1}">
	<script type="text/javascript">
	 	//<!--
	 	alert("취소 처리했습니다.");
	 	//-->
	</script>
	<meta http-equiv="refresh" content="0;url=adminOrderView.do">
</c:if>

<c:if test="${result!=1}">
	<script type="text/javascript">
		//<!--
		alert("취소에 실패했습니다.");
		//-->
	</script>
	<meta http-equiv="refresh" content="0;url=adminOrderView.do">
</c:if>