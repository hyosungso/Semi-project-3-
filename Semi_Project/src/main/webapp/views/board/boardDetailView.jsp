<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.detail-area{
width:80%;
height:600px;
margin:auto;
}
.detail-area table{
width:90%;

}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<br>
	<div align="center" class="detail-area">
	<table border="1">
	<thead>
	<tr>
		<th width="10%">작성자</th>
		<th width="15%">${b.boardWriter}</th>
		<th width="45%" style="text-align:center">${b.reviseDate }</th>
		<th width="10%">조회수</th>
		<th width="5%">${b.count }</th>
		<th width="10%">추천수</th>
		<th width="5%">${b.recommend }</th>
	</tr>
	<tr>
		<th colspan="7" style="text-align:left">${b.boardTitle }</th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td colspan="7"><p>${b.boardContent}</p></td>
	</tr>
	<tr>
	<td colspan="7" style="text-align:center"><button>추천</button></td>
	</tr>
	</tbody>
	</table>
	</div>
</body>
</html>