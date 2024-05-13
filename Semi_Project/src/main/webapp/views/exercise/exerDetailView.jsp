
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/views/common/menubar.jsp"%>
<div class="outer">
		<br>
		<h2 align="center">운동명운동명</h2>
		<br>
		
		<form action="detail.ex" method="post" enctype="multipart/form-data" id="detail-form">
			<table align="center" border="1">
				<tr>
					
					<td colspan="3">
						ㅈㅁㅈㅁㅈㅁ
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						<p>ㄴㅇㄴㅇㄴㅇ</p>
					</td>
				</tr>
				<c:forEach var="at" items="${atList}" varStatus="vs">
					<c:choose>
						<c:when test="${vs.index eq 0 }">
							<tr>
								<th>상세이미지</th>
								<td width="150" height="120">
									ㅇㅁㅈㅇㅁㅈ
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							ㅁㄴㅇㄹ
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				
			</table>
			<br><br>
			<script>
				
			
			</script>
			
			<div align="center">
				<button type="submit" style="display:none">글수정</button>
			</div>
		</form>
	
	</div>
</body>
</html>