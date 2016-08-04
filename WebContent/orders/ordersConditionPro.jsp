<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<c:if test="${resultCheck==1}">
	<c:if test="${result == 0}">
	{
		result : {
			code : "fail",
			data : ["배달상태 변경 실패.", "잠시 후 다시 시도하세요"]
		}
	}
	</c:if>
	<c:if test="${result != 0}">
	{
		result : {
			code : "success",
			data : ["배달완료!!", "배달하느라 수고가 많으십니다"]
		}
	}
	</c:if>
</c:if>
<c:if test="${resultCheck==0}">
	{
		result : {
			code : "fail",
			data : ["사용가능한 오토바이 대수 초기화 실패.", "잠시 후 다시 시도하세요"]
		}
	}
</c:if>
