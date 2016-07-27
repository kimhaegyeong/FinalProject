<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result == 0}">
	{
		result : {
			code : "fail",
			data : ["주문 신청 실패", "잠시 후에 다시 주문 신청해주세요."]
		}
	}
</c:if>
<c:if test="${result != 0}">
	{
		result : {
			code : "success",
			data : ["주문 신청 성공", "신청이 완료되었습니다.배달업체가 주문 수락시 메세지가 도착합니다."]
		}
	}
</c:if>