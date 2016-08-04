<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<c:if test="${num == 1}">
	<c:if test="${resultCheck==1}">
		<c:if test="${result == 0}">
		{
			result : {
				code : "fail",
				data : ["배달 수락 실패", "잠시 후에 다시 배달을 수락해주세요."]
			}
		}
		</c:if>
		<c:if test="${result != 0}">
		{
			result : {
				code : "success",
				data : ["배달 수락 성공", "수락이 완료되었습니다. 배달이 완료되면 음식점에 메세지가 도착합니다."]
			}
		}
		</c:if>
	</c:if>
	<c:if test="${resultCheck==0}">
		{
			result : {
				code : "fail",
				data : ["배달 수락 실패", "사용가능한 오토바이가 없습니다. 배달완료 후 다시 시도하세요."]
			}
		}
	</c:if>
</c:if>

<c:if test="${num == 2}">
	<c:if test="${result == 0}">
		{
			result : {
				code : "fail",
				data : ["배달 거절 실패", "잠시 후에 다시 배달을 거절해주세요."]
			}
		}
	</c:if>
	<c:if test="${result != 0}">
		{
			result : {
				code : "success",
				data : ["배달 거절 성공", "거절이 완료되었습니다. 비싸게 굴지 마세요."]
			}
		}
	</c:if>
</c:if>

