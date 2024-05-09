<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	
	
	#form_area{
		margin : auto;
		width : 700px;
	}
	.slide-container{
		height : 450px;
	    padding: 0px;
	    margin: auto;
		transition : transform 0.5s;
		
	}
	.inner{
		width: 450px;
		height : 480px;
		padding: 0px;
		float : left;
	}
	.inner img{
			width: 100%;
			height : 100%;
	}
	.slide{
		width : 450px;
		height : 480px;
		overflow : hidden;
		padding: 0px;
	
	}

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
				
			<div class="slide">
				<div class="slide-container" id="imgContainer">
				<c:forEach  items="${itList }" var="it" >
					<div class="inner">
							<img src="${contextPath}${it.filePath }${it.changeName}">
						</div>
				</c:forEach>
					
					
				</div>
			</div>
			<div id="pagination">
			<c:forEach items="${itList }" varStatus="status">
			<button type="button" class="버튼${status.count }" onclick="movePage(${status.count})">${status.count }</button>
			</c:forEach>
			
			</div>
			
			 
				</td>
				<th>상품명 : ${i.itemName }</th>
			</tr>
			<tr>
				<th> 카테고리 : ${i.categoryName }
					</th>
			</tr>
			<tr>
				
				<th>가격 : ${i.price }</th>
			</tr>
			<tr>
				<td>상세설명 <br>
				<textarea rows="26" cols="30" name="itemDetail" style="resize:none;" readonly required>${i.itemDetail }</textarea> </td>
			</tr>
			
			
				
		</table>
		<br>
	 
	<br><br>
	</div>
	<script>
	function movePage(num){
		var pageLocation=450;
		var pageNo=num-1;
		document.querySelector(".버튼"+num).addEventListener('click',function(){
			document.querySelector('.slide-container').style.transform= 'translate('+(-pageNo*pageLocation)+'px)';
			
			$('.slide-container').css("width",num*pageLocation+"px");
		})
	}
	
	
	</script>
	
</body>
</html>