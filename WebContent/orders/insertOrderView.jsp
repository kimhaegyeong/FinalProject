<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
	html, body {
		width: 100% !important;
		height: 100% !important;
	}
	#container {
		position: absolute;
		width: 100%;
		height: calc(100% - 41px);
		background: blue;
	}
	.extend > #left-side {
		position: absolute;
		top: 0;
		left: 0;
		width: 60%;
		height: 100%;
		background: yellow;
	}
	.extend > #right-side {
		position: absolute;
		top: 0;
		left: 60%;
		width: 40%;
		height: 100%;
		background: red;
	}
	.extend > #right-side > #input-order{
		width: 100%;
		height: 50%;
		background: gold;
	}
	.extend > #right-side > #delivery-list {
		top: 50%;
		width: 100%;
		height: 50%;
		background: aqua;
	}
	.shink > #left-side {
		width: 35px;
		height: 100%;
		background: yellow;
	}
	.shink > #right-side {
		position: absolute;
		top: 0;
		left: 35px;
		width: calc(100% - 35px);
		height: 100%;
		background: red;
	}
	.shink > #right-side > #input-order{
		width: 50%;
		height: 100%;
		background: gold;
	}
	.shink > #right-side > #delivery-list {
		position: absolute;
		top: 0;
		left: 50%;
		width: 50%;
		height: 100%;
		background: aqua;
	}
</style>

<jsp:include page="/default/top.jsp"></jsp:include>

<div id="container" class="extend">
	<div id="left-side">
		<div>
			<img id="arrow" src="/FinalProject/images/order/left-arrow.png" style="width: 25px; padding: 5px;">
		</div>
	</div>
	<div id="right-side">
		<div id="input-order">
		</div>
		<div id="delivery-list">
		</div>
	</div>
</div>

<script>
	var cnt = 0;
	$("#arrow").on("click", function() {
		cnt++;
		
		if (cnt % 2 == 1) {
			$("#arrow").attr("src", "/FinalProject/images/order/right-arrow.png");	
			$("#container").removeClass("extend");
			$("#container").addClass("shink");
		} else {
			$("#arrow").attr("src", "/FinalProject/images/order/left-arrow.png");	
			$("#container").removeClass("shink");
			$("#container").addClass("extend");
		}
	}); 
</script>