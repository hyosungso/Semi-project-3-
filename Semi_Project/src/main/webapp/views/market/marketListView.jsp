<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HealthLife Market</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<div class="outer">
		<c:forEach var="it" items="${list }">
		<h2 align="center">판매 상품</h2>
		<div class="list-area">
			<div class="itemImg" align="center" onclick="location.href='${contextPath }/detail.mk?tno=${it.itemNo }'">
			
			<img src="<%=contextPath%>resources/marketing/${it.itemNo}" width="200px" height="150px">
		<p>
			${it.itemName } ${it.category } <br>
			${it.price }
		</p>
			</div>
		</div>
		</c:forEach>
	</div>

</body>
</html>