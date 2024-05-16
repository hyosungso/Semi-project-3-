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
		body,ul,li {
	  margin: 0;
	  padding: 0;
	  list-style: none;
		}
		body {
		  position: relative;
		}
		.a {
		  color: white;
		  text-decoration: none;
		}
		.menu-box-1 {
		  position: fixed;
		  width: 15%;
		 
		  top: 30%;
		  left: -10%;
		  background-color: rgb(41 ,41 ,41);
		  transition: left 1s;
		}
		.menu-box-1:hover {
		  left: 0;
		  transition: left 1s;
		}
		.menu-box-1 > ul {
		  position: relative;
		  width: 100%;
		  top: 10%;
		}
		.menu-box-1 > ul > li {
		  padding-left: 10%;
		}
		.menu-box-1 > ul > li:hover {
		  background-color: red;
		}
		.menu-box-1 ul > li > a {
		  display: block;
		  padding: 10px;
		}
		.menu-box-1 ul > li:hover > a {
		  background-color: red;
		  color: white;
		}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<div class="outer">
	<nav class="menu-box-1">
  <div class="button">
  <ul>
  <li align="right"><<&nbsp;&nbsp;<li>
  </ul>
  <ul>
  	<li><a href="${contextPath }/list.mk?sort=topSal" class="a">전체품목</a></li>
  </ul>
  	<c:forEach items="${cList }" var="c">
  <ul>
    <li>
      <a href="${contextPath }/list.mk?sort=topSal&category=${c.categoryNo}" class="a">${c.categoryName }</a>
    </li>
    </ul>
    </c:forEach>
    </div>
    </nav>
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
			<p>
			판매량 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${it.salesVol }" />
			</p>
			<p>평점 : ${it.score }</p>			
			<p style="font-weight : 500; font-size : 20px; color : white">
			<fmt:formatNumber type="number" maxFractionDigits="3" value="${it.totalPrice}" />원</p>
			
			</div>
			</c:forEach>
		</div>
		
	</div>
	
</body>
</html>