
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exercise_DetailView</title>
    <style>
        th{
            background-color:rgba(175, 45, 45, 0.884);
            color: rgba(224, 238, 238, 0.829);
        }
    </style>
</head>
<body>
    <div class="outer">
		<br>
        <!--button onclick="history.back()">Go Back</button>-->
        <label onclick="location.href='https://www.google.com';">←뒤로가기</label>
		
		<br>
		
		<form action="${contextPath}" method="post" enctype="multipart/form-data" id="detail-form">
			
			<table align="center" border="5" width="67%">
				<c:forEach var="pt" items="${ptList}" varStatus="vs">
					<h2 align="center">${e.exerTitle}운동이름</h2>
					<c:choose>
						<c:when test="${vs.index eq 0}">
							<tr>
								<th colspan="3"><!-- 메인사진 -->
									<img src="${contextPath}${pt.filePath}${pt.changeName}" width="100%">
								</th>
                			</tr> 
						</c:when>
						<c:otherwise>
                            <tr>
                                <td colspan="2">
                                    <!--img src="birdfolder/긴사진예시.jpg" width="24%" 넣은 사진 개수만큼 크기변경 -->
                                    <img src="contentImg${vs.index}" width="100/${vs.index}%">
                                </td>
                            </tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<tr>
				    <td colspan="3">
                    	<img src="${contextPath}/resources/logo/temp.png" width="100%"> 
                    	<!--없을때는 temp사진 출력-->
                    </td>
                </tr>
                <tr>
					<td colspan="3">
                        ${e.exerInf}운동정보
                    </td>
				</tr>
				<tr>
					<th width="30%">운동종류</th>
					<td colspan="3">
						<p>${e.exerType}</p>
					</td>
				</tr>
                <tr onclick="location.href='해당부위 SELECT 위치로'">
					<th>운동부위</th>
					<td colspan="3">
						<p>${e.exerPart}</p>
					</td>
				</tr>
                <tr>
                    <td colspan="3">
                        ${e.exerContent}운동내용
                    </td>
                </tr>
                
			</table>
			<br><br>
			<script>
			</script>
			<div align="center">
				<c:if test="${!empty loginUser.getAuthCode() eq 'admin'}"><!-- 관리자만 작성가능  -->
					<button type="submit">글작성</button>
				</c:if>
			</div>
		</form>
	</div>
</body>
</html>