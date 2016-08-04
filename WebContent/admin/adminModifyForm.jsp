<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE script>
<body>
<script type="text/javascript">
	//<!--
	function checkPasswd(){
		var result = document.getElementById("passwd");
		if(admin.passwd1.value!=""){
			if(admin.passwd1.value==admin.passwd2.value){
				var msg = "비밀번호가 일치합니다."
			}else{
				var msg = "비밀번호가 일치하지 않습니다."
			}
		}else{
			var msg = "비밀번호를 입력해 주세요"
		}
		passwd.innerHTML = msg;
	}
	function checkAdmin(){
		if(admin.passwd1.value!=admin.passwd2.value){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}else if(!admin.fees.value){
			alert("수수료를 입력해 주세요");
			return false;
		}
	}
	//-->
</script>


	<form method="post" name="admin" action="adminModifyPro.do" onsubmit="return checkAdmin()">
		<div>
			<jsp:include page="/default/top.jsp"></jsp:include>
		</div>
		
		<h2>관리자 수정 페이지입니다.</h2>
		
		<div>
			<table>
				<tr>
					<th>아이디</th>
					<td>
						${dto.id}
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="passwd1" value="${dto.passwd}"><br>
						<input type="password" name="passwd2" value="${dto.passwd}" onkeyup="checkPasswd()">
						<div id="passwd">
						</div>
					</td>
				</tr>
				<tr>
					<th>수수료</th>
					<td><input type="text" maxlength="5" name="fees" value="${dto.fees}">원</td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="수정하기"></th>
				</tr>
			</table>
		</div>
	</form>
</body>