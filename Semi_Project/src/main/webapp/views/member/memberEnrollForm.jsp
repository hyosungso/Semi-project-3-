<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%
	
String contextPath = request.getContextPath();

%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	
	<div>
		<br>

		<h2 align="center">회원가입</h2>

		<form id="enroll-form" action="insert.me" method="post">


			<table align="center">

				<tr>
					<td>아이디</td>
					<td><input type="text" id="userId" name="userId" required></td>
					<td><button type="button" onclick="checkId();">중복확인</button></td>
				</tr>

				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="userPwd" name="userPwd"
						required></td>
					<td></td>
				</tr>

				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="pwChk" name="userPwd" required></td>
				</tr>

				<tr>
					<td>이름</td>
					<td><input type="text" name="userName" required></td>
					
				</tr>

				<tr>
					<td>성별</td>
					<td>
						<input type="checkbox" name="gender">남   
						<input type="checkbox" name="gender">여
					</td>
				</tr>

				<tr>
					<td>닉네임</td>
					<td><input type="text" name="NickName" required></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><input type="text" name="email"></td>
					<td><select>
							<option>gmail.com</option>
							<option>naver.com</option>
							<option>daum.net</option>
							<option>hanmail.com</option>
							<option>hotmail.com</option>
							<option>nate.com</option>
						</select>
					</td>
				</tr>

				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="phone">
					</td>
				</tr>

			</table>

			<br> <br>

			<div align="center">
				<button type="submit" >회원가입</button>
				<button type="reset">초기화</button>
			</div>
		</form>

		<script>
			function checkId(){
				
				var inputId= $("#userId").val();
				
				
				$.ajax({
					  url: "checkId.me",
					  data: {
						 	inputId : inputId
					  },
					  success: function(result) {
					    if (result == "NNNNN") {
					      alert("다른 아이디를 사용해주세요.");
					    } else {
					      if (confirm("정말 사용하시겠습니까?")) {
					        $("#enroll-form:submit").removeAttr("disabled"); // 비동기 방식으로 submit 이벤트 발생
					      	$("#userId").attr("readonly",true);
					      } else {
					        $("#userId").focus();
					      }
					    }
					  },
					  error: function() {
					    console.log("통신실패");
					  }
					});
				
				
				
			}
		
		</script>


	</div>
	
	


</body>
</html>