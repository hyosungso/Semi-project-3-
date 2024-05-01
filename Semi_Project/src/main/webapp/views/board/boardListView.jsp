<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#categoryList{
	width:50%;
	height:60px;
	align:left;
	text-align:center;
	}
	#categoryList input{
	width:100%;
	height:35px;
	}
	#categoryList button{
	width:75px;
	height:35px;
	}
	.ctSelected{
	background-color:blue;
	color:white;
	}
	button[name=category]:hover{
	background-color:lightblue;
	}
	.board-area{
	width:100%;
	}
	.board-area th{
	text-align:center;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="search-area">
	<table id="categoryList" border="1">
	<tr>
		<td><button name="category" value="0">전체</button></td>
		<!-- 나중에 c:forEach를 통해 카테고리를 가져와서 배치 -->
		<td><button name="category" value="10">일반</button></td>
		<td><button name="category" value="20">정보</button></td>
		<td><button name="category" value="30">질문</button></td>
		<td><button name="category" value="40">식단</button></td>
	</tr>
	</table>
	</div>
	<br>
	<table border="1" class="board-area">
	<thead>
	<tr>
		<th width="50px">글번호</th>
		<th width="50px">카테고리</th>
		<th width="300px">제목</th>
		<th width="100px">작성자</th>
		<th width="50px">조회수</th>
		<th width="50px">추천수</th>
		<th width="100px">작성일</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${bList}" var="b">
	<tr>
		<td>${b.boardNo }</td>
		<td>${b.category }</td>
		<td>${b.boardTitle }</td>
		<td>${b.boardWriter }</td>
		<td>${b.count }</td>
		<td>${b.recommend }</td>
		<td>${b.uploadDate }</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<script>
	$(function(){
		$("button[name=category]").click(function(){
			var category=$(this).val();
			location.href="${contextPath}/board.bo?currentPage=1&category="+category;
		});
		
	});
	</script>
	
</body>
</html>