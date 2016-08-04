<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/FinalProject/css/remodal.css">
<link rel="stylesheet"
	href="/FinalProject/css/remodal-default-theme.css">
<style>
html, body {
	width: 100% !important;
	height: 100% !important;
	font-size: 14px;
	line-height: 25px;
}

#container {
	position: absolute;
	width: 100%;
	height: calc(100% - 46px);
	overflow-y: hidden;
}

.extend>#left-side {
	position: absolute;
	top: 0;
	left: 0;
	width: 60%;
	height: 100%;
	background: #00529a;
}

.extend>#left-size>#map-menu {
	height: 35px;
}

.extend>#left-side>#map {
	width: 100%;
	height: calc(100% - 35px);
}

.extend>#right-side {
	position: absolute;
	top: 0;
	left: 60%;
	width: 40%;
	height: 100%;
}

.extend>#right-side>#input-order {
	background: #fbfbfb;
	width: 100%;
	height: 50%;
	overflow: scroll;
	overflow-x: hidden;
}

.extend>#right-side>#delivery-list {
	top: 50%;
	width: 100%;
	height: 50%;
	overflow: scroll;
	overflow-x: hidden;
	border-top: 2px solid #444;
}

.shink>#left-side {
	width: 35px;
	height: 100%;
	background: #00529a;
}

.shink>#right-side {
	position: absolute;
	top: 0;
	left: 35px;
	width: calc(100% - 35px);
	height: 100%;
}

.shink>#right-side>#input-order {
	width: 50%;
	height: 100%;
	background: #fbfbfb;
	overflow: scroll;
	overflow-x: hidden;
}

.shink>#right-side>#delivery-list {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: scroll;
	overflow-x: hidden;
}

table {
	width: 100%;
	border: 0px;
	border-collapse: collapse;
    border: 0;
}

#input-order th {
	width : 160px;
    background: #f7f7f7;
    text-align: left;
    padding: 10px 0px 10px 15px;
    letter-spacing: 1px;
    font-size: 14px;
    border-bottom: 1px solid #ddd;
}
#input-order td {
	padding: 0 10px;
	border-bottom: 1px solid #ddd;
}
#input-order td input {
	width: 300px;
	padding: 5px;
	letter-spacing: -1px;
}
#input-order td input[type=radio] {
	width:18px!important;
	height:18px!important;
	padding: 5px;
}
#input-order #btnOrder {
	background: #ffaf69; border: 0; border-radius: 3px; padding: 10px; color: #fff; font-weight: bold; font-size:15px; margin-left: 25%;
}
#input-order #btnOrder:hover {
	background: #ff871e;
}
#delivery-list th {
    background: #f7f7f7;
    padding: 10px 5px;
    letter-spacing: 1px;
    font-size: 14px;
    border-bottom: 1px solid #ddd;
}
#delivery-list tr:nth-child(odd) {
	background: #ffffec;
}
#delivery-list td {
	font-size: 13px;
	padding: 10px 5px;
	border-bottom: 1px solid #ddd;
}
#delivery-list td:nth-child(6)  {
	width: 10%;
}
#delivery-list td input {
	padding: 5px;
	letter-spacing: -1px;
}
#delivery-list .btn-dels {
	border: 1px solid #bbb;
	border-radius: 3px;
}
#delivery-list .btn-dels:hover {
	background: #aaa;
}
#delivery-list #btn-search {
	width: 20px;
    height: 20px;
    padding: 7px;
    background-image: url(/FinalProject/images/order/search.png);
    background-repeat: no-repeat;
    background-size: 20px;
    background-position: center;
}
#delivery-list #btn-search.chg-active {
	width: 20px;
	height: 20px;
    padding: 3.5px;
    margin: 4px 5px 0 0;
    background: white;
    border-radius: 0 5px 5px 0;
    background-image: url(/FinalProject/images/order/search-active.png);
    background-repeat: no-repeat;
    background-size: 20px;
    background-position: center;
}
.inline-block-style {
	display: inline-block;
}

#infoWindow span {
	color: #666;
	letter-spacing:-1.5px;
}

#infoWindow .btn-dels {
	position: relative;
	top: 15px;
	left: 45px;
	background: #ffaf69;
	border: 0;
	border-radius: 3px;
	padding: 7px 20px;
	color: #fff;
	font-weight: bold;
	
}
</style>

<jsp:include page="/default/top.jsp"></jsp:include>

