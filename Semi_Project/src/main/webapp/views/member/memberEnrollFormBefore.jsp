<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
        body {
			background-color: #222; /* 검정 배경 */
			color: #fff; /* 흰색 글꼴 색상 */
			font-family: 'Arial', '맑은 고딕', sans-serif;
		}

		.container {
			width: 90%; /* 화면 너비의 90% */
			margin: 0 auto;
			padding: 30px;
			border-radius: 10px; /* 모서리 둥글게 */
		}

		h1 {
			font-size: 32px;
			font-weight: bold;
			margin-bottom: 20px;
			text-align: center;
		}

		.terms {
			border: 1px solid #444; /* 회색 테두리 */
			padding: 20px;
			overflow-y: auto;
			max-height: 500px;
			line-height: 1.6; /* 글자 간격 */
		}

		.checkbox {
			margin-top: 20px;
			text-align: center;
		}

		.checkbox label {
			display: block;
			margin-bottom: 5px;
			cursor: pointer;
		}

		.checkbox input[type="checkbox"] {
			vertical-align: middle;
		}

		.checkbox label input[type="checkbox"] {
			margin-right: 5px;
		}

		.buttons {
			margin-top: 20px;
			text-align: center;
		}

		.button {
			padding: 10px 20px;
			background-color: #333; /* 짙은 회색 버튼 배경 */
			color: #fff;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			transition: background-color 0.3s; /* hover 효과 */
		}

		.button:hover {
			background-color: #555; /* hover 시 밝은 회색으로 변화 */
		}

		.disabled {
			opacity: 0.5;
			cursor: default;
		}

		

		
    </style>



</head>


<body>

	
	<form action="enrollForm.me" method="post">
	
		<div class="container">
        <h1>(주)헬스라이프 회원가입 약관동의</h1>
        <div class="terms">
            <p>약관 내용을 여기에 작성합니다. 본 약관은 헬스라이프 서비스 이용에 관한 권리와 의무를 규정하는 내용입니다. 약관 내용을 꼼꼼하게 읽고 동의하셔야만 서비스를 이용하실 수 있습니다.</p>
            <p>...</p>
            <p>...</p>
        </div>
        <div class="checkbox">
            <label for="agree">
                <input type="checkbox" id="agree" name="agree">
                위 이용약관에 동의합니다.
            </label>
        </div>
    	
    	 <div class="buttons">
            <button class="button" id="nextButton" onlcick="enrollForm();">다음</button>
            <button class="button disabled" id="backButton">뒤로</button>
        </div>
    	
    	
    	
    	</div>
    	
		
	</form>

</body>

	<script>
		function enrollForm(){
			
			location.href = "/WHAT/enrollForm.me"
			
		}
	
	</script>

</html>