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
				<td rowspan='4'>
				
			<div style="width : 450px; height : 500px; overflow : hidden">
				<div class="container" id="imgContainer">
					<div class="inner">
						<img id="productImg1">
					</div>
					
				</div>
			</div>
			<div id="pagination">
			<button type="button" class="버튼1" onclick="movePage(1)">1</button>
			</div>
			
			 
				</td>
				<th>상품명 : <input type=text name="productName" required></input></th>
			</tr>
			<tr>
				<th> 카테고리 : <select name="category">
					<c:forEach items="${cList }" var="cList">
					<option value="${cList.categoryNo}">${cList.categoryName}</option>
					</c:forEach>
					 
					</select>
					</th>
			</tr>
			<tr>
				
				<th>가격 : <input type="number" name="price" required></th>
			</tr>
			<tr>
				<td>상세설명 <br>
				<textarea rows="26" cols="30" name="itemDetail" style="resize:none;" required></textarea> </td>
			</tr>
			
			
				
		</table>
		<br>
	 
	<br><br>
	</div>
	
</body>
</html>