<div id="container" class="extend">
	<div id="left-side">
		<div id="map-menu">
			<img id="arrow" src="/FinalProject/images/order/left-arrow.png"
				style="width: 25px; padding: 4px;">
		</div>
		<div id="map"></div>
	</div>
	<div id="right-side">
		<div id="input-order">
			<div style="padding: 8px; background: #0064bd; color: white; font-weight: 900; letter-spacing: -1px">
				<span>주문서 작성</span>
			</div>
			<div style="padding: 10px">
				<form name="orderForm">
					<table style="margin: 10px 0;">
						<tr>
							<td colspan="2" style="padding: 0 0 10px 0">
								<div style="width: 100%; border-bottom: 2px solid #bbb">
									<span style="color: #333; line-height: 20px; font-size: 15px; font-weight: 900; letter-spacing: -2px;">주문자 정보</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>가게명
							</th>
							<td><input type="text" name="stoShopName"
								value="${stoShopName}" disabled="disabled"></td>
						</tr>
						<tr>
							<th>주소
							</th>
							<td><input type="text" name="stoAdd" value="${stoAdd}"
								disabled="disabled"></td>
						</tr>
						<tr>
							<th>목적지 주소
							</th>
							<td><input type="text" name="destination"></td>
						</tr>
						<tr>
							<th>상품가격
							</th>
							<td><input type="text" name="stoPrice" style="width: 275px"> 원</td>
						</tr>
						<tr>
							<th>수수료
							</th>
							<td><input type="text" name="fees" value="${fees}"
								readonly="readonly" style="width: 275px"> 원</td>
						</tr>
						<tr>
							<th>도착제한시간
							</th>
							<td><input type="radio" name="limit_time" value="30"
								checked="checked">30분 <input type="radio"
								name="limit_time" value="40">40분 <input type="radio"
								name="limit_time" value="50">50분 <input type="radio"
								name="limit_time" value="60">60분</td>
						</tr>
						<tr>
							<th>일정시간 뒤 전체공개
							</th>
							<td><input type="radio" name="res_limit_time" value="y"
								checked="checked">예 <input type="radio"
								name="res_limit_time" value="n">아니오</td>
						</tr>
						<tr>
							<th>전체공개
							</th>
							<td><input type="radio" name="opencheck" value="y"
								checked="checked">예 <input type="radio" name="opencheck"
								value="n" disabled="true">아니오</td>
						</tr>
						<tr colspan="2">
							<tr>
								<td colspan="2" style="padding: 20px 0 10px 0">
									<div style="width: 100%; border-bottom: 2px solid #bbb">
										<span style="color: #333; line-height: 20px; font-size: 15px; font-weight: 900; letter-spacing: -2px;">배달업체 정보</span>
									</div>
								</td>
								<input type="hidden" name="did">
							</td>
							</tr>
						<tr>
							<th>가게명
							</th>
							<td><input type="text" name="delShopname" disabled="disabled"></td>
						</tr>
						<tr>
							<th>주소
							</th>
							<td><input type="text" name="delAddress" disabled="disabled"></td>
						</tr>
						<tr>
							<th>전화번호
							</th>
							<td><input type="text" name="delTel" disabled="disabled"></td>
						</tr>
						<tr>
							<th>핸드폰번호
							</th>
							<td><input type="text" name="delPhone" disabled="disabled"></td>
						</tr>
						<tr>
							<th>배달비
							</th>
							<td><input type="text" name="delDPrice" readonly="readonly" style="width: 275px"> 원</td>
						</tr>
						<tr>
							<td colspan="2" style="padding: 30px 0 10px 0"><input id="btnOrder" type="button"
								value="주문 신청"></td>
						</tr> 
					</table>
				</form>
			</div>
		</div>
		<div id="delivery-list">
			<div style="padding: 8px; background: #0087ff;">
				<span style="color: white; font-weight: bold; letter-spacing: -1.5px;">검색 결과 </span>
				<div id="search-section" style="float: right; margin-top:-3px; height: 30px;">
					<div class="inline-block-style">
						<form name="findDelForm" onSubmit="return false">
							<input id="input-search" type="text" name="delName" style="padding: 6px 0px 6px 6px;border-radius: 5px 0 0 5px;border: 0;position: relative;top: -9px;left: 5px;display:none;">
						</form>
					</div>
					<div id="btn-search" class="inline-block-style"></div>
				</div>
			</div>
			<div id="delivery-items"></div>
		</div>
	</div>
