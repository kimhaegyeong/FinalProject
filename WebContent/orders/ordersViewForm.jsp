<%@page import="java.text.SimpleDateFormat"%>
<%@page import="orders.OrdersDataBean"%>
<%@page import="orders.OrdersDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="setting.jsp" %>

<link rel="stylesheet" href="/FinalProject/css/remodal.css">
<link rel="stylesheet" href="/FinalProject/css/remodal-default-theme.css">

<!-- ajax -->
<script type="text/javascript" src="/FinalProject/js/request.js"></script>


<script type="text/javascript">
	//<!--		
	// **** 선택 배달신청 ****//			
	function loadOrders() {
       	var params = "id=" + ${id};       	
		sendRequest( fromServer, "ordersList.do", "POST", params );
		setTimeout("loadOrders()", 60000);		
    }
    
	function fromServer() {
		var result = document.getElementById( "result" );
		if( httpRequest.readyState == 4 ) {
			if( httpRequest.status == 200 ) {
				var msg = "";
				var res = eval( "(" + httpRequest.responseText + ")" );
				loadOrdersAll();
					// 선택 배달신청
					if (res.result.code == "not_result") {
						// 신청목록 X
						$("#orderList").innerHTML = res.result.data;
					} else if (res.result.code == "success") {		
						// 신청목록 O						
						printOrdersList(res.result.data);						
					}				
			} else {
				msg += "에러 발생";
			}		
		} else {
			msg += "통신중";	
		}
	}	
	
	// 선택 배달신청
	function printOrdersList(ordersList) {
		if (!$.isEmptyObject($("#orderTitle"))) {
			$("#orderTitle").empty();
		} 
		$("#orderTitle").append(				
				"<h4> 배달 신청 &nbsp" + ordersList.length +"</h4>"
				+ "<table border='1'>"
				+ 	"<tbody id='list'>"
				+		"<tr>"
				+			"<th style='width:5%'>주문번호</th>"	
				+			"<th style='width:30%'>목적지</th>"
				+			"<th style='width:15%'>가게 명</th>"
				+			"<th style='width:7%'>상품가격</th>"
				+			"<th style='width:7%'>수수료</th>"
				+			"<th style='width:8%'>등록시간</th>"
				+			"<th style='width:8%'>도착희망시간</th>"
				+			"<th style='width:8%'>응답제한시간</th>"
				+			"<th style='width:8%'>수락/거절</th>"
				+		"</tr>"
				+ 	"<tbody>"
				+"</table>"
		);
		
		for (var i in ordersList) {
			$("#list").append(
				"<tr>"
				+	"<td align='center'>" + ordersList[i].onum + "</td>"
				+	"<td align='center'>" + ordersList[i].destination + "</td>"
				+	"<td align='center'>" + ordersList[i].shop_name + "</td>"
				+	"<td align='center'>" + ordersList[i].price + " 원</td>"
				+	"<td align='center'>" + ordersList[i].fees+ " 원</td>"
				+	"<td align='center'>" + ordersList[i].reg_Time+ "</td>"
				+	"<td align='center'>" + ordersList[i].limit_Time+ "</td>"
				+	"<td align='center'>" + ordersList[i].res_Limit_Time+ "</td>"
				+ 	"<td align='center'>"
				+		"<input type='button' value='수락' onclick='agree("+ordersList[i].onum+")'>"
				+		"<input type='button' value='거절' onclick='disagree("+ordersList[i].onum+")'>"
				+   "</td>"
				+ "</tr>"
			);			
		}
	}
	
	// **** 전체 배달신청 ****//
	function loadOrdersAll() {
       	var params = null;
		sendRequest( loadResult, "ordersAllList.do", "POST", params );
    }
    
	function loadResult() {
		var result = document.getElementById( "result" );
		if( httpRequest.readyState == 4 ) {
			if( httpRequest.status == 200 ) {
				var msg = "";
				var res = eval( "(" + httpRequest.responseText + ")" );
				// 전체 배달신청
				if (res.result.code == "not_result") {
					// 신청목록 X
					$("#orderAllList").innerHTML = res.result.data;
				}
				else if (res.result.code == "success") {		
					// 신청목록 O
					printOrdersAllList(res.result.data);
				}						
			} else {
				msg += "에러 발생";
			}		
		} else {
			msg += "통신중";	
		}
	}		
	
	// 전체 배달신청
	function printOrdersAllList(ordersAllList) {
		if (!$.isEmptyObject($("#orderAllTitle"))) {
			$("#orderAllTitle").empty();
		} 
		$("#orderAllTitle").append(
				"<h4> 전체공개 배달 신청 &nbsp" + ordersAllList.length +"</h4>"
				+ "<table border='1'>"
				+ 	"<tbody id='allList'>"
				+		"<tr>"
				+			"<th style='width:5%'>주문번호</th>"	
				+			"<th style='width:30%'>목적지</th>"
				+			"<th style='width:15%'>가게 명</th>"
				+			"<th style='width:7%'>상품가격</th>"
				+			"<th style='width:7%'>수수료</th>"
				+			"<th style='width:8%'>등록시간</th>"
				+			"<th style='width:8%'>도착희망시간</th>"
				+			"<th style='width:8%'>응답제한시간</th>"
				+			"<th style='width:8%'>수락</th>"
				+		"</tr>"
				+ 	"<tbody>"
				+"</table>"
		);
		
		for (var i in ordersAllList) {
			$("#allList").append(
				"<tr>"
				+	"<td align='center'>" + ordersAllList[i].onum + "</td>"
				+	"<td align='center'>" + ordersAllList[i].destination + "</td>"
				+	"<td align='center'>" + ordersAllList[i].shop_name + "</td>"
				+	"<td align='center'>" + ordersAllList[i].price + " 원</td>"
				+	"<td align='center'>" + ordersAllList[i].fees+ " 원</td>"
				+	"<td align='center'>" + ordersAllList[i].reg_Time+ "</td>"
				+	"<td align='center'>" + ordersAllList[i].limit_Time+ "</td>"
				+	"<td align='center'>" + ordersAllList[i].res_Limit_Time+ "</td>"
				+ 	"<td align='center'>"
				+		"<input type='button' value='수락' onclick='agree("+ordersAllList[i].onum+")'>"
				+   "</td>"
				+ "</tr>"
			);			
		}
	}	
		
	// 수락
	function agree(onum) {			
		var params = "id=" + ${id} + "&num=1&onum=" + onum;      		
		sendRequest( agreeResult, "ordersViewPro.do", "POST", params );
	}	
	
	function agreeResult() {
		var inst = $('[data-remodal-id=modal]').remodal();
		var result = document.getElementById( "result" );
		if( httpRequest.readyState == 4 ) {
			if( httpRequest.status == 200 ) {
				var msg = "";
				var res = eval( "(" + httpRequest.responseText + ")" ); 
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
	
	// 거절
	function disagree(onum) {
		var params = "id=" + ${id} + "&num=2&onum=" + onum;      		
		sendRequest( disagreeResult, "ordersViewPro.do", "POST", params );		
	}	
	
	function disagreeResult() {
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

<!-- 모달 - 배달수락 후 -->
<div class="remodal" data-remodal-id="modal">
	<button data-remodal-action="close" class="remodal-close"
			onclick="location='ordersViewForm.do?id=${id}'"></button>
<h1></h1>
	<p></p>
	<br>
	<button data-remodal-action="cancel" class="remodal-cancel" 
			onclick="location='ordersViewForm.do?id=${id}'">배달신청 계속보기</button>
	<button data-remodal-action="confirm" class="remodal-confirm"
			onclick="location='ordersConditionForm.do?id=${id}'">배달현황 보러가기</button>
</div>

<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<div align="right" style="font-size: 30px;"> 
	<img src="/FinalProject/images/order/scooter.png" style="width: 30px; height: 30px;"/> ${bikeCount} 대
</div>
<c:if test="${id == null}">	
	<div>로그인이 필요합니다 <br></div>
</c:if>

<c:if test="${id =! null}">
	<body id="result" onload="loadOrders()">
		<!-- 선택 배달 신청 -->
		<div id="orderList">
			<div id="orderTitle"></div>
		</div>		
		<br>
		<hr size="4" color="#00FFFF" width="100%" align="Left">
		<div align="right" style="font-size: 30px;"> 
			<img src="/FinalProject/images/order/scooter.png" style="width: 30px; height: 30px;"/> ${bikeCount} 대
		</div>		
		<!-- 전체 배달 신청 -->
		<div id="orderAllList">
			<div id="orderAllTitle"></div>
		</div>
	</body>
</c:if>

<!-- 모달 사용 -->
<script type="text/javascript" src="/FinalProject/js/remodal.min.js">
</script>
	



