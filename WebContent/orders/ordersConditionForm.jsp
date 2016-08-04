<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<link rel="stylesheet" href="/FinalProject/css/remodal.css">
<link rel="stylesheet" href="/FinalProject/css/remodal-default-theme.css">

<!-- ajax -->
<script type="text/javascript" src="/FinalProject/js/request.js"></script>
<script type="text/javascript">
	//<!--
	// 수락
	function finish(onum) {
		console.log("${id}");
		var params = "id=" + ${id} + "&onum=" + onum;      		
		sendRequest( finishResult, "ordersConditionPro.do", "POST", params );
	}	
	
	function finishResult() {
		console.log("${id}");
		var inst = $('[data-remodal-id=modal]').remodal();
		var result = document.getElementById( "result" );
		if( httpRequest.readyState == 4 ) {
			if( httpRequest.status == 200 ) {
				var msg = "";
				var res = eval( "(" + httpRequest.responseText + ")" ); 
				console.log(httpRequest.responseText);
				$('[data-remodal-id=modal] > h1').text(res.result.data[0]);
				$('[data-remodal-id=modal] > p').text(res.result.data[1]);
				inst.open();
				if (res.result.code == "fail") {
				}
				else if (res.result.code == "success") {
				}					
			} else {
				msg += "에러 발생";
			}		
		} else {
			msg += "통신중";	
		}
	}	
	//-->
</script>
<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<div align="right" style="font-size: 30px;"> 
	<img src="/FinalProject/images/order/scooter.png" style="width: 30px; height: 30px;"/> ${bikeCount} 대
</div>
		
<h4> 배달 수락 목록 ${stateCount} </h4>

<table border="1">
	<tr>			
		<th style="width:5%"> 주문번호 </th>
		<th style="width:30%"> 목적지 </th>
		<th style="width:15%"> 가게 명 </th>
		<th style="width:5%"> 상품가격 </th>
		<th style="width:5%"> 수수료 </th>
		<th style="width:5%"> 배달대행 </th>
		<th style="width:8%"> 등록시간 </th>			
		<th style="width:8%"> 도착희망시간 </th>	
		<th style="width:5%"> 진행상황 </th>	
		<th style="width:5%"> 배달완료 </th>	
	</tr>		
	<c:if test="${stateCount == 0}">
		<tr>
			<th colspan="10">수락한 배달이 없습니다. 먼저 신청된 배달을 수락해주세요 </th>				
		</tr>
	</c:if>
	<c:if test="${stateCount != 0}">		
		<c:forEach var="dto" items="${list}">
			<c:if test="${dto.STATE==2}">
				<tr>
					<td align="center">	${dto.ONUM} </td>
					<td align="center">	${dto.DESTINATION} </td>
					<td align="center"> ${dto.SHOP_NAME} </td>
					<td align="center"> ${dto.PRICE} 원 </td>
					<td align="center"> ${dto.FEES} 원 </td>
					<td align="center"> ${dto.DPRICE} 원 </td>
					<td align="center">
						<fmt:formatDate value= "${dto.REG_TIME}" pattern="MM/dd HH:mm:ss"/>
					</td>					
					<td align="center">
						<fmt:formatDate value="${dto.LIMIT_TIME}" pattern="MM/dd HH:mm:ss"/>
					</td>
					<td align="center">	
						<c:if test="${dto.STATE==2}"> 배달 중 </c:if>
					</td>
					<th>
						<input type="button" value="완료" onclick="finish(${dto.ONUM})">		
					</th>				
				</tr>	
			</c:if>
		</c:forEach>			
	</c:if>
</table>	

	<br>	
	<hr size="4" color="#00FFFF" width="100%" align="Left">
	
	<h4> 배달 완료 목록 ${completeCount} </h4>
	<table border="1">
		<tr>			
			<th style="width:5%"> 주문번호 </th>
			<th style="width:30%"> 목적지 </th>
			<th style="width:15%"> 가게 명 </th>
			<th style="width:5%"> 상품가격 </th>
			<th style="width:5%"> 수수료 </th>
			<th style="width:8%"> 등록시간 </th>			
			<th style="width:8%"> 도착희망시간 </th>	
			<th style="width:8%"> 진행상황 </th>
		</tr>	
		<c:if test="${completeCount == 0}">
			<tr>
				<th colspan="8"> 완료된 배달이 없습니다. 배달현황에서 배달상태를 완료로 변경하세요 </th>
			</tr>
		</c:if>
		<c:if test="${completeCount != 0}">	
			<c:forEach var="dto" items="${list}">
				<c:if test="${dto.STATE==5}">
					<tr>
						<td align="center">	${dto.ONUM} </td>
						<td align="center">	${dto.DESTINATION} </td>
						<td align="center"> ${dto.SHOP_NAME} </td>
						<td align="center"> ${dto.PRICE} 원 </td>
						<td align="center"> ${dto.FEES} 원 </td>
						<td align="center">
							<fmt:formatDate value= "${dto.REG_TIME}" pattern="MM/dd HH:mm:ss"/>
						</td>					
						<td align="center">
							<fmt:formatDate value="${dto.LIMIT_TIME}" pattern="MM/dd HH:mm:ss"/>
						</td>
						<td align="center"> 배달 완료 </td>	
					</tr>	
				</c:if>				
			</c:forEach>			
		</c:if>
	</table>

<!-- 모달 - 배달수락 후 -->
<div class="remodal" data-remodal-id="modal">
	<button data-remodal-action="close" class="remodal-close"
			onclick="location='ordersConditionForm.do?id=${id}'"></button>
<h1></h1>
	<p></p>
	<br>
	<button data-remodal-action="cancel" class="remodal-cancel" 
			onclick="location='ordersConditionForm.do?id=${id}'">배달현황 계속보기</button>
	<button data-remodal-action="confirm" class="remodal-confirm"
			onclick="location='ordersViewForm.do?id=${id}'">배달신청 보러가기</button>
</div>

<!-- 모달 사용 -->
<script type="text/javascript" src="/FinalProject/js/remodal.min.js">
</script>
	