</div>

<!-- 모달 - 주문신청 후 -->
<div class="remodal" data-remodal-id="modal">
	<button data-remodal-action="close" class="remodal-close"></button>
	<h1></h1>
	<p></p>
	<br>
	<button data-remodal-action="cancel" class="remodal-cancel">주문
		현황보기</button>
	<button data-remodal-action="confirm" class="remodal-confirm">주문
		계속하기</button>
</div>

<!-- ajax -->
<script type="text/javascript" src="/FinalProject/js/request.js"></script>

<!-- 다음 지도 api -->
<script type="text/javascript"
	src="http://apis.daum.net/maps/maps3.js?apikey=4887e63e564542f5f9f7086d2c988895"></script>

<!-- 모달 사용 -->
<script type="text/javascript" src="/FinalProject/js/remodal.min.js"></script>

<script>
	// 모달 초기화
	var inst = $('[data-remodal-id=modal]').remodal();

	var toggleCnt = null;
	
	$(document).ready(function(){
		toggleCnt = 0;
		orderView.loadMap(${lat}, ${lng});
	});

	/* 화면 변경 버튼 */
	$("#arrow").on("click", function() {
		toggleCnt++;
		
		if (toggleCnt % 2 == 1) {
			$("#arrow").attr("src", "/FinalProject/images/order/right-arrow.png");	
			$("#container").removeClass("extend");
			$("#container").addClass("shink");
		} else {
			$("#arrow").attr("src", "/FinalProject/images/order/left-arrow.png");	
			$("#container").removeClass("shink");
			$("#container").addClass("extend");
		}
	});
	
	$("#btnOrder").on("click", function() {
		var regExp = /^[0-9]+$/;
		
		if (orderForm.destination.value == "") {
			alert("목적지를 입력하세요");
			return false;
		} else if (orderForm.stoPrice.value == "" || !regExp.test(orderForm.stoPrice.value)) {
			alert("상품가격을 다시 입력하세요");
			return false;
		} else if (orderView.selectedDid != null && orderView.deliveryList[orderView.selectedDid].bike == 0) {
			alert("배달할 수 있는 오토바이가 없습니다.");
			return false;
		}
		
		var params = "stoPrice=" + orderForm.stoPrice.value
			+ "&destination=" + orderForm.destination.value
			+ "&fees=" + orderForm.fees.value
			+ "&limit_time=" + orderForm.limit_time.value
			+ "&res_limit_time=" + orderForm.res_limit_time.value
			+ "&opencheck=" + orderForm.opencheck.value
			+ "&did=" + orderForm.did.value
			+ "&delDPrice=" + orderForm.delDPrice.value;

		sendRequest( ajax.orderResult, "insertOrder.do", "POST", params );
	});
	
	$("#btn-search").on("click", function() {
		if ($("#input-search").css("display") == "none") {
			$("#input-search").show();
			$("#btn-search").addClass("chg-active");
		} else {
			var params = "delName=" + encodeURI(findDelForm.delName.value);
			sendRequest( ajax.fromServer, "findDelivery.do", "POST", params );
		}
	});
	
	$("#input-search").on("keypress", function(e) {
		console.log("kkk");
		if (e.keyCode == 13) {		// 엔터키 눌렀을 때
			e.preventDefault();

			var params = "delName=" + encodeURI(findDelForm.delName.value);
			sendRequest( ajax.fromServer, "findDelivery.do", "POST", params );

			return false;
		}
	});
	
	$("input[name='opencheck']").on("click", function() {
		if ($("input[name='opencheck']:checked").val() == "y") {
			$("input[name='delShopname']").val("");
			$("input[name='delAddress']").val("");
			$("input[name='delTel']").val("");
			$("input[name='delPhone']").val("");
			$("input[name='delDPrice']").val("");
		}
	});
	
	var orderView = {
		map : null, 				// 지도그릴 공간
		mapLevel : 3, 				// 맵의 레벨
		infowindow : null,        	// 인포 윈도우 창
		deliveryList : null,		// 배달업체 목록
		selectedDid : null,
		loadMap : function (lat, lng) {
			var container = document.getElementById("map"); //지도를 담을 영역의 DOM 레퍼런스
	        var options = { //지도를 생성할 때 필요한 기본 옵션
	        	center: new daum.maps.LatLng(lat, lng), //지도의 중심좌표.
	        	level: this.mapLevel //지도의 레벨(확대, 축소 정도)
	        };
	        
	        map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
	        // 영역의 남서쪽 좌표를 얻어옵니다 d
	        var swLatLng = map.getBounds().getSouthWest(); 
	        
	        // 영역의 북동쪽 좌표를 얻어옵니다 
	        var neLatLng = map.getBounds().getNorthEast(); 
	        // 배달업체 정보 요청
	       	var params = "swLat=" + swLatLng.cb
	       		+ "&swLng=" + swLatLng.bb
	       		+ "&neLat=" + neLatLng.cb
	       		+ "&neLnt=" + neLatLng.bb;
	       	sendRequest( ajax.fromServer, "inRangeDelivery.do", "POST", params );
	        
	        this.addEvent.mouseDrag();
	        this.addEvent.zoomInOut();
		},
		printDeliveryList : function (deliveryList) {				// 주문목록 출력
			if (!$.isEmptyObject($("#delivery-items"))) {
				$("#delivery-items").empty();
			} 
			orderView.deliveryList = deliveryList;
					
			$("#delivery-items").append(
					"<table border>"
					+ 	"<tbody id='del-list-tb'>"
					+ 		"<tr>"
					+			"<th></th>"
					+			"<th>가게명</th>"
					+			"<th>주소</th>"
					+			"<th>전화번호</th>"
					+			"<th>핸드폰번호</th>"
					+			"<th>배달비용</th>"
					+			"<th></th>"
					+		"</tr>"
					+ 	"<tbody>"
					+ "</table>"
			);
			
			for (var i in deliveryList) {
				$("#del-list-tb").append(
					"<tr id='del-" + i + "'>"
					+	"<td><img style='width: 30px' src='" 
						+ (deliveryList[i].imgpath == ""? "/FinalProject/images/order/scooter.png" : deliveryList[i].imgpath)
						+ "'></td>"
					+	"<td>" + orderView.deliveryList[i].shopName + "</td>"
					+	"<td>" + orderView.deliveryList[i].address + "</td>"
					+	"<td>" + orderView.deliveryList[i].tel + "</td>"
					+	"<td>" + orderView.deliveryList[i].phone+ "</td>"
					+	"<td>" + orderView.deliveryList[i].dprice+ "원</td>"
					+ 	"<td><input id='btn-del-" + i +"' class='btn-dels' type='button' value='선택'></td>"
					+ "</tr>"
				);
				
				this.makeMarker(i);
			}
			
			// 모든 .btn-dels가 생성된 뒤에 클릭이벤트를 설정
			$(".btn-dels").on("click", function() {
				var index = $(this).attr("id").split("-")[2];
				orderView.selectedDid = index;
				orderView.inputDelData(index);
			});
		},
		makeMarker : function (index) {
	         // 마커 이미지의 이미지 주소입니다
	         var imageSrc = null;
	         if (this.deliveryList[index].bike == 0) {
	        	 imageSrc = "/FinalProject/images/order/red.png"; 
	         } else if (this.deliveryList[index].bike == 1) {
	        	 imageSrc = "/FinalProject/images/order/yellow.png"; 
	         } else {
	        	 imageSrc = "/FinalProject/images/order/green.png"; 
	         }
	         
	         // 마커 이미지의 이미지 크기 입니다
	         var imageSize = new daum.maps.Size(35, 35);     
	         
	         // 마커 이미지를 생성합니다    
	         var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
	             
	         // 마커를 생성합니다
	         var marker = new daum.maps.Marker({
	             map: map, // 마커를 표시할 지도
	             position: new daum.maps.LatLng(this.deliveryList[index].lat, this.deliveryList[index].lng), // 마커를 표시할 위치
	             title : this.deliveryList[index].shop_name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	             image : markerImage, // 마커 이미지
	         });
	         
	         this.addEvent.mouseClick(marker, index);
	     },
	     addEvent : {
             mouseDrag: function() {
            	if ($("#input-search").css("display") != "none") {
            		$("#input-search").val("");
         			$("#input-search").hide();
         			$("#btn-search").removeClass("chg-active");
         		}
            	 
                 // 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
                 daum.maps.event.addListener(map, 'dragend', function() {        
                     
                     // 지도 중심좌표를 얻어옵니다 
                     var latlng = map.getCenter(); 
                     /*var message = '변경된 지도 중심좌표는 ' + latlng.getLat() + ' 이고, ';
                      message += '경도는 ' + latlng.getLng() + ' 입니다';
                     console.log(message);*/
                     orderView.loadMap(latlng.getLat(), latlng.getLng());
                 });
             },
             zoomInOut: function () {
            	if ($("#input-search").css("display") != "none") {
            		$("#input-search").val("");
          			$("#input-search").hide();
          			$("#btn-search").removeClass("chg-active");
          		}
            	 
                 // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
                 var zoomControl = new daum.maps.ZoomControl();
                 map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
                 
                 // 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
                 daum.maps.event.addListener(map, 'zoom_changed', function() {        
                      // 지도의 현재 레벨을 얻어옵니다
                     orderView.mapLevel = map.getLevel();
                    
                     // 지도 중심좌표를 얻어옵니다 
                     var latlng = map.getCenter(); 
                     orderView.loadMap(latlng.getLat(), latlng.getLng());
                 });
             },
             mouseClick: function(marker, index) {
                 // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
               var iwContent = '<div id="infoWindow" style="margin-top:-20px; padding: 10px 10px 30px 10px;">'
	                 	+ 		'<p style="font-weight:bold; letter-spacing: -1px; margin-bottom: 5px">' + orderView.deliveryList[index].shopName + '</p>'
	                 	+ 		'<span><b>주소 : </b>' + orderView.deliveryList[index].address + '</span><br>'
	                 	+ 		'<span><b>전화번호: </b>' + orderView.deliveryList[index].tel + '</span><br>'
	                 	+ 		'<span><b>핸드폰번호 : </b>' + orderView.deliveryList[index].phone + '</span><br>'
	                 	+ 		'<span><b>배달비용 : </b>' + orderView.deliveryList[index].dprice + '원</span><br>'
	                 	+		'<input class="btn-dels" type="button" value="배달업체 선택" onclick="orderView.inputDelData(' + index + ')">'
	                 	+ '</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	            var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
                
                 // 인포윈도우를 생성합니다
                 if (orderView.infowindow != null)
                	 orderView.infowindow.close();
                     
                 orderView.infowindow = new daum.maps.InfoWindow({
                     content : iwContent,
                     removable : iwRemoveable
                 });
                 // 마커에 클릭이벤트를 등록합니다
                 daum.maps.event.addListener(marker, 'click', function() {
                    orderView.infowindow.open(map, marker);  
                 });
             }
         },
         inputDelData : function (index) {
        	orderView.selectedDid = index;
        	 
			$("input[name='did']").val(this.deliveryList[index].did);
			$("input[name='delShopname']").val(this.deliveryList[index].shopName);
			$("input[name='delAddress']").val(this.deliveryList[index].address);
			$("input[name='delTel']").val(this.deliveryList[index].tel);
			$("input[name='delPhone']").val(this.deliveryList[index].phone);
			$("input[name='delDPrice']").val(this.deliveryList[index].dprice);
			
			// 업체선택시 전체공개 아님
			$("input[name='opencheck']").each(function() {
				if ($(this).val() == "y") {
					$(this).attr("checked", false);
				} else {
					$(this).attr("checked", true);
				}
			}); 
         }
	}
    
	var ajax = {
		fromServer : function() {
			if( httpRequest.readyState == 4 ) {
				if( httpRequest.status == 200 ) {
					// console.log(httpRequest.responseText);
					var res = eval( "(" + httpRequest.responseText + ")" ); 
					if (res.result.code == "not_result") {
						if (!$.isEmptyObject($("#delivery-items"))) {
							$("#delivery-items").empty();
						} 
						$("#delivery-items").append("<p style='padding-left: 10px'>" + res.result.data + "</p>")	;
					}
					else if (res.result.code == "success") {
						orderView.printDeliveryList(res.result.data);
					}
				} else {
					console.log("에러 발생");
				}		
			} else {
				console.log("통신중");	
			}		
		},
		orderResult : function() {
			if( httpRequest.readyState == 4 ) {
				if( httpRequest.status == 200 ) {
					console.log(httpRequest.responseText);
					var res = eval( "(" + httpRequest.responseText + ")" ); 
					$('[data-remodal-id=modal] > h1').text(res.result.data[0]);
					$('[data-remodal-id=modal] > p').text(res.result.data[1]);
					inst.open();
					if (res.result.code == "fail") {
					}
					else if (res.result.code == "success") {
						
					}
				} else {
					console.log("에러 발생");
				}		
			} else {
				console.log("통신중");	
			}
		}
	}
</script>