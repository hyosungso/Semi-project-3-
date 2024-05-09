<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>입력페이지입력페이지</title>
<style>
input, textarea{
width:100%;
box-sizing:border-box;
}
#file-area div>input{
text-align:right;
}

</style>
</head>
<body>

<%@ include file="/views/common/menubar.jsp"%>

	<h1>입력페이지에맞는타이틀을작성하는구간</h1>
	<div class="outer">
		<br>
		<h2 align="center">INSERT VIEW</h2>
		<br>
		
		<form action="insert.ex" method="post"  id="enroll-area" enctype="multipart/form-data" >
			<table align="center" border="1">
				<tr>
					<th width="100">제목</th>
					<td colspan="3">
						<input type="text" name="title" placeholder="운동명입력구간" required>
					</td>
				</tr>
				
				<tr>
					<th>이미지</th>
					<td colspan="3" align="center"  width="200" height="170">
						<img id="titleImg"  width="200" height="170">
					</td>
				</tr>
				
				<tr>
					<th width="100">정보</th>
					<td colspan="3" height="100">
						<input type="text" name="inf" height="177" placeholder="강도, 시간, 빈도 등 자유롭게 작성" required>
					</td>
				</tr>
				
				<tr>
					<th width="100">종류</th>
					<td>
						<select name="menu" id="type" >
                			<option value="sum">유산소</option>
                			<option value="meat">근력강화</option>
                			<option value="san">중심잡기</option>
            			</select>
					</td>
				
					<th width="100">부위</th>
					<td>
						<select name="menu" id="part" >
                			<option value="head">머리</option>
                			<option value="shou">어깨</option>
                			<option value="leg">다리</option>
            			</select>
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea name="content" rows="10" style="resize:none;" required></textarea>
					</td>
				</tr>
				<tr>
					<th>상세이미지</th>
					<td width="150" height="120">
						<img id="contentImg1" >
					</td>
					<td width="150" height="120">
						<img id="contentImg2">
					</td>
					<td width="150" height="120">
						<img id="contentImg3">
					</td>
				</tr>
			</table>
			<br><br>
			
			<div id="file-area" align="center">
				<input type="file" id="file1" name="file1" onchange="loadImg(this,1);" required> 
				<input type="file" id="file2" name="file2" onchange="loadImg(this,2);">
				<input type="file" id="file3" name="file3" onchange="loadImg(this,3);">
				<input type="file" id="file4" name="file4" onchange="loadImg(this,4);">
			</div>
			<div align="center">
				<button type="submit">글작성</button>
			</div>
		</form>
		<script>
			$(function(){
				$("#titleImg").click(function(){
					$("#file1").click();
				});
				$("#contentImg1").click(function(){
					$("#file2").click();
				});
				$("#contentImg2").click(function(){
					$("#file3").click();
				});
				$("#contentImg3").click(function(){
					$("#file4").click();
				});
				//$("#file-area").hide(); 막혔던 이유 : body 대신 head에 script 설정을 한 후 이미지 설정 사이즈(메인)에 하고나서 hide를 비활성화하니 작동됨
			});
			 
			function loadImg(inputFile,num){
				if(inputFile.files.length == 1){
					var reader = new FileReader();
					reader.readAsDataURL(inputFile.files[0]);
					reader.onload = function(e){
						console.log(e.target.result);
						
						switch(num){
							case 1 : $("#titleImg").attr("src",e.target.result); break;
							case 2 : $("#contentImg1").attr("src",e.target.result); break;
							case 3 : $("#contentImg2").attr("src",e.target.result); break;
							case 4 : $("#contentImg3").attr("src",e.target.result); break;
						
						}
					}
				}else{
					switch(num){
						case 1 : $("#titleImg").attr("src",null); break;
						case 2 : $("#contentImg1").attr("src",null); break;
						case 3 : $("#contentImg2").attr("src",null); break;
						case 4 : $("#contentImg3").attr("src",null); break;
					}
				}
			}
		</script>
	</div>
</body>
</html>