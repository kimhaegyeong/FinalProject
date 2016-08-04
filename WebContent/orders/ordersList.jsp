<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<c:if test="${fn:length(list) == 0}">
	{
		result : {
			code : "not_result",
			data : "신청 주문이 없습니다. 잠시 기다려주세요."
		}
	}
</c:if>
<c:if test="${fn:length(list) != 0}">
	{
		result : {
			code : "success",
			data : [
				<c:forEach var="item" items="${list}" varStatus="loop">
					{
						onum : ${item.ONUM},
						destination : "${item.DESTINATION}",
						sid : ${item.SID},
						shop_name : "${item['SHOP_NAME']}",
						price : ${item.PRICE}, 
						fees : ${item.FEES},						
						reg_Time : "<fmt:formatDate value="${item.REG_TIME}" pattern="MM/dd HH:mm"/>",
						limit_Time : "<fmt:formatDate value="${item.LIMIT_TIME}" pattern="HH:mm"/>",
						res_Limit_Time : "<fmt:formatDate value="${item.RES_LIMIT_TIME}" pattern="HH:mm"/>",
					}<c:if test="${!loop.last}">,</c:if>
				</c:forEach>
			]
		}
	}
</c:if>

