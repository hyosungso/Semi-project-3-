<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.part td{
width:70px;
}
.part td>label{
width:50px;
}
</style>
</head>
<body>
<%@ include file="/views/common/menubar.jsp" %>
	<div align="center">
		<h2 align="center">운동 기록</h2>
		<form action="${contextPath }/memorialsInsert.me" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mUserId" value="${loginUser.userId }" required>
			<table border="1">
				<tr align="center">
					<td colspan="2">날짜 <br> <input type="date" name="memorialsDate">
						<br>
					</td>
				</tr>
				<tr>
					<td>몇 시간? : <select name="memorialsTime">
							<option value="30분">30분</option>
							<option value="40분">40분</option>
							<option value="50분">50분</option>
							<option value="1시간">1시간</option>
							<option value="1시간 30분">1시간 30분</option>
							<option value="2시간">2시간</option>
							<option value="2시간 30분">2시간 30분</option>
							<option value="3시간">3시간</option>
							<option value="3시간 30분">3시간 30분</option>
							<option value="4시간">4시간</option>
					</select>
					</td>
					<td>오늘 어느 부위 했어? <br>
						<table class="part">
						<tr>
							<td><input type="checkbox" name="memorialsParts"
							 id="chest" value="chest"><label for="chest">가슴</label></td>
							<td><input type="checkbox" name="memorialsParts"
							 id="arm" value="arm"><label for="arm">팔</label></td>
							<td><input type="checkbox" name="memorialsParts"
							 id="back" value="back"><label for="back">등</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" name="memorialsParts"
							 id="shoulder" value="shoulder"><label for="shoulder">어깨</label></td>
							<td><input type="checkbox" name="memorialsParts"
							 id="lowerbody" value="lowerbody"><label for="lowerbody">하체</label></td>
							<td><input type="checkbox" name="memorialsParts"
							 id="cardio" value="cardio"><label for="cardio">유산소</label></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2">오운완 이미지 파일 업로드 <br> <input type="file"
						name="memorialsImg">
					</td>
				</tr>
				<tr>
					<td colspan="2">특이사항 및 메모 <br>
					<textarea rows="5" style="resize:none; width:100%" name="memorialsContent"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">오늘 나에게 주는 점수! <br> <input
						type="range" name="MemorialsSelfScore" oninput="document.getElementById('score').innerHTML=this.value;">
						<span id="score">50</span>
					</td>
				</tr>
			</table>
			<br>
			<button type="submit">운동일지 올리기!</button>
		</form>
		<br>
		<br>
		<form action="MemorialsMyPage.me" method="post">
			<button type="submit">내 운동일지 확인하기</button>
		</form>
	</div>








</body>
</html>