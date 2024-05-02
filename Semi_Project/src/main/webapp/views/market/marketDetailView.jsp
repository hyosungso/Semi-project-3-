<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<div class="outer">
	<br>
		<h2 align="center">상품 상세보기</h2>
		<table align="center" border="1">
			<tr>
				<td rowspan=3>
				 <img src="<%=contextPath%>/resources/marketImg/${item.itemCode }.jpg">
				</td>
				<th>${item.itemName }</th>
			</tr>
			<tr>
				
				<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price }" />원</th>
			</tr>
			<tr>
				<td>${item.itemDetail }</td>
			</tr>
				
		</table>
	 
	<br><br>
	</div>
	
</body>
</html>