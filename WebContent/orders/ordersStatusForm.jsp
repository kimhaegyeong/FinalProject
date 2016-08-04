<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<style>
table {
	width: 1200px;
	margin : 0px 0px 0px 100px;
	border: 0px;
	border-collapse: collapse;
    border: 0;
}

th {
	width : 160px;
    background: #f7f7f7;
    text-align: center;
    padding: 10px 0px 10px 0px;
    letter-spacing: 1px;
    font-size: 14px;
    border-bottom: 1px solid #ddd;
}

tr:nth-child(odd) {
	background: #ffffec;
}

td {
	font-size: 13px;
	text-align: center;
	padding: 10px 5px;
	border-bottom: 1px solid #ddd;
}

h2, h4 {
	margin : 10px 10px 10px 100px;
}

div#scooter {
	margin : 10px 10px 10px 1150px;
}

</style>

<link rel="stylesheet" href="/FinalProject/css/remodal.css">
<link rel="stylesheet" href="/FinalProject/css/remodal-default-theme.css">

<!-- ajax -->
<script type="text/javascript" src="/FinalProject/js/request.js"></script>

<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<h2> 주문현황 뷰 페이지</h2>
<br><br>
<c:if test="${null eq sessionScope.id}">   
   <div>로그인이 필요합니다 <br></div>
</c:if>
<c:if test="${null ne sessionScope.id}">
	<body>
		<h4> 배달 신청 목록 ${statusAllCount} </h4>
		<table border="1">
			<tr>			
				<th style="width:4%"> No </th>
				<th style="width:30%"> 목적지 </th>
				<th style="width:15%"> 배달업체 명 </th>
				<th style="width:8%"> 상품가격 </th>
				<th style="width:5%"> 수수료 </th>
				<th style="width:5%"> 배달비 </th>
				<th style="width:8%"> 등록시간 </th>			
				<th style="width:8%"> 도착희망시간 </th>	
				<th style="width:5%"> 진행상황 </th>	
				<th style="width:5%"> 취소 </th>		
			</tr>	
		<c:if test="${statusAllCount == 0}">
			<tr>
				<th style='background:#FFF' colspan="10"> 신청한 배달이 없습니다. 배달 신청 후 다시 시도하세요</th>
			</tr>
		</c:if>
		<c:if test="${statusAllCount != 0}">				
				<c:forEach var="dto" items="${list}">
					<c:if test="${dto.STATE==1}">
						<tr>
							<td align="center">	${dto.ONUM} </td>
							<td align="center">	${dto.DESTINATION} </td>
							<c:if test="${dto.SHOP_NAME!=null}">
								<td align="center"> ${dto.SHOP_NAME} </td>
							</c:if>
							<c:if test="${dto.SHOP_NAME==null}">
								<td align="center"> 전체공개 배달신청입니다 </td>
							</c:if>						
							<td align="center"> ${dto.PRICE} 원 </td>
							<td align="center"> ${dto.FEES} 원 </td>
							<c:if test="${dto.DPRICE==null}">
								<td align="center"> - </td>
							</c:if>
							<c:if test="${dto.DPRICE!=null}">
								<td align="center"> ${dto.DPRICE} 원 </td>
							</c:if>
							<td align="center">
								<fmt:formatDate value= "${dto.REG_TIME}" pattern="MM/dd HH:mm"/>
							</td>					
							<td align="center">
								<fmt:formatDate value="${dto.LIMIT_TIME}" pattern="HH:mm"/>
							</td>
							<td align="center">	
								<c:if test="${dto.STATE==1}"> 신청 중 </c:if>
							</td>
							<c:if test="${dto.STATE == 1}">
								<td>
									<input type="button" value="취소" onclick="ordercancel(${dto.ONUM})">		
								</td>	
							</c:if>					
						</tr>
					</c:if>
				</c:forEach>			
			</c:if>
		</table>
				
		<br>
		<hr size="2" color="#ddd" width="99.8%" align="Left">
		<br>
		
		<h4> 배달 현황 ${statusCount} </h4>
		<table border="1">
			<tr>			
				<th style="width:4%"> No </th>
				<th style="width:30%"> 목적지 </th>
				<th style="width:15%"> 배달업체 명 </th>
				<th style="width:8%"> 상품가격 </th>
				<th style="width:5%"> 수수료 </th>
				<th style="width:5%"> 배달비 </th>
				<th style="width:8%"> 등록시간 </th>			
				<th style="width:8%"> 도착희망시간 </th>	
				<th style="width:6%"> 진행상황 </th>	
			</tr>		
			<c:if test="${statusCount == 0}">
				<tr>
					<th style='background:#FFF' colspan="10">신청한 배달이 없습니다. 먼저 배달을 신청해주세요 </th>				
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
								<fmt:formatDate value= "${dto.REG_TIME}" pattern="MM/dd HH:mm"/>
							</td>					
							<td align="center">
								<fmt:formatDate value="${dto.LIMIT_TIME}" pattern="HH:mm"/>
							</td>
							<td align="center">	
								<c:if test="${dto.STATE==2}"> 배달 중 </c:if>
								<c:if test="${dto.STATE==3}"> 
									 <input type="button" value="배달 거절" onclick="orderconfirm(${dto.ONUM})">
								</c:if>
								<c:if test="${dto.STATE==4}">
								 	<input type="button" value="배달 취소" onclick="orderconfirm(${dto.ONUM})">
								</c:if>
								<c:if test="${dto.STATE==5}"> 배달 완료 </c:if>
							</td>														
						</tr>
					</c:if>	
				</c:forEach>
			</c:if>
		</table>	
	</body>
</c:if>
<div>
	<jsp:include page="/default/footer.jsp"></jsp:include>
</div>

<script type="text/javascript">
	//<!--	
	// 수락
	function orderconfirm(onum) {
		var params = "id=" + ${id} + "&num=2&onum=" + onum;      		
		sendRequest( cancelResult, "ordersStatusPro.do", "POST", params );
	}	
	
	function ordercancel(onum) {
		var params = "id=" + ${id} + "&num=1&onum=" + onum;      		
		sendRequest( cancelResult, "ordersStatusPro.do", "POST", params );
	}
	
	function cancelResult() {
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
	
	// 키보드가 눌러졌을때 이벤트 실행
	document.onkeydown = function() { 
		if(event.keyCode==27) {
			// 키코드값 27(ESC키)가 눌러졌는지 확인
			location.href="ordersStatusForm.do?id="+${id};
			return false;	// ESC키 본래의 역할을 막음
		}
	}
	//-->
</script>

<!-- 모달 - 주문신청 후 -->
<div class="remodal" data-remodal-id="modal">
	<button data-remodal-action="close" class="remodal-close" onclick="location='ordersStatusForm.do'"></button>
	<h1></h1>
	<p></p>
	<br>
	<button data-remodal-action="cancel" class="remodal-cancel" onclick="location='ordersStatusForm.do'">
		주문현황 계속보기
	</button>
	<button data-remodal-action="confirm" class="remodal-confirm" onclick="location='insertOrderView.do'">
		주문신청 하러가기
	</button>
</div>

<!-- 모달 사용 -->
<script type="text/javascript" src="/FinalProject/js/remodal.min.js"></script>
