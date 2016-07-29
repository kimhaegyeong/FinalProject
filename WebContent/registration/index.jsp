<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
//<!--
	function checkValue(){
		if(!index.id.value){
			alert("id를  입력해주세요");
			return false;
		}else if(!index.passwd.value){
			alert("password를 입력해주세요");
			return false;
		}
	}
//-->
</script>

<body>
	<form method="post" action="login.do" name="index" onsubmit="return checkValue()">
		<table border = "1">
			<tr>
				<th colspan="2">
					<input type="radio" name="check" value="1" checked="checked">A
					<input type="radio" name="check" value="2">B
					<input type="radio" name="check" value="3">C
				</th>
		</tr>
			<tr>
				<th>
					아이디
				</th>
				<td>
					<input type="text" name="id">
				</td>
			</tr>
			<tr>
				<th>
					비밀번호
				</th>
				<td>
					<input type="password" name="passwd">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="로그인하기">
					<input type="reset" value="취소">
					<input type="button" value="회원가입1" onclick="location='signupForm.do?check=1'">
					<input type="button" value="회원가입2" onclick="location='signupForm.do?check=2'">
				</th>
			</tr>
		</table>
	</form>
</body>
