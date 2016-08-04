<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result==0}">
{
	result : {
		code : "success",
		data : [
					{
						result2 : "사용가능한 아이디입니다." 
					}
				]
	}
}
</c:if>
<c:if test="${result!=0}">
{
	result : {
		code : "success",
		data : [
					{
						result2 : "사용 불가능한 아이디입니다."	
					}
				]
	}
}
</c:if>