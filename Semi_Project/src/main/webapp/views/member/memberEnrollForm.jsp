<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<%@ include file="/views/common/menubar.jsp"%>
	<div>
		<br>
		
		<h2 align="center">회원가입</h2>
		
		<form action="<%=contextPath %>/insert.me" method="post">
		
		
					<!-- 아이디,비밀번호,이름,전화번호,주소,취미,이메일 -->
			<table align="center">
				
				<tr>
					<td>* 아이디</td>
					<td><input type="text" name="userId" required></td>
					<td><button type="button">중복확인</button></td>
					
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" name="userPwd" required></td>
					<td></td>
				</tr>
				<tr>
					<td>* 비밀번호확인</td>
					<td><input type="password" id="pwChk" required></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="userName" required></td>
					<td></td>
				</tr>
				<tr>
					<td>* 닉네임</td>
					<td><input type="text" name="NickName" required></td>
					<td></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
					<td></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone"></td>
					<td></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" name="postNumber"></td>
					<td></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"></td>
					<td></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth"></td>
					<td></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="gender"></td>
					<td></td>
				</tr>
				
			</table>

			<br>
			<br>

			<div align="center">
				<button type="submit">회원가입</button>
				<button type="reset">초기화</button>
			</div>




		</form>
		
		
	
	</div>
	


</body>
</html>