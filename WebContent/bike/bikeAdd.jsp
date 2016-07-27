<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="bikeAdd.do">
	<table>
		<tr>
			<th>
				번호판
			</th>
			<td>
				<input type="text" name="id">
			</td>
			<th>
				보험번호
			</th>
			<td>
				<input type="text" name="ins">
			</td>
			<th colspan="2">
				<input type="submit" name="추가하기">
			</th>
		</tr>
	</table>
</form>