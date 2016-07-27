<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	//<!--
function Member(result2){
		this.result2 = result2;
}
Member.prototype = {
		setResult2 : function(result2){
			this.result2=result2;	
		},
		getResult2 : function(){
			return this.result2;
		}
}
	
function Request( callback, url, method, params ) {
	this.callback = callback;
	this.url = url;
	this.params = params;
	this.method = method;
	this.httpRequest = null;
};

Request.prototype = {
	getXMLHttpRequest : function() {
		if( window.ActiveXObject ) {
			try {
				return new ActiveXObject( "Msxml2.XMLHTTP" );
			} catch( e ) {
				try {
					return new ActiveXObject( "Microsoft.XMLHTTP" );
				} catch( ex ) {
					return null;
				}
			}			
		} else {
			try {
				return new XMLHttpRequest();
			} catch( e ) {
				return null;
			}			
		}		
	},
	sendRequest : function() {
		this.httpRequest = this.getXMLHttpRequest();
		
		this.httpRequest.onreadystatechange = this.callback;
								
		var httpMethod = this.method ? this.method : "GET";
		if( httpMethod != "POST" && httpMethod != "GET" ) {
			httpMethod = "GET";
		}
		
		var httpParams = ( this.params == null || this.params == "" ) ? "" : this.params; 
		
		var httpUrl = ( httpMethod == "GET" ) ? this.url + "?" + httpParams : this.url;
		console.log(httpParams);
		
		this.httpRequest.open( httpMethod, httpUrl, true );
		this.httpRequest.setRequestHeader(
			"content-type", "application/x-www-form-urlencoded" );
		this.httpRequest.send( httpMethod == "POST" ? httpParams : null );
		
	}
};

	var request = null;
	function show() {
		var params = "id="+inputform.id.value;
		request = new Request( showMember, "confirmEmail.do","POST" ,params );
		request.sendRequest();
	}
	function showMember() {
		var result = document.getElementById( "result" );
		if( request.httpRequest.readyState == 4 ) {
			if( request.httpRequest.status == 200 ) {
				var msg = "";
				var person = eval("("+request.httpRequest.responseText+")");
				if(person.result.code=="success"){
					var m = new Array();
					for(var i=0; i<person.result.data.length; i++){
						var w = new Member();
						w.setResult2(person.result.data[i].result2);
						m[i] = w;
					}
					for(var i=0; i<m.length; i++){
						result.innerHTML = m[i].getResult2();
					}
				}
			} else {
				result.innerHTML = "에러 발생";
			}			
		} else {
			result.innerHTML = "통신중";
		}	
	}
	
	function checkPasswd(){
		var result = document.getElementById("passwd");
		if(inputform.passwd1.value!=""){
			if(inputform.passwd1.value==inputform.passwd2.value){
				var msg = "비밀번호가 일치합니다."
			}else{
				var msg = "비밀번호가 일치하지 않습니다."
			}
		}else{
			var msg = "비밀번호를 입력해 주세요"
		}
		passwd.innerHTML = msg;
		setTimeout("checkPasswd()",1000);
	}
	
	  function postcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	   
	                var fullAddr = ''; 
	                var extraAddr = '';

	                if (data.userSelectedType === 'R') { 
	                    fullAddr = data.roadAddress;
	                } else { 
	                    fullAddr = data.jibunAddress;
	                }
	                if(data.userSelectedType === 'R'){
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                document.getElementById('post').value = data.zonecode;
	                document.getElementById('address1').value = fullAddr;
	                
	                document.getElementById('address2').focus();
	            }
	        }).open();
	    }


</script>

<body>
	<form name="inputform" action="signupPro.do">
		<input type="hidden" name=check value="${check}">
		<table border="1">
			<tr>
				<th>email</th>
				<td>
					<input type="text" name="id" onkeyup="show()">
					<div id="result">
					</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="passwd1"><br>
					<input type="password" name="passwd2" onfocus="checkPasswd()">
					<div id = "passwd">
					</div>
				</td>
			</tr>
			<tr>
				<th>가게명</th>
				<td>
					<input type="text" name="shop_name">
				</td>
			</tr>
			<tr>
				<th>사업주</th>
				<td>
					<input type="text" name="owner">
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<input type="text" name="post" id="post" disabled="disabled"><input type="button" value="우편번호 찾기" onclick="postcode()">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="address1" id="address1" disabled="disabled"><br>
					<input type="text" name="address2" id="address2">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="tel">
				</td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td>
					<input type="text" name="phone">
				</td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td>
					<textarea rows="30" cols="30" name="intro"></textarea>
				</td>
			</tr>
			<tr>
				<th>사업자번호</th>
				<td>
					<input type="text" name="shop_num">
				</td>
			</tr>
			<c:if test="${check == 1}">
				<tr>
					<th>최대값</th>
					<td>
						<input type="text" name = "max_price">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="전송하기">
						<input type="reset" value="취소">
						<input type="button" value="돌아가기" onclick="location='index.do'">
					</th>
				</tr>
			</c:if>
			<c:if test="${check == 2}">
				<tr>
					<th>최소값</th>
					<td>
						<input type="text" name = "dprice">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="전송하기">
						<input type="reset" value="취소">
						<input type="button" value="돌아가기"  onclick="location='index.do'">
					</th>
				</tr>
			</c:if>
		</table>
	</form>
</body>

