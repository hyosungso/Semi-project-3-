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
.menu{
display:inline-block;
width:150px;
height:50px;
}
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
	
	<!-- 로그인 영역 -->
    <div class="login-area">
        <!--로그인 전 후 화면 나누기-->    

        <!--로그인 전 : 아이디 비밀번호 입력 input과 로그인 버튼 (회원가입/id/pwd 찾기)-->
		<%if(loginUser == null) {%>
        <form id="login-form" action="<%=contextPath%>/login.me" method="post">
            <table>
                <!-- tr>(th+td)*2 -->
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="userId" required></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="userPwd" required></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <button type="submit">로그인</button>
                        <button type="button" onclick="enrollForm();">회원가입</button>
                    </th>
                </tr>
            </table>
        </form>
        
        <script>
        	function enrollForm(){
        		//회원가입 페이지로 이동시키는 함수 
        		//location.href = "이동시킬 경로"
        		//단순 페이지 이동 요청을 보내면 url에 프로젝트 디렉토리 구조가 노출되기 때문에 보안상 문제가 있을 수 있다.
        		//때문에 단순 페이지 이동요청도 servlet을 거쳐서 요청처리 해야한다.
        		//location.href = "<%=contextPath%>/views/member/memberEnrollForm.jsp";
        		
        		location.href = "<%=contextPath%>/enrollForm.me";
        		
        		
        	}
        
        </script>
        
        
        
	<%}else{ %>
        <!--로그인 후(loginUser가 null이 아닐때)-->
        <div id="user-info">
            <b><%=loginUser.getUserName()%>님 환영합니다.</b>
            <div align="center">
                <a href="<%=contextPath%>/myPage.me">마이페이지</a> 
                <a href="<%=contextPath %>/logout.me">로그아웃</a>
            </div>
        </div>
    </div>
    <%} %>
  	<!--float 해제하기-->
    <br clear="both">


    <!-- 메뉴바 -->
    <div class="nav-area" align="center">
        <div class="menu">
            <a href="<%=contextPath%>">HOME</a>
        </div>
        <div class="menu">
            <a href="<%=contextPath%>/list.no">공지사항</a>
        </div>

        <div class="menu">
            <a href="${contextPath}/board.bo?currentPage=1">일반게시판</a>
        </div>
        <div class="menu">
            <a href="">사진게시판</a>
        </div>
    </div>
	

</body>
</html>
