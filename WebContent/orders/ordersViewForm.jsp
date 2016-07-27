<%@page import="java.text.SimpleDateFormat"%>
<%@page import="orders.OrdersDataBean"%>
<%@page import="orders.OrdersDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<!-- ajax -->
<script type="text/javascript" src="/FinalProject/js/request.js"></script>

<script type="text/javascript">
	//<!--	
	// **** 선택 배달신청 ****//
	function loadOrders() {		
       	var params = "id=" + ${id};       	
		sendRequest( fromServer, "ordersList.do", "POST", params );
    }
    
	function fromServer() {
		var result = document.getElementById( "result" );
		if( httpRequest.readyState == 4 ) {
			if( httpRequest.status == 200 ) {
				var msg = "";
				var res = eval( "(" + httpRequest.responseText + ")" );
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
				"<h4> 배달 신청 목록 &nbsp" + ordersList.length +"</h4>"
				+ "<table border='1'>"
				+ 	"<tbody id='list'>"
				+		"<tr>"
				+			"<th style='width:5%'>주문번호</th>"	
				+			"<th style='width:30%'>목적지</th>"
				+			"<th style='width:15%'>가게명</th>"
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
				+	"<td align='center'>" + ordersList[i].sid + "</td>"
				+	"<td align='center'>" + ordersList[i].price + "</td>"
				+	"<td align='center'>" + ordersList[i].fees+ "</td>"
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
		loadOrdersAll();
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
				"<h4> 전체 배달신청 &nbsp" + ordersAllList.length +"</h4>"
				+ "<table border='1'>"
				+ 	"<tbody id='allList'>"
				+		"<tr>"
				+			"<th style='width:5%'>주문번호</th>"	
				+			"<th style='width:30%'>목적지</th>"
				+			"<th style='width:15%'>가게명</th>"
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
				+	"<td align='center'>" + ordersAllList[i].sid + "</td>"
				+	"<td align='center'>" + ordersAllList[i].price + "</td>"
				+	"<td align='center'>" + ordersAllList[i].fees+ "</td>"
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
		var ok;		
		ok = confirm("주문을 수락하시겠습니까?");		
		if(ok) {
			// 수락
			window.location.href="ordersViewPro.do?id=${id}&num=1&onum="+onum;
		} else {
			// 거절
			alert("주문수락을 취소하셨습니다.");
		}
	}
	
	// 거절
	function disagree(onum) {
		var ok;
		ok = confirm("주문을 거절하시겠습니까?");
		if(ok) {
			// 수락
			window.location.href="ordersViewPro.do?id=${id}&num=2&onum="+onum;
		} else {
			// 거절
			alert("주문거절을 취소하셨습니다.");
		}
	}	
	//-->
</script>

<div>
	<jsp:include page="/default/top.jsp"></jsp:include>
</div>

<div>
<input type="button" value="목록 새로고침" onclick="loadOrders()">
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
		<br>		
		<!-- 전체 배달 신청 -->
		<div id="orderAllList">
			<div id="orderAllTitle"></div>
		</div>
	</body>
</c:if>