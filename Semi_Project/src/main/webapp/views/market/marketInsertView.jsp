<%@page import="com.kh.board.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script> <!-- 슬라이드 지원 -->


<style>
	#form_area{
		margin : auto;
		width : 700px;
	}
	
</style>

</head>
<body>
	
	<%@ include file = "/views/common/menubar.jsp" %>
	<div class="outer">
	<br>
		<h2 align="center">상품 등록 페이지</h2>
		<br>
		<div id="form_area">
		<form action="${contextPath }/insert.mk" method="post" enctype="multipart/form-data" id="insert-form"> 
		<table align="center" border="1">
			<tr>
				<td rowspan=4>
				 <img id="productImg" width="450px" height="500px">
				</td>
				<th>상품명 : <input type=text name="productName" required></input></th>
			</tr>
			<tr>
				<th> 카테고리 : <select>
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
		<div id="img-area">
		<label for="itemImg1">상품이미지</label> <input type=file id="itemImg1" name="itemImg1" onchange="loadImg(this,1);" required><br>
		</div>
		
		<button type="button" onclick="addImg();">사진 추가 입력</button> <br>
		<button type="submit" align="center">등록</button>
		<input type="hidden" value="2" id="count" name="count">
	
	<br><br>
	
	</form>
	</div>
	<script>
		
	
		$(function(){
			$("#productImg").click(function(){
				$("#itemImg").click();
				
			});
		});
		
		function loadImg(inputFile,num){
			if(inputFile.files.length==1){
				var reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload =function(e){
						$("#productImg").attr("src",e.target.result);
					}
				}else{
					$("#productImg").attr("src",null);
			}
		}
		function addImg(){
			var count=document.getElementById("count");
			$("#img-area")
			.append("<label for='itemImg"+count.value+"'>상품이미지</label> <input type=file id='itemImg"+count.value+"' name='itemImg"+count.value+"' onchange='loadImg(this,"+count.value+");'><br>");
			count.value++;
		}
	</script>
	
	
	</div>
	
</body>
</html>