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
%>

<%@ include file="/views/common/menubar.jsp"%>

</head>

<body>
	
	회원가입이 완료되었습니다.
	<br><br>
	아이디 :<%=userId %>
	이름 : <%=userName %>
	
	
	

</body>



</html>