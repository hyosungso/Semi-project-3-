<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#categoryList{
	width:540px;
	height:60px;
	align:left;
	text-align:center;
	}
	#categoryList button{
	width:75%;
	height:35px;
	}
	button[name=category]:hover{
	background-color:lightblue;
	}
	.board-area{
	width:1200px;
	}
	.board-area th{
	text-align:center;
	}
	.board-area>tbody tr:hover{
	background-color:lightgrey;
	cursor:pointer;
	}

	.ctSelected{
	background-color:blue;
	color:white;
	}

</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<br>
	<div class="board">
	<table border="1" class="board-area" align="center">
	<thead>
	<tr>
		<th colspan="6">
		<table id="categoryList">
		<tr>
		<td><button name="category" value="0">전체</button></td>
		<c:forEach items="${ctList}" var="ct">
		<td><button name="category" value="${ct.categoryNo}">${ct.categoryName }</button></td>
		</c:forEach>
		</tr>
		</table>
		</th>
		<th>
		<c:if test="${!empty loginUser }">
		<button onclick="location.href='insert.bo'">글작성</button>
		</c:if>
		</th>
	</tr>
	<tr>
		<th width="50px">글번호</th>
		<th width="50px">카테고리</th>
		<th width="300px">제목</th>
		<th width="80px">작성자</th>
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
	</div>
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
		$("button[name=category]").each(function(){
			if($(this).val()==${category}){
				$(this).attr("disabled",true);
				$(this).addClass("ctSelected");
			}
		});
		$("button[name=category]").click(function(){
			var category=$(this).val();
			location.href="board.bo?currentPage=1&category="+category;
		});
		$(".board-area>tbody tr").click(function(){
			var bno=$(this).children().eq(0).text();
			location.href="detail.bo?bno="+bno;
		});
	});
	</script>
	<!-- 검색창도 이 구역에서 만들예정 -->
	<br>
	<div class="paging" align="center">
	<c:choose>
		<c:when test="${pi.currentPage eq 1}">
			<button disabled>이전</button>
		</c:when>
		<c:otherwise>
			<button onclick="location.href='board.bo?currentPage=${pi.currentPage-1}&category=${category}'">이전</button>
		</c:otherwise>
	</c:choose>
		<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
			<button onclick="location.href='board.bo?currentPage=${i}&category=${category}'">${i}</button>
		</c:forEach>
	<c:choose>
		<c:when test="${pi.currentPage eq pi.maxPage}">
			<button disabled>다음</button>
		</c:when>
		<c:otherwise>
			<button onclick="location.href='board.bo?currentPage=${pi.currentPage+1}&category=${category}'">다음</button>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>