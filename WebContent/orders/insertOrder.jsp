<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${result == 0}">
	{
		result : {
			code : "fail",
			data : "주문 신청 실패"
		}
	}
</c:if>
<c:if test="${result != 0}">
	{
		result : {
			code : "success",
			data : "주문 신청 성공"
		}
	}
</c:if>