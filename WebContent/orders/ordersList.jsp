<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

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
						reg_Time : "${item.REG_TIME}",
						limit_Time : "${item.LIMIT_TIME}",
						res_Limit_Time : "${item.RES_LIMIT_TIME}"
					}<c:if test="${!loop.last}">,</c:if>
				</c:forEach>
			]
		}
	}
</c:if>

