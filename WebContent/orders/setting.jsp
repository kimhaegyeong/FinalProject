<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="project" value="/FinalProject/orders/"/>

<c:set var="msg_orders_x" value="신청된 주문이 아직 없습니다. 잠시 기다려 주세요."/>

<c:set var="str_onum" value="주문번호"/>
<c:set var="str_sid" value="음식점 명"/>
<c:set var="str_price" value="상품가격(원)"/>
<c:set var="str_reg_Time" value="등록시간"/>
<c:set var="str_fees" value="수수료(원)"/>
<c:set var="str_limit_Time" value="도착제한시간"/>
<c:set var="str_res_Limit_Time" value="응답제한시간"/>
<c:set var="str_response1" value="수락 / 거절"/>
<c:set var="str_response2" value="수락 "/>

<c:set var="str_state" value="배달상태"/>
<c:set var="str_changeState" value="배달상태변경"/>

