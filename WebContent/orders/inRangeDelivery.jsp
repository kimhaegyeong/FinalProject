<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<c:if test="${fn:length(deliveryList) == 0}">
	{
		result : {
			code : "not_result",
			data : "검색 결과가 없습니다."
		}
	}
</c:if>
<c:if test="${fn:length(deliveryList) != 0}">
	{
		result : {
			code : "success",
			data : [
				<c:forEach var="item" items="${deliveryList}" varStatus="loop">
					{
						did : ${item.did},
						shopName : "${item.shop_name}",
						owner : "${item.owner}",
						post : ${item.post}, 
						address : "${item.address}",
						tel : "${item.tel}",
						phone : "${item.phone}",
						lat : ${item.lat},
						lng : ${item.lng},
						dprice : ${item.dprice},
						bike : ${empty item.bike? 0 :item.bike},
						imgpath : "${$item.imgpath}"
					}<c:if test="${!loop.last}">,</c:if>
				</c:forEach>
			]
		}
	}
</c:if>
