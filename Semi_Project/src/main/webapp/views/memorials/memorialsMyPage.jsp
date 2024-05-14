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
	<div align="center">
		<table border="1">
			<tr align="center">
				<td colspan="2">GREAT!</td>
			</tr>
			<tr>
				 <tr>
                <td colspan="2"><%--  <img src="<%= memorialsAttachment.getMemorialsImgPath() %>" alt="운동 사진"> --%></td>
            </tr>
            <tr>
                <td>날짜: ${memorials.memorialsDate } <%--  <%= memorials.getMemorialsDate() %> --%></td>
            </tr>
            <tr>
                <td>운동 부위: ${memorials.memorialsParts}<%--  <%= memorials.getMemorialsParts() %> --%></td>
            </tr>
            <tr>
                <td>운동 시간: ${memorials.memorialsTime}<%--  <%= memorials.getMemorialsTime() %> --%></td>
            </tr>
            <tr>
                <td>특이사항: ${memorials.memorialsContent}<%--   <%= memorials.getMemorialsContent() %> --%></td>
            </tr>
            <tr>
                <td>운동 점수: ${memorials.memorialsSelfScore}<%--  <%= memorials.getMemorialsSelfScore() %> --%></td>
            </tr>
            <tr>
                <td>
                    <button>수정하기</button>
                    <button>삭제하기</button>
                </td>
            </tr>
        </table>
    </div>
</html>

