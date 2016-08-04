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
div#page {
	text-align: center;
}

</style>

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
	
	// 키보드가 눌러졌을때 이벤트 실행
	document.onkeydown = function() { 
		if(event.keyCode==27) {
			// 키코드값 27(ESC키)가 눌러졌는지 확인
			location.href="ordersConditionForm.do?id="+${id}+"&pageNum="+${currentPage};
			return false;	// ESC키 본래의 역할을 막음
		}
	}
	//-->
</script>
<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<h2>배달 현황 뷰 페이지</h2>

<div id="scooter" style="font-size: 25px;"> 
	현재  <img src="/FinalProject/images/order/scooter.png" style="width:25px; height:25px;"/> ${bikeCount} 대
</div>

<h4> 배달 수락 목록 ${stateCount} </h4>

<table border="1">
	<tr>			
		<th style="width:4%"> No </th>
		<th style="width:30%"> 목적지 </th>
		<th style="width:15%"> 가게 명 </th>
		<th style="width:8%"> 상품가격 </th>
		<th style="width:5%"> 수수료 </th>
		<th style="width:5%"> 배달비 </th>
		<th style="width:8%"> 등록시간 </th>			
		<th style="width:8%"> 도착희망시간 </th>	
		<th style="width:5%"> 진행상황 </th>	
		<th style="width:5%"> 배달완료 </th>	
	</tr>		
	<c:if test="${stateCount == 0}">
		<tr>
			<th style='background:#FFF' colspan="10">수락한 배달이 없습니다. 먼저 신청된 배달을 수락해주세요 </th>				
		</tr>
	</c:if>
	<c:if test="${stateCount != 0}">		
		<c:forEach var="dto" items="${list}">
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
					<td align="center"> 배달 중 </td>
					<td>
						<input type="button" value="완료" onclick="finish(${dto.ONUM})">		
					</td>				
				</tr>
		</c:forEach>			
	</c:if>
</table>	

<br>
<hr size="2" color="#ddd" width="99.8%" align="Left">
<br>

<h4> 배달 완료 목록 ${completeCount} </h4>
<table border="1">
	<tr>			
		<th style="width:4%"> No </th>
		<th style="width:30%"> 목적지 </th>
		<th style="width:15%"> 가게 명 </th>
		<th style="width:8%"> 상품가격 </th>
		<th style="width:5%"> 수수료 </th>
		<th style="width:5%"> 배달비 </th>
		<th style="width:7%"> 등록시간 </th>			
		<th style="width:8%"> 도착희망시간 </th>	
		<th style="width:8%"> 진행상황 </th>
	</tr>	
	<c:if test="${completeCount == 0}">
		<tr>
			<th style='background:#FFF' colspan="8"> 완료된 배달이 없습니다. 배달현황에서 배달상태를 완료로 변경하세요 </th>
		</tr>
	</c:if>
	<c:if test="${completeCount != 0}">	
		<c:forEach var="dto" items="${allList}">
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
					<td align="center"> 배달 완료 </td>	
				</tr>			
		</c:forEach>			
	</c:if>
</table>
<br>
<div id="page">
	<c:if test="${completeCount > 0}">
		<c:if test="${startPage > pageBlock }">	
			<a href="ordersConditionForm.do?id=${id}&pageNum=1">[◀◀]</a>
			<a href="ordersConditionForm.do?id=${id}&pageNum=${startPage-pageBlock}">[◀]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${i == currentPage}">
				<span><b>[${i}]</b></span>
			</c:if>
			<c:if test="${i != currentPage}">
				<a href="ordersConditionForm.do?id=${id}&pageNum=${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${pageCount > endPage}">
			<a href="ordersConditionForm.do?id=${id}&pageNum=${startPage+pageBlock}">[▶]</a>
			<a href="ordersConditionForm.do?id=${id}&pageNum=${pageCount}">[▶▶]</a>
		</c:if>
	</c:if>
</div>

<div>
	<jsp:include page="/default/footer.jsp"></jsp:include>
</div>

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
	