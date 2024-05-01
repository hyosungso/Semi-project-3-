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
	#categoryList button{
	width:75%;
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
	<br>
	<div class="search-area">
	<table id="categoryList" border="1">
	<tr>
		<td><button name="category" value="0">전체</button></td>
		<!-- 나중에 c:forEach를 통해 카테고리를 가져와서 배치 -->
		<td><button name="category" value="10">일반</button></td>
		<td><button name="category" value="20">홈트</button></td>
		<td><button name="category" value="30">헬스</button></td>
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
		<td>${b.boardNo}</td>
		<td>${b.category}</td>
		<td>${b.boardTitle}</td>
		<td>${b.boardWriter}</td>
		<td>${b.count}</td>
		<td>${b.recommend}</td>
		<td>${b.uploadDate}</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<script>
	function searchboard(){
		//선택한 카테고리중 제목에 검색단어가 포함되어있는 글만 정렬(10개?)
		$.ajax({
			url : "search.bo",
			data : {
				
			},
			type : "post",
			success : function(){
				
			},
			error : function(){
				console.log($("input[name=keyword]").val());
				console.log("아직 안만들었으니 없지");
			}
		});
	}
	$(function(){
		$("button[name=category]").click(function(){
			$("button[name=category]").each(function(){
				$(this).removeClass("ctSelected");
			})
			$(this).addClass("ctSelected");
		});
	});
	</script>
	
</body>
</html>