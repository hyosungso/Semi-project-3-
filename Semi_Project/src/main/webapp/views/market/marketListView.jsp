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
		<h2 align="center">판매 상품</h2>
		
		<div class="list-area">
		<c:forEach var="it" items="${list }">
			<div class="itemImg" align="center" onclick="location.href='${contextPath }/detail.mk?tno=${it.itemCode }'">
			<img src="<%=contextPath%>/resources/marketImg/${it.itemCode}.jpg" width="200px" height="150px">
		<p>
			${it.itemName } ${it.categoryName } <br>
			<fmt:formatNumber type="number" maxFractionDigits="3" value="${it.price }" />원
			
		</p>
			</div>
			</c:forEach>
		</div>
		
	</div>
	
</body>
</html>