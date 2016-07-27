<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

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
	
	function del(onum) {
		// 배달삭제
		var ok = confirm("해당 배달을 삭제하겠습니까?");		
		if(ok) {
			// 삭제
			window.location.href="ordersConditionPro.do?id=${id}&num=2&onum="+onum;
		} else {
			// 취소
			alert("배달삭제를 취소하셨습니다.");
		}
	}

	//-->
</script>

<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>
	
<h2> 배달현황 뷰  ${count} </h2>

<c:if test="${id == null}">	
	<div>로그인이 필요합니다 <br></div>
</c:if>
<h4> 배달 수락 목록 </h4>
<c:if test="${id =! null}">		
	<table border="1">
		<tr>			
			<th style="width:5%"> ${str_onum} </th>
			<th style="width:20%"> ${str_sid} </th>
			<th style="width:10%"> ${str_price} </th>
			<th style="width:10%"> ${str_fees} </th>
			<th style="width:10%"> ${str_reg_Time} </th>			
			<th style="width:10%"> ${str_limit_Time} </th>	
			<th style="width:10%"> ${str_state} </th>	
			<th style="width:10%"> ${str_changeState} </th>	
		</tr>		
		<c:if test="${count == 0}">
			<tr>
				<td colspan="6" align="center">
					${msg_orders_x}
				</td>				
			</tr>
		</c:if>
		
		<c:if test="${count != 0}">		
			<c:forEach var="dto" items="${list}">
				<c:if test="${dto.STATE==2 || dto.STATE==5}">
					<tr>
						<td align="center">	${dto.ONUM} </td>
						<td align="center"> ${dto.SHOP_NAME} </td>
						<td align="center"> ${dto.PRICE} 원 </td>
						<td align="center"> ${dto.FEES} 원 </td>
						<td align="center">
							<fmt:formatDate value= "${dto.REG_TIME}" pattern="MM/dd HH:mm:ss"/>
						</td>					
						<td align="center">
							<fmt:formatDate value="${dto.LIMIT_TIME}" pattern="HH:mm:ss"/>
						</td>
						<td align="center">	
							<c:if test="${dto.STATE==5}"> 배달 완료 </c:if>
						</td>
						<!-- 수락한 주문인 경우 완료변경버튼 -->
						<c:if test="${dto.STATE == 2}">
							<th>
								<input type="button" value="완료" onclick="finsh(${dto.ONUM})">		
							</th>	
						</c:if>					
					</tr>	
				</c:if>
			</c:forEach>			
		</c:if>
	</table>
	
	<hr size="4" color="#00FFFF" width="100%" align="Left">
	
	<table border="1">
		<tr>			
			<th style="width:5%"> ${str_onum} </th>
			<th style="width:20%"> ${str_sid} </th>
			<th style="width:10%"> ${str_price} </th>
			<th style="width:10%"> ${str_fees} </th>
			<th style="width:10%"> ${str_reg_Time} </th>			
			<th style="width:10%"> ${str_limit_Time} </th>	
			<th style="width:10%"> ${str_state} </th>	
			<th style="width:10%"> ${str_changeState} </th>	
		</tr>	
	<c:if test="${count != 0}">		
			<c:forEach var="dto" items="${list}">
				<c:if test="${dto.state==3}">
					<tr>
						<td align="center">	${dto.onum} </td>
						<td align="center"> ${dto.sid} </td>
						<td align="center"> ${dto.price} 원 </td>
						<td align="center"> ${dto.fees} 원 </td>
						<td align="center">
							<fmt:formatDate value="${dto.reg_Time}"
								pattern="yyyy-MM-dd"/>
						</td>					
						<td align="center">
							<fmt:formatDate value="${dto.limit_Time}"							
								pattern="yyyy-MM-dd"/>
						</td>
						<td align="center">
							<c:if test="${dto.state==3}"> 거절 </c:if>
							<c:if test="${dto.state==4}"> 취소 </c:if>
						</td>
						<!-- 거절/취소한 주문인 경우 삭제버튼 -->
						<th>
							<input type="button" value="삭제" onclick="del(${dto.onum})">		
						</th>
					</tr>	
				</c:if>				
			</c:forEach>			
		</c:if>
	</table>	
</c:if>