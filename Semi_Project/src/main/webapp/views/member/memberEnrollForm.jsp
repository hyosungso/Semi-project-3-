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


 <style>
        
        body {
    font-family: 'Malgun Gothic', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f6f7;
	}
	
	.container {
	    max-width: 600px;
	    margin: 0 auto;
	    padding: 20px;
	    background-color: #fff;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	
	header {
	    text-align: center;
	    margin-bottom: 30px;
	}
	
	.logo img {
	    max-width: 200px;
	}
	
	main {
	    margin-bottom: 30px;
	}
	
	.progress-bar {
	    height: 5px;
	    background-color: #e5e5e5;
	    margin-bottom: 30px;
	}
	
	.progress {
	    height: 100%;
	    width: 66.66%;
	    background-color: #ff0000;
	}
	


	
	.optional{    color: #888;
	}
	        
        

		.buttons {
			margin-top: 20px;
			text-align: center;
		}

		.button {
			padding: 10px 17px;
			background-color: #000000; /* 짙은 회색 버튼 배경 */
			color: #fff;
			border: none;
			border-radius: 10px;
			cursor: pointer;
			transition: background-color 0.3s; /* hover 효과 */
		}

        .button2 {
			padding: 10px 17px;
			background-color: #130000; /* 짙은 회색 버튼 배경 */
			color: #fff;
			border: none;
			border-radius: 10px;
			cursor: pointer;
			transition: background-color 0.3s; /* hover 효과 */
		}

        .button2:hover {
			background-color: #ff0000; /* hover 시 밝은 회색으로 변화 */
		}

		.button:hover {
			background-color: #ff0000; /* hover 시 밝은 회색으로 변화 */
		}

		.disabled {
			opacity: 0.5;
			cursor: default;
		}


        .input-box input::placeholder{
        color : red;
    }
    
    .input-box input{
        width : 100%;
        height : 100%;
        background-color: transparent;
        border : none;
        outline : none;
        border : 2px solid rgba(0, 0, 0, 0.2);
        border-radius : 40px;
        font-size: 16px;
        color : rgb(0, 0, 0);
        padding : 5px 45px 10px
    }

    .input-box input::placeholder{
        color : red;
    }

    .checkbox input {
    display: none;
    }

    .checkbox_icon {
    display: inline-block;
    width: 20px;
    height: 20px;
    background-color: transparent;
    border: 2px solid rgb(194, 193, 193);
    position: relative;
    cursor: pointer;
    }

    .checkbox_icon::before, .checkbox_icon::after {
    content: ''; 
    display: inline-block; 
    width: 1px;
    height: 0; 
    background-color: red;
    position: absolute; 
    transform-origin: left top; 
    }

    .checkbox_icon::before {
    top: 9px; 
    left: 2px; 
    transform: rotate(-45deg);
    }

    .checkbox_icon::after {
    top: 16px; 
    left: 9px; 
    transform: rotate(-135deg); 
    }

    .checkbox input:checked + .checkbox_icon {
    border-color: red;
    }

    .checkbox input:checked + .checkbox_icon::before {
    height: 10px; /
    transition: all 0.15s ease;
    }

    .checkbox input:checked + .checkbox_icon::after {
    height: 20px; 
    transition: all 0.15s ease 0.15s; 
    }
		
    </style>



</head>

<body>

	<form id="enroll-form" action="<%=contextPath%>/insert.me" method="post">
	
		<div class="container">
            
            <header>
                <h1>
                    <a href="#" class="logo">
                        <img src="https://cdn-icons-png.flaticon.com/512/4205/4205505.png" alt="헬스라이프">
                    </a>
                </h1>


            </header>
           
                <div class="progress-bar">
                    <div class="progress"></div>
                </div>

                <table align="center">

                    <tr class="input-box">
                        <td>아이디</td>
                        <td><input type="text" name="userId" required></td>
                        <td><button type="button" class="button2" onclick="checkId();">중복확인</button></td>
                    </tr>
    
                    <tr class="input-box">
                        <td>비밀번호</td>
                        <td><input type="password" name="userPwd" required></td>
                        <td></td>
                    </tr>
    
                    <tr class="input-box">
                        <td>비밀번호 확인</td>
                        <td><input type="password" name="userPwd" required></td>
                    </tr>
    
                    <tr class="input-box">
                        <td>이름</td>
                        <td><input type="text" name="userName" required></td>
                        
                    </tr>
    
                    <tr>
                        <td>성별</td>
                        <td>
                            
                            <label class="checkbox" ><input type="checkbox"  name="gender" value="M"><span class="checkbox_icon" ></span>
                                <span class="checkbox_text"></span>남자</label>
                                
                            <label class="checkbox"><input type="checkbox" name="gender" value="F"><span class="checkbox_icon"></span>
                                <span class="checkbox_text"></span>여자</label>
                           
                        </td>
                    </tr>
    
                    <tr class="input-box">
                        <td>닉네임</td>
                        <td><input type="text" name="nickName" required></td>
                    </tr>
    
                    <tr class="input-box">
                        <td>이메일</td>
                        <td><input type="email" name="email" required></td>
                    </tr>
    
                    <tr class="input-box">
                        <td>전화번호</td>
                        <td>
                            <input type="text" name="phone" required>
                        </td>
                    </tr>
    
                </table>
    
                <br> <br>
    
                <div align="center">
                    <button type="submit" class="button" id="nextButton" onclick="real();">회원가입</button>
                    <input type="reset" class="button disabled" id="nextButton" ></input>
                </div>
                
                



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