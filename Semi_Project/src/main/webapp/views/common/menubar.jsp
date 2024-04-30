<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>

</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	<script>
		//알림메세지 띄워주기 
		//로그인성공 또는 null - 값 자체로 반환되기때문에 문자열 " "처리 해야함
		var msg = "<%=alertMsg%>";
		
		if(msg!="null"){ //null이 아니면 알림메세지 띄워라
			alert(msg); 
			//알림 띄워주고 해당 메세지 지워주기
			<%session.removeAttribute("alertMsg");%>
		}
	</script>
	
	

</body>
</html>