<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<c:if test="${num == 1}">
	<c:if test="${result == 0}">
	{
		result : {
			code : "fail",
			data : ["배달 주문취소 실패", "잠시 후 다시 시도하세요"]
		}
	}
	</c:if>
	
	<c:if test="${result != 0}">
	{
		result : {
			code : "success",
			data : ["배달 주문취소 성공", "신중하게 배달을 신청하세요"]
		}
	}
	</c:if>
</c:if>

<c:if test="${num == 2}">
	<c:if test="${result == 0}">
	{
		result : {
			code : "fail",
			data : ["거절된 배달 목록지우 실패", "잠시 후 다시 시도하세요"]
		}
	}
	</c:if>
	
	<c:if test="${result != 0}">
	{
		result : {
			code : "success",
			data : ["거절된 배달 목록지우기 성공", "다른곳에 배달을 신청하세요"]
		}
	}
	</c:if>
</c:if>