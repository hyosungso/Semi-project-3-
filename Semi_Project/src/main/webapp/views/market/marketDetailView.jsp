<%@page import="com.kh.market.model.vo.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEALTHLIFE</title>

<style>	
	
	.form-area{
		margin : auto;
		width : 700px;
	}

	.slide-container{
		width: 900px;
		height : 500px;
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
	.quantity{
		width : 61px;
		height : 41px;
		font-size : 20px;
		text-align: center;
	}
	#quantity {
	font-weight : 500;
	font-size : 20px;
	color : white;
	width : 60px;
	display: inline-block;"
	}
	
}

	
</style>

<script type="text/javascript">
	function addToCart(){
	if(confirm('상품을 장바구니에 추가하시겠습니까?')){
		document.addForm.submit();
	}else{
		document.addForm.reset();
	}
	}
</script>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<div class="outer">
	<br><br><br>
		<input type="hidden" value="${listLength + 1 }" id="count" name="count">
		
		<div class="form-area">
		<form name="addForm" action="${contextPath }/views/market/addCart.jsp?id=${i.itemCode }" method="post">
		<table align="center" border="1">
			<tr>
				<td rowspan='5'>
				
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
				
				<td style="font-size : 13px; color : gray;"><del>원가 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${i.price}"  /> 원 </del><br>
					할인률 : ${i.discount }% <br>
					<p style="font-weight : 500; font-size : 20px; color : white">
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${i.totalPrice}" />원</p><br>
					<div id="quantity">수량 : </div>
					<input type="number" value="1" class="quantity" name="quantity" onclick="minLimit(this);" onkeyup="minLimit(this);">
					</td>
					
			</tr>

			<tr>
				<td>보관방법 : ${i.storageMethod } </td>
			</tr>
		</table>
		<br>
	 <div class="component">
	 
	 <div class="order">
<br>
	
	
	<a href="#" class="btn btn-info" onclick="addToCart()">상품추가&raquo;</a>
	<a href="${contextPath }/views/market/cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
	<a href="${contextPath }/list.mk" class="btn btn-secondary">상품목록&raquo;</a>
	
	
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
		
		<c:if test="${not empty loginUser && loginUser.authCode eq 'admin' }">
		<div align="center">
			<button class='btn btn-info' onclick="deleteItem();">상품 비활성화</button>
			<a href="${contextPath }/update.mk?itno=${i.itemCode}" class="btn btn-primary" role="botton">상품 업데이트</a>
			<script>
				function deleteItem(){
					var flag=confirm("상품 게시를 종료하시겠습니까?");
				if(flag){
					location.href="${contextPath}/delete.mk?itno=${i.itemCode }"
					}
				}
			</script>
			
		</div>
		</c:if>
	
	<br><br>
	</div>
	</form>
	</div>
	
	</div>

	<script>
		
		function minLimit(num){
			
			if(num.value<=0){
				alert('0 이하는 입력할수 없습니다..');
				num.value = 1;
			}
		}
	
		function movePage(num){
			var pageLocation=450;
			var pageNo=num-1;
			var count=document.getElementById("count").value;
			document.querySelector(".버튼"+num).addEventListener('click',function(){
				document.querySelector('.slide-container').style.transform= 'translate('+(-pageNo*pageLocation)+'px)';
				
				$('.slide-container').css("width",count*pageLocation+"px");
			})
		}
	
	
	</script>
	
</body>
</html>