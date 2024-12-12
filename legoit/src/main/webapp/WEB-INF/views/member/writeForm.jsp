<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 0;
}

.text-center {
	text-align: center;
	margin-top: 2rem;
}

.card {
	background-color: #ffffff;
	padding: 2rem;
	border-radius: 15px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	max-width: 500px;
	margin: 2rem auto;
}

.row {
	display: flex;
	flex-direction: column; /* 세로 배치 */
	margin-bottom: 1.5rem;
}

.row label {
	margin-bottom: 0.5rem;
	font-weight: bold;
}

.email-group {
	display: flex;
	align-items: center;
	gap: 0.5rem;
	padding: 0.5rem;
	border: 1px solid #ced4da;
	border-radius: 10px;
}

.email-group input, .email-group select {
	border: none;
	outline: none;
	padding: 0.5rem;
	flex: 1;
	font-size: 1rem;
	background-color: transparent;
}

.email-group select {
	cursor: pointer;
}

input {
	width: 100%;
	padding: 0.75rem;
	border: 1px solid #ced4da;
	border-radius: 10px;
	font-size: 1rem;
}

.radio-label {
	display: flex; /* 라디오 버튼과 텍스트를 가로로 정렬 */
	align-items: center; /* 텍스트와 버튼의 세로 정렬 */
	gap: 0.5rem; /* 버튼과 텍스트 사이 간격 */
	cursor: pointer; /* 마우스를 올렸을 때 포인터로 변경 */
	white-space: nowrap; /* 텍스트를 한 줄로 강제 */
}

.gender-group {
	display: flex; /* 라디오 버튼을 가로로 배치 */
	gap: 2rem; /* 버튼 사이 간격 */
}
</style>
<script>
        function toggleCustomDomain(select) {
            const customDomainInput = document.getElementById('custom-domain');
            if (select.value === 'custom') {
                customDomainInput.style.display = 'inline-block';
            } else {
                customDomainInput.style.display = 'none';
                customDomainInput.value = ''; // Reset the custom domain input field
            }
        }

        function formatPhoneNumber(input) {
            // 입력 값에서 숫자만 추출
            const numbers = input.value.replace(/\D/g, '');
            
            // 형식 지정
            let formatted = '';
            if (numbers.length <= 3) {
                formatted = numbers; // 첫 3자리까지만
            } else if (numbers.length <= 7) {
                formatted = numbers.slice(0, 3) + '-' + numbers.slice(3); // 3-4자리 형식
            } else {
                formatted = numbers.slice(0, 3) + '-' + numbers.slice(3, 7) + '-' + numbers.slice(7, 11); // 3-4-4 형식
            }

            // 값 업데이트
            input.value = formatted;
        }
        
        function checkPasswordMatch() {
            const password = document.getElementById('pw').value;
            const confirmPassword = document.getElementById('pw2').value;
            const message = document.getElementById('password-match-message');
            const passwordValidationMessage = document.getElementById('password-validation-message');

            // 비밀번호 유효성 검사 (최소 8자리, 최대 20자리, 영문, 숫자, 특수문자 포함)
            const passwordPattern = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;

            if (password === '') {
                passwordValidationMessage.textContent = '';
                message.textContent = '';
                return;
            }

            if (!passwordPattern.test(password)) {
                passwordValidationMessage.style.color = 'red';
                passwordValidationMessage.textContent = '비밀번호는 8~20자, 영문, 숫자, 특수문자를 포함해야 합니다.';
                message.textContent = '';
                return;
            } else {
                passwordValidationMessage.textContent = '';
            }

            // 비밀번호 일치 여부 확인
            if (password === confirmPassword) {
                message.style.color = 'green';
                message.textContent = '비밀번호가 일치합니다.';
            } else {
                message.style.color = 'red';
                message.textContent = '비밀번호가 일치하지 않습니다.';
            }
        }
        
        document.addEventListener("DOMContentLoaded", function() {
            const birthdateInput = document.getElementById('birthdate');
            const today = new Date();
            
            // 최대 날짜: 오늘로부터 13년 전
            const maxDate = new Date(today.getFullYear() - 13, today.getMonth(), today.getDate());
            birthdateInput.max = maxDate.toISOString().split("T")[0];
            
            // 최소 날짜: 오늘로부터 100년 전
            const minDate = new Date(today.getFullYear() - 100, today.getMonth(), today.getDate());
            birthdateInput.min = minDate.toISOString().split("T")[0];
        });


    </script>
</head>
<body>
	<div class="text-center">
		<h1>회원가입</h1>
		<p>회원 정보를 입력해주세요.</p>
	</div>
	<div class="container">
		<div class="card">
		
			<div class="row">
				<label for="email-input">아이디</label>
				<div class="email-group">
					<input id="email-input" type="text" placeholder="아이디 입력"> <span>@</span>
					<input id="custom-domain" type="text" class="custom-domain"
						placeholder="직접 입력"> <select id="email-domain"
						onchange="toggleCustomDomain(this)">
						<option value="custom" selected>직접 입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="yahoo.com">yahoo.com</option>
					</select>
				</div>
			</div>
			<!-- row의 끝 -->

			<div class="row">
				<label for="pw">비밀번호</label> <input id="pw" class="pw"
					type="password" placeholder="비밀번호" maxlength="20"
					oninput="checkPasswordMatch()"> <small
					id="password-validation-message"></small>
			</div>
			<!-- row의 끝 -->
			
			<div class="row">
				<label for="pw2">비밀번호 재입력</label> <input id="pw2" class="pw2"
					type="password" placeholder="비밀번호 재입력" maxlength="20"
					oninput="checkPasswordMatch()"> <small
					id="password-match-message"></small>
			</div>
			<!-- row의 끝 -->

			<div class="row">
				<label for="name">이름</label> <input id="name" type="text"
					class="name" placeholder="성명">
			</div>
			<!-- row의 끝 -->
			
			<div class="row">
				<label for="nickName">닉네임</label> <input id="nickName" type="text"
					class="nickName" placeholder="닉네임">
			</div>
			<!-- row의 끝 -->
			
			<div class="row">
				<label for="birthdate">생년월일</label> <input id="birthdate"
					type="date" class="birthdate">
			</div>
			<!-- row의 끝 -->

			<div class="row">
				<label for="tel">전화번호</label> <input id="tel" type="text"
					class="tel" placeholder="-는 입력하지 않아도 됩니다."
					oninput="formatPhoneNumber(this)">
			</div> 
			<!-- row의 끝 -->

			<div class="row">
				<label for="gender">성별</label>
				<div class="gender-group">
					<label class="radio-label"> <input type="radio"
						name="gender" value="male"> 남성
					</label> <label class="radio-label"> <input type="radio"
						name="gender" value="female"> 여성
					</label>
				</div>
			</div> 
			<!-- row의 끝 -->

			<div class="row">
				<label>이미지</label> <input type="file" id="photo" class="photo">
			</div> 
			<!-- row의 끝 -->

		</div>
		<!-- card의 끝 -->
	</div>
	<!-- container의 끝 -->
</body>
</html>
