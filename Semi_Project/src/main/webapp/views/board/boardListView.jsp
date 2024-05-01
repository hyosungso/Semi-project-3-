<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="search-area">
	<input type="radio" name="category" value="10" id="normal" checked><label for="normal" >일반</label>
	<input type="radio" name="category" value="20" id="training"><label for="training">홈트</label>
	<input type="radio" name="category" value="30" id="gym"><label for="gym">헬스</label>
	<input type="radio" name="category" value="40" id="food"><label for="food">식단</label>
	<input type="text" name="keyword">
	<button onclick="searchboard();">검색</button>
	</div>
	<table border="1">
	<thead>
	<tr>
		<td>글번호</td>
		<td>카테고리</td>
		<td>제목</td>
		<td>작성자</td>
		<td>조회수</td>
		<td>추천수</td>
	</tr>
	</thead>
	<tbody></tbody>
	</table>
	
	<script>
	function searchboard(){
		//선택한 카테고리중 제목에 검색단어가 포함되어있는 글만 정렬(10개?)
		$.ajax({
			url : "search.bo",
			data : {
				category:$("input[name=category]:checked").val(),
				keyword:$("input[name=keyword]").val()
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
	</script>
	
</body>
</html>