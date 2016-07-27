<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/DeliveryB/delivery/request.js"></script>
<%@ include file="setting.jsp" %>

<h2> 배달 수락/거절 처리페이지</h2>

<!-- num 1-완료 2-삭제 -->
<c:if test="${num == 1}">
	<!-- result 1-성공 0-실패 -->
	<c:if test="${result==1}">	
		<script type="text/javascript">
		//<!--
			var ok = confirm("배달수락 성공! \n배달현황 보러가기?");
			if(ok) {
				location.href="ordersConditionForm.do?id=${id}";
			} else {
				location.href="ordersViewForm.do?id=${id}";
			}
		//-->			
		</script>
	</c:if>
	<c:if test="${result!=1}">
		<script type="text/javascript">
		//<!--
			alert("배달수락 실패. 잠시 후 다시 시도하세요");
		//-->			
		</script>	
		<meta http-equiv="refresh" content="0; url=ordersViewForm.do?id=${id}">	
	</c:if>	
</c:if>

<!-- num 1-완료 2-삭제 -->
<c:if test="${num == 2}">
	<!-- result 1-성공 0-실패 -->
	<c:if test="${result==1}">	
		<script type="text/javascript">
		//<!--
			var ok = confirm("배달거절 성공 \n배달현황 보러가기?");
			if(ok) {
				location.href="ordersConditionForm.do?id=${id}";
			} else {
				location.href="ordersViewForm.do?id=${id}";
			}
		//-->			
		</script>
	</c:if>
	<c:if test="${result!=1}">
		<script type="text/javascript">
		//<!--
			alert("배달거절 실패. 잠시 후 다시 시도하세요");
		//-->			
		</script>	
		<meta http-equiv="refresh" content="0; url=ordersViewForm.do?id=${id}">		
	</c:if>	
</c:if>
