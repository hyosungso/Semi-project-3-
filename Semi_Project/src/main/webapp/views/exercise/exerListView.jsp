<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동게시판 제목입니다</title>
<style>
        div{
            border: 3px solid rgba(142, 170, 223, 0.37);
            margin: 15px;
            
        }
        li{
            padding: 10px;
        }
        img{
            margin:15px;vertical-align: middle;
        }
        img span{
            display:table-cell;
            vertical-align: middle;
            
        }
    </style>
</head>
<body>
	

	<div>
		<h2 align="center">DO EXERCISE (테스트)</h2>
		
		<div align="center">
			<button onclick="location.href='insert.ex'">작성해보기(test 없애도 됨)</button>
		</div>
		
		<div class="listarea">
		<ol  style="list-style-type: none">
			<c:forEach var="e" items="${elist}">
				<div class="exercise" align="center" onclick="detail.ex?eno=${e.exerNo}">
					<img src="/HEALTHLIFE${e.titleImg}" width="200px" height="150px" style="vertical-align: middle">
					<span> 제목 / </span>
				
				<table border="1" cellpadding="0" cellspacing="0" width="500">
				<tr>
					<td>운동번호</td>
					<td>운동명</td>
					<td>운동종류</td>
					<td>운동정보</td>
					<td>운동내용</td>
					<td>운동부위</td>
				</tr>
				
				
				<tr>
					<td>${e.exerNo}번호</td>
					<td>${e.exerTitle}운동이름</td>
					<td>${e.exerType}운동종류</td>
					<td>${e.exerInf}운동정보</td>
					<td>${e.exerContent}운동내용</td>
					<td>${e.exerPart}운동부위</td>
				</tr>
			</table>
				</div>		
			</c:forEach>
		</ol>
		</div>
	</div>
</body>
</html>