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
						onum : ${item.onum},
						destination : "${item.destination}",
						sid : "${item.sid}",
						price : ${item.price}, 
						fees : "${item.fees}",						
						reg_Time : "${item.reg_Time}",
						limit_Time : "${item.limit_Time}",
						res_Limit_Time : "${item.res_Limit_Time}"
					}<c:if test="${!loop.last}">,</c:if>
				</c:forEach>
			]
		}
	}
</c:if>

