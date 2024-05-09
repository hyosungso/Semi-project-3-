<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<%

	String alertMsg = (String)session.getAttribute("alertmsg");
	
	String contextPath = request.getContextPath();
	
%>

</head>
<body>
	
	<div>
		<br>

		<h2 align="center">회원가입</h2>

		<form id="enroll-form" action="<%=contextPath%>/insert.me" method="post">


			<table align="center">

				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId" required></td>
					<td><button type="button" onclick="checkId();">중복확인</button></td>
				</tr>

				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userPwd" required></td>
					<td></td>
				</tr>

				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="userPwd" required></td>
				</tr>

				<tr>
					<td>이름</td>
					<td><input type="text" name="userName" required></td>
					
				</tr>

				<tr>
					<td>성별</td>
					<td>
						<label><input type="checkbox" name="gender" value="M">남자</label>
						<label><input type="checkbox" name="gender" value="F">여자</label>
					
					</td>
				</tr>

				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nickName" required></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" required></td>
				</tr>

				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="phone" required>
					</td>
				</tr>

			</table>

			<br> <br>

			<div align="center">
				<button type="submit" onclick="real();">회원가입</button>
				<button type="reset">초기화</button>
			</div>
		</form>
		
		
		<!-- 회원가입 성공시 / 실패시 -->
		<script>
		
			var msg = "<%=alertMsg%>";
			
			
			if(msg!="null"){
				alert(msg);
				<%session.removeAttribute("alertMsg");%>
			}
		
		</script>
		

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
						console.log("회원가입 실패");
					}
				});
				
				
			}
			
			
			
			
			function real(){
			   
			       var result = window.confirm("회원가입 하시겠습니까?");
			      
			    }
		
		</script>


	</div>


</body>
</html>