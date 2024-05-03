<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
					<td>성별 (F/M) </td>
					<td><input type="text" name="gender" required></td>
				</tr>

				<tr>
					<td>닉네임</td>
					<td><input type="text" name="NickName" required></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
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
				<button type="submit">회원가입</button>
				<button type="reset">초기화</button>
			</div>
		</form>

		<script>
			function checkId(){
				
				var inputId= $("#userId").val();
				
				
				$.ajax({
					url : "idCheck.me",
					type : "post",
					data : {
						inputId : $("#userId").val()
					},
					success : function(result){
						//result가 NNNNN 또는 NNNNY로 반환됨 
						if(result=="NNNNN"){ //사용불가
							alert("이미 존재하는 아이디입니다.");
						}else{ //사용가능
							if(confirm("정말 사용하시겠습니까?")){ //사용
								$("#enroll-form :submit").removeAttr("disabled"); //비활성화제거
								$("#userId").attr("readonly",true); //아이디 수정못하도록 변경
								
							}else{ //사용안함 
								//다시 입력유도
								$("#userId").focus();
							}
						}
					},
					error : function(){
						console.log("통신실패");
					}
				});
				
				
				
			}
		
		</script>


	</div>


</body>
</html>