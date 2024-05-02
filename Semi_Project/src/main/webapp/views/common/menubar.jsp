<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%
	//로그인 정보 추출하기 
	Member loginUser = (Member)session.getAttribute("loginUser");
	//로그인이 되어있지 않다면 loginUser라는 key값으로 데이터를 조회할 수 없으니 
	//null이 반환된다. 로그인이 되었다면 해당 로그인 정보가 반환된다. 
	
	//알림 메세지 추출하기 
	String alertMsg = (String)session.getAttribute("alertMsg");
	
	//contextPath 변수처리해서 사용하기 
	String contextPath = request.getContextPath();
	
%>  

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        .header{
            position: relative;
            width: 80%;
            margin : auto;
            z-index: 20;
            background-color: #fff;
        }
        .header-inner{
            
        position: relative;
        max-width: 1300px;
        min-height: 130px;
        margin: 0 auto;

        }
        .util{
            position: absolute;
            top: 0px;
           	right: 5%;
        }
        .util>ul{
          
            float: right;
            list-style: none;
            overflow: hidden;
        }
        .util>ul>li{
            display: inline;
            font-size: 13px;
            
        }
        .util a{
            text-decoration: none;
            color: gray;
        }
            .logo{
            display: block;
            position: absolute;
            top: 20px;
            left: 0;
            right: 0;
            margin: auto;
        }
        .logo img{
            width: 300px;
           float: left;
          
        }
        .logo a{
            width: 300px;
           float: left;
          
        }

        .nav-area{
        	margin:auto;
        	width:80%;
            background-color: black;
        }
        .menu{
            display: flex;
            height: 50px;
            margin: auto;
            width: 1100px;
        }
        .menu div{
            width: 100%;
            margin: auto
        }
        .menu a {
            text-decoration: none;
            color:white;
            font-size: 20px;
            font-weight: bold;
            display: block;
            width: 100%;
            height: 100%;
            line-height: 50px;
        }
        .menu a:hover{
            background-color: rgb(144, 142, 142);
        }
        
        .board ul{
            margin: auto;
        }
        
        #navi>li>ul{
            list-style-type: none;
            background-color: black;
            padding: 0px;  /*padding 0 처리*/
            display: none; /*안보이게 처리하기*/
        }
        #navi>li>a:hover+ul{
            /*안보이는 ul 보여주기*/
            
            display: block;
        }
        #navi>li>ul:hover{
            display: block;
        }
       .board-category a{
        font-size: 15px
       }
       	.outer{
            background-color: black;
            color: white;
            width: 1000px;
            margin: auto; /*가운데 자동정렬*/
            margin-top: 50px; /*위로부터 50px 여백*/

        }

    </style>

</head>
<body>


	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

    <div class="header">
       
        <div class="header-inner">
            <div class="logo">
                <a href="${contextPath }"><img src="${contextPath}/resources/logo/temp.png"></a>
            </div>


            </div>
            <div class="util"><ul>
                <li><a href="login.me">로그인</a></li>
                <li>| <a href="enrollForm.me">회원가입</a></li>
            </ul>
            </div>
        </div>
  

    <div class="nav-area" align="center">
        <div class="menu">
            <div class="board">
                <ul id="navi">
                    <li><a href="">게시판</a>
                        <ul class="board-category">
                            <li><a href="${contextPath}/board.bo?currentPage=1&category=0">자유게시판</a></li>
                            <li><a href="">정보게시판</a></li>
                        </ul></li>
                </ul>
               
                </div>
            <div><a href="">운동법</a></div>
            <div><a href="list.mk">매장(후순위)</a></div>
            <div><a href="">개인기록(후순위)</a></div>
        </div>

    </div>

</body>
</html>