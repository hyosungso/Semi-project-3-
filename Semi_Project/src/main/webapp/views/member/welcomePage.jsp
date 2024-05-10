<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<%
	String userId = (String)request.getParameter("userId");
	String userName = (String)request.getParameter("userName");
	String nickName = (String)request.getParameter("nickName");
	String email = (String)request.getParameter("email");
	String phone = (String)request.getParameter("phone");
%>

<%@ include file="/views/common/menubar.jsp"%>

</head>

<body>
	
	<div align="center">

        <h2> <%=userName %>님 회원가입을 축하드립니다 !</h2>

        <table border="1">
            <tr>
                <td>회원아이디</td>
                <td><%=userId %></td>
            </tr>
            <tr>
                <td>회원명</td>
                <td><%=userName %></td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><%=nickName %></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><%=email %></td>
            </tr>
            <tr>
                <td>휴대폰</td>
                <td><%=phone %></td>
            </tr>
            
        </table>



    </div>
	
	
	

</body>



</html>