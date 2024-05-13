<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HealthLife Market</title>

<style>
	.list-area{
		width: 770px;
		margin : auto;
		}
		.itemImg{
			boarder : 1px solid white;
			width : 220px;
			display : inline-block;
			margin : 15px;
		}
		.itemImg:hover{
			cursor : pointer;
			opacity : 0.7;
		}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">판매 상품</h2>
		<br>
		<div class="list-area">
		<c:if test="${not empty loginUser && loginUser.authCode eq 'admin' }">
		<div align="center">
			<button class='btn btn-info' onclick="location.href='${contextPath}/insert.mk'">상품등록</button>
			<br><br>
		</div>
		</c:if>
		
		
		<c:forEach var="it" items="${list }">
			<div class="itemImg" align="center" onclick="location.href='${contextPath }/detail.mk?itno=${it.itemCode }'">
			<img src="<%=contextPath%>${it.thumbnailImg}" width="200px" height="200px">
		
			${it.itemName } ${it.categoryName } <br>
			<del><fmt:formatNumber type="number" maxFractionDigits="3" value="${it.price }" />원</del>
			
			
			<p style="font-weight : 500; font-size : 20px; color : white">
			<fmt:formatNumber type="number" maxFractionDigits="3" value="${it.totalPrice}" />원</p>
			
			</div>
			</c:forEach>
		</div>
		
	</div>
	
</body>
</html>