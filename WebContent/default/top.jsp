<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<link type="text/css" href="/FinalProject/css/menu.css" rel="stylesheet" />
	<script type="text/javascript" src="/FinalProject/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/FinalProject/js/menu.js"></script>
</head>

<c:if test="${check==1}">
	<body>
	
	<div id="menu">
			<ul class="menu">
				<li><a href="main.do"><span>본인 정보 보기</span></a></li>
				<li><a href="bikeList.do"><span>오토바이 등록 및 확인하기</span></a></li>
				<li><a href="ordersViewForm.do?id=${sessionScope.id}"><span>배달신청보기</span></a></li>
				<li><a href="ordersConditionForm.do?id=${sessionScope.id}"><span>배달현황보기</span></a></li>
				<li><a href="#"><span>정보 수정하기</span></a></li>
				<li><a href="#"><span>QNA게시판 가기</span></a></li>
				<li><a href="#"><span>정산하기</span></a></li>
				<li><a href="#"><span>회원탈퇴</span></a></li>
				<li><a href="logout.do"><span>로그아웃</span></a></li>
			</ul>
		</div>
	</body>
</c:if>

<c:if test="${check==2}">
	<body>
	
	<div id="menu">
			<ul class="menu">
				<li><a href="main.do"><span>본인 정보 보기</span></a></li>
				<li><a href="insertOrderView.do"><span>주문 신청</span></a></li>
				<li><a href="#"><span>정보 수정하기</span></a></li>
				<li><a href="#"><span>QNA게시판 가기</span></a></li>
				<li><a href="#"><span>정산하기</span></a></li>
				<li><a href="#"><span>회원탈퇴</span></a></li>
				<li><a href="logout.do"><span>로그아웃</span></a></li>
			</ul>
		</div>
	</body>
</c:if>

<c:if test="${check==3}">
	<body>
	
	<div id="menu">
			<ul class="menu">
				<li><a href="adminOrderView.do"><span>주문현황보기</span></a></li>
				<li><a href="adminDeleteView.do?view=0"><span>회원정보 삭제 하기</span></a></li>
				<li><a href="#"><span>질문답변하기</span></a></li>
				<li><a href="adminModifyForm.do"><span>정보수정하기</span></a></li>
				<li><a href="#"><span>정산하기</span></a></li>
				<li><a href="logout.do"><span>로그아웃</span></a></li>
			</ul>
		</div>
	</body>
</c:if>
