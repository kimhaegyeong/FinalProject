<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<c:if test="${sessionScope.id == null}">	
	<div>로그인이 필요합니다 <br></div>
</c:if>
<h4> 배달 현황 ${statusCount} </h4>
<c:if test="${sessionScope.id =! null}">		
	<table border="1">
		<tr>			
			<th style="width:5%"> 주문번호 </th>
			<th style="width:30%"> 목적지 </th>
			<th style="width:15%"> 배달업체 명 </th>
			<th style="width:5%"> 상품가격 </th>
			<th style="width:5%"> 수수료 </th>
			<th style="width:5%"> 배달대행 </th>
			<th style="width:8%"> 등록시간 </th>			
			<th style="width:8%"> 도착희망시간 </th>	
			<th style="width:5%"> 진행상황 </th>	
			<th style="width:5%"> 확인 </th>	
		</tr>		
		<c:if test="${statusCount == 0}">
			<tr>
				<th colspan="10">신청한 배달이 없습니다. 먼저 배달을 신청해주세요 </th>				
			</tr>
		</c:if>
		
		<c:if test="${statusCount != 0}">
			<c:forEach var="dto" items="${list}">	
				<c:if test="${dto.STATE==2 || dto.STATE==3 || dto.STATE==4 || dto.STATE==5}">			
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
							<c:if test="${dto.STATE==3}"> 배달 거절 </c:if>
							<c:if test="${dto.STATE==4}"> 배달 취소 </c:if>
							<c:if test="${dto.STATE==5}"> 배달 완료 </c:if>
						</td>
						<c:if test="${dto.STATE == 3}">
							<th>
								<input type="button" value="확인" onclick="">		
							</th>	
						</c:if>	
						<c:if test="${dto.STATE == 4}">
							<th>
								<input type="button" value="확인" onclick="">		
							</th>	
						</c:if>									
					</tr>
				</c:if>	
			</c:forEach>
		</c:if>
	</table>	
	
	<br>
	<hr size="4" color="#00FFFF" width="100%" align="Left">
	
	<h4> 배달 신청 목록 ${statusAllCount} </h4>
	<table border="1">
		<tr>			
			<th style="width:5%"> 주문번호 </th>
			<th style="width:30%"> 목적지 </th>
			<th style="width:15%"> 배달업체 명 </th>
			<th style="width:5%"> 상품가격 </th>
			<th style="width:5%"> 수수료 </th>
			<th style="width:5%"> 배달대행 </th>
			<th style="width:8%"> 등록시간 </th>			
			<th style="width:8%"> 도착희망시간 </th>	
			<th style="width:5%"> 진행상황 </th>	
			<th style="width:5%"> 취소 </th>		
		</tr>	
	<c:if test="${statusAllCount == 0}">
		<tr>
			<th colspan="10"> 신청한 배달이 없습니다. 배달 신청 후 다시 시도하세요</th>
		</tr>
	</c:if>
	<c:if test="${statusAllCount != 0}">		
			<c:forEach var="dto" items="${list}">
				<c:if test="${dto.STATE==1}">
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
							<c:if test="${dto.STATE==1}"> 신청 중 </c:if>
						</td>
						<c:if test="${dto.STATE == 1}">
							<th>
								<input type="button" value="취소" onclick="ordercancel(${dto.ONUM})">		
							</th>	
						</c:if>					
					</tr>
				</c:if>
			</c:forEach>			
		</c:if>
	</table>
</c:if>

<script type="text/javascript">
	//<!--
	function finsh(onum) {
		// 배달완료변경		
		var ok = confirm("배달상태를 완료로 변경하겠습니까?");		
		if(ok) {
			// 변경
			window.location.href="ordersConditionPro.do?id=${id}&num=1&onum="+onum;
		} else {
			// 취소
			alert("배달상태변경을 취소하셨습니다.");
		}
	}
	
	function ordercancel(onum) {
		// 배달신청취소
		var ok = confirm("해당 배달을 취소하겠습니까?");		
		if(ok) {
			// 확인
			window.location.href="ordersStatusPro.do?id=${id}&num=2&onum="+onum;
		} else {
			// 취소
			alert("배달삭제를 취소하셨습니다.");
		}
	}

	//-->
</script>