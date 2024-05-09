<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%@ include file="/views/common/menubar.jsp"%>
	<div>
		<h2 align="center">DO EXERCISE (테스트)</h2>
		
		
		<div class="listarea">
		<ol  style="list-style-type: none">
			<c:forEach var="pt" items="${list}">
				<div class="photo" align="center" onclick="">
					<img src="https://img.animalplanet.co.kr/news/2023/05/24/700/4xy2vqn10re654bgc604.jpg" width="200px" height="150px">
					<li>
						사진이요<br>
						이름이요
					</li>
				</div>		
			</c:forEach>
			
			
			
		</ol>
		</div>
	</div>
</body>
</html>