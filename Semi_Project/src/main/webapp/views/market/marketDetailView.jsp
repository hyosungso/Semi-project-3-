<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.form-area{
		margin : auto;
		width : 700px;
	}
	.container{
		width: 960px;
		height : 500px;
		transition : transform 0.5s;
	}
	.inner{
		width: 480px;
		height : 480px;
		float : left;
	}
	.inner img{
			width: 100%;
			height : 100%;
	}
	.slide{
		width : 480px; 
		height : 480px; 
		overflow : hidden
	}
	.component_title{
		font-weight : lighter;
		font-size : 13px; 
	}
	.component td{
		width : 80px;
		textalign : left;
		padding : 0 0 0 5px;
	}

	.order{
		float : right;
	}
	
	.order button{
		width : 100px;
		height : 45px;
		font-size : 17px;
		font-weight : bold;
		border-radius: : 10px;
		
	}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<div class="outer">
	<br>
		<h2 align="center">상품 상세보기</h2>
		
		<div class="form-area">
		<table align="center" border="1">
			<tr>
				<td rowspan='4'>
				
			<div class="slide">
				<div class="container" id="imgContainer">
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
				
				<th>가격 : ${i.price }원</th>
			</tr>
			<tr>
				<td>상세설명 <br>
				<textarea rows="26" cols="30" name="itemDetail" style="resize:none;" readonly required>${i.itemDetail }</textarea> </td>
			</tr>
		</table>
		<br>
	 <div class="component">
	 
	 <div class="order">
<!-- 	 	<input type="button" value="주문하기" style=" background-color: orange;"> -->
<!-- 	 	<input type="button" value="장바구니"> -->

		<button style=" background-color: orange;">주문하기</button>
		<button>장바구니</button>
	 </div>
	 <br><br>
	<h3>영양성분</h3>
		<table>
			<tbody>
				<tr class="component_title">
					<td>열량</td>
					<td>단백질</td>
					<td>나트륨</td>
					<td>탄수화물</td>
					<td>지방</td>
					<td>트랜스지방</td>
					<td>포화지방</td>
					<td>콜레스테롤</td>
					<td>당류</td>
				</tr>
				<tr class="component_content">
					<td>${c.calorie }kcal</td>
					<td>${c.protin }g</td>
					<td>${c.salt }mg</td>
					<td>${c.carbo }g</td>
					<td>${c.fat }g</td>
					<td>${c.transFat }g</td>
					<td>${c.saturatedFat }g</td>
					<td>${c.chol }mg</td>
					<td>${c.sugar }g</td>
				</tr>
			</tbody>
		</table>
	<br><br>
	

	
	<br><br>
	</div>
	</div>
	</div>
	<script>
	function movePage(num){
		var pageLocation=480;
		var pageNo=num-1;
		document.querySelector(".버튼"+num).addEventListener('click',function(){
			document.querySelector('.container').style.transform= 'translate('+(-pageNo*pageLocation)+'px)';
			
		$('.container').css("width",num*pageLocation+"px");
		})
	}
	
	
	</script>
	
</body>
</html>