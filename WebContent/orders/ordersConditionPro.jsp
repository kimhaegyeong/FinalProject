<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<h2> 배달상태 변경 처리페이지</h2>

<!-- num 1-수락 2-거절 -->
<c:if test="${num == 1}">
	<!-- result 1-성공 0-실패 -->
	<c:if test="${result==1}">	
		<script type="text/javascript">
		//<!--
			alert("배달완료!!");			
		//-->			
		</script>
	</c:if>
	<c:if test="${result!=1}">
		<script type="text/javascript">
		//<!--
			alert("배달완료변경 실패. 잠시 후 다시 시도하세요");
		//-->			
		</script>		
	</c:if>
	<meta http-equiv="refresh" content="0; url=ordersConditionForm.do?id=${id}">
</c:if>

<!-- num 1-수락 2-거절 -->
<c:if test="${num == 2}">
	<!-- result 1-성공 0-실패 -->
	<c:if test="${result==1}">	
		<script type="text/javascript">
		//<!--
			alert("배달삭제 성공");		
		//-->			
		</script>
	</c:if>
	<c:if test="${result!=1}">
		<script type="text/javascript">
		//<!--
			alert("배달삭제 실패. 잠시 후 다시 시도하세요");
		//-->			
		</script>
	</c:if>
	<meta http-equiv="refresh" content="0; url=ordersConditionForm.do?id=${id}">
</c:if>