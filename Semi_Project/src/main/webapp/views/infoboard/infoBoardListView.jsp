<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보게시판</title>
<style>
#categoryList {
	width: 540px;
	height: 60px;
	align: left;
	text-align: center;
}

#categoryList button {
	width: 75%;
	height: 35px;
}

button[name=category]:hover {
	background-color: lightblue;
}

.infoboard-area {
	width: 1200px;
}

.infoboard-area th {
	text-align: center;
}

.infoboard-area>tbody tr:hover {
	background-color: lightgrey;
	cursor: pointer;
}

.ctSelected {
	background-color: blue;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<br>
	<div class=infoboard>
		<!-- 카테고리 시작 -->
		<table border="1" class="infoboard-area" align="center">
			<thead>
			<tr>
				<th colspan="6">
					<table id="categoryList">
						<tr>
							<td>
							<button name="category" value="0">전체</button>
							</td>
							<c:forEach items="${ctList}" var="ft">
							<td>
							<button name="category" value="${ft.categoryNo}">${ft.categoryName }</button>
							</td>
							</c:forEach>
						</tr>
					</table>
				</th>
				<th>
				<c:if test="${!empty loginUser}">
				<button onclick="location.href='Infoinsert.bo'">글작성</button>
				</c:if>
				</th>
				</tr>
				<tr>
					<th width="50px">글번호</th>
					<th width="50px">카테고리</th>
					<th width="400px">제목</th>
					<th width="80px">작성자</th>
					<th width="50px">조회수</th>
					<th width="50px">추천수</th>
					<th width="100px">작성일</th>

				</tr>
			</thead>
			<!-- 카테고리 끝 -->
			<tbody>
			<c:forEach items="${fList}" var="f">
				<tr>
					<td>${f.boardNo}</td>
					<td>${f.category}</td>
					<td>${f.boardTitle}</td>
					<td>${f.boardWriter}</td>
					<td>${f.count}</td>
					<td>${f.recommend}</td>
					<td>${f.uploadDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
    <script> 

	function(){
		$("button[name=category]").each(function(){
			if($(this).val()==${category}){
				$(this).attr("disabled",true);
				$(this).addClass("ctSelected");
			}
		});
		$("input[name=sortBy]").each(function(){
			if($(this).val()=="${sort}"){
				$(this).attr("checked",true);
			}
		});
		$("button[name=category]").click(function(){
			var category=$(this).val();
			var sortBy=$("input[name=sortBy]:checked").val();
			location.href="Infoboard.bo?currentPage=1&category="+category+"&sort="+sortBy;
		});
		$(".board-area>tbody tr").click(function(){
			var bno=$(this).children().eq(0).text();
			location.href="detail.bo?bno="+bno;
		});
	});
	</script>
	<!-- 검색창 -->
	
	<br>
	<div class="paging" align="center">
	<c:choose>
	<c:when test="${pi.currentPage eq 1}">
	<button disabled>이전</button>
	</c:when>
	<c:otherwise>
	<button onclick="location.href='infoboard.bo?currentPage=${pi.currentPage-1}&category=${category}&sort=${sort}'">이전</button>
<<<<<<< HEAD
	
	
=======
>>>>>>> refs/remotes/origin/main
	<c:forEach var = "i" begin="${pi.startPage}" end="${pi.endPage}">
	<button onclick="location.href='infoboard.bo?currentPage=${i}&category=${category}&sort=${sort}'">${i}</button>
	
	</c:forEach>
<<<<<<< HEAD
	</c:otherwise>
=======
	
	</c:otherwise>
	
>>>>>>> refs/remotes/origin/main
	</c:choose>
	
	<c:choose>
	<c:when test="${pi.currentPage eq pi.maxPage}">
	<button disabled>다음</button>
	</c:when>
	<c:otherwise>
	<button onclick="location.href='infoboard.bo?currentPage=${pi.currentPage+1}&category=${category}&sort=${sort}'">다음</button>
	</c:otherwise>
	</c:choose>
	
	<br><br>
	
	<form action="infosearch.bo">
	<select name="searchCategory">
	<option value="title">글제목</option>
	<option value="content">글내용</option>
	<!--<option value="nickname">닉네임</option>-->
	</select>
	
	<input type="text" name="search" style="width:350px">
	<button type="submit">검색</button>
	</form>
	</div>
	
	

</body>
</html>