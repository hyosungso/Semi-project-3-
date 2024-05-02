<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% //로그인 정보 추출하기 
	Member loginUser = (Member)session.getAttribute("loginUser");
	
	String alertMsg = (String)session.getAttribute("alertMsg");

	Cookie[] cookies = request.getCookies();
	
	String saveId = "";
	
	if(cookies !=null){
		for(Cookie c : cookies){
			if(c.getName().equals("userId")){
				saveId = c.getValue();
				break;
			}
		}
	}
	
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Views</title>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
/* body {
        margin: 0;
        padding: 0;
    }

    .login-area {
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center; 
        align-items: center; 
        background: pink;
    }
*/
   
    
    body {
        margin: 0;
        padding: 0;
        background-color: black ; 
    }

    
    form {
        max-width: 400px;
        margin: auto; 
        background-color: white; 
        border-radius: 8px; 
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
        padding: 40px; 
    }

    h2 {
        text-align: center;
        margin-bottom: 30px; 
    }

    input[type="text"],
    input[type="password"] {
        border: none; 
        border-bottom: 1px solid #ced4da; 
        padding: 10px; 
        width: 100%; 
        margin-bottom: 20px; 
    }

    button {
        background-color: #007bff;
        border: none; 
        border-radius: 20px; 
        padding: 15px; 
        width: 100%; 
        color: white;
        font-weight: bold; 
        margin-bottom: 20px; 
    }

    .btn-secondary {
        background-color: #6c757d; 
        border: none; 
        border-radius: 20px; 
        padding: 15px; 
        width: 100%; 
        color: white; 
        font-weight: bold; 
    }

</style>
</head>
<body>
	<div class="login-area">
	
		<form id="login-form" action="<%=contextPath%>/login.me" method="post">
		<img name="login-image" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAyMDA2MTNfMzkg%2FMDAxNTkyMDI3MTE1Njkz.tinbvbYJf4_QXzkrLpI2nCPXq98W-jVJGy7It8TLObUg.SgMpdY818xVrmzWiONQiiIJyTlx5QfiIj4RqjMcUwIog.GIF%2FexternalFile.gif&type=a340" alt="로그인 이미지"><br><br>
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" id="loginId" name="userId" required></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="loginPwd" name="userPwd" required></td>				
				</tr>
				<tr>
					<td colspan="2">
						<label for="saveId">아이디 저장</label><input type="checkbox" id="saveId" name="SaveId">
					</td>
				</tr>
				<tr>
					<th colspan="3">
						<button type="submit">로그인</button>
						<button type="button" class="btn-secondary" onclick="">회원가입</button>
						<button id="naver_id_login" name="naver_id_login">네이버</button>
					</th>
				</tr>
				

			
			</table>
		</form>
		 <script>
        	$(function(){
        		
        		var saveId = "${cookie.userId.value}";
				if(saveId!=""){
					$("#saveId").attr("checked",true);
					$("#loginId").val(saveId);
				}        		
        		
        	});
        
        
        	function enrollForm(){
        		
        		
        		
        	}
        
        </script>

	</div>
	 <script type="text/javascript">
  	var naver_id_login = new naver_id_login("FutmSJFgSoacokH2aZwQ", "http://localhost:8888/HealthLife");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("EFlrfDUSeQ");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
  
	<script type="text/javascript">
  var naver_id_login = new naver_id_login("FutmSJFgSoacokH2aZwQ", "http://localhost:8888/HealthLife");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
  }
</script>
	
</body>
</html>