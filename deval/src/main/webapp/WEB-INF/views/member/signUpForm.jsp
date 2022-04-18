<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Home Section -->
<section class="page-section bg-dark-alfa-50 bg-scroll" id="home">
	<div class="container relative">

		<div class="row">

			<div class="col-md-8">
				<div class="wow fadeInUpShort" data-wow-delay=".1s">
					<h1 class="hs-line-7 mb-20 mb-xs-10">회원가입</h1>
				</div>
				<div class="wow fadeInUpShort" data-wow-delay=".2s">
					<p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
						개발자들의 안식처 Developers Vally
					</p>
				</div>
			</div>

		</div>

	</div>
</section>
<!-- End Home Section -->

<!-- Section -->
<section class="page-section bg-dark light-content">
	<div class="container">

		<!-- Registry Form -->
		<div class="row">
			<div class="col-md-6 offset-md-3">

				<form action="signUp.do" method="post" onsubmit="return formCheck()" class="form contact-form">
					<div class="clearfix">
						<div class="form-group">
							<label for="memberId">아이디</label>
							<div class="input-group">
								<input type="text" name="memberId" id="memberId" class="input-lg round form-control" placeholder="아이디를 입력해주세요">
								<button type="button" id="btn" class="btn btn-outline-secondary" onclick="idDuplecatedCheck()">중복 확인</button>
							</div>
						</div>
						<div class="form-group">
							<label for="memberPassword">비밀번호</label>
							<input type="password" name="password" id="memberPassword"  class="input-lg round form-control" placeholder="비밀번호를 입력해주세요">
						</div>
						<div class="form-group">
							<label for="passwordCheck">비밀번호 확인</label>
							<input type="password" id="passwordCheck" onchange="pwdCheck()" class="input-lg round form-control" placeholder="비밀번호를 다시 입력해주세요">
							<div id="checkWord"></div>
						</div>
						<div class="form-group">
							<label for="memberMail">이메일</label>
							<div class="input-group">
								<input type="email" name="mail" id="memberMail" class="input-lg round form-control" placeholder="이메일을 입력해주세요" required="required">
								<button type="button" id="mailBtn" class="btn btn-outline-secondary" onclick="sendMail()">인증번호 보내기</button>
							</div>
						</div>
						<div class="form-group">
							<label for="authCheck">이메일 확인</label>
							<div class="input-group">
								<input type="text" id="authCheck" class="input-lg round form-control" disabled placeholder="인증번호를 입력해주세요">
								<button type="button" id="checkBtn" class="btn btn-outline-secondary" onclick="checkAuth()" disabled value="">인증번호 확인</button>
							</div>
						</div>
						<div class="form-group">
							<label for="memberName">이름</label>
							<input type="text" name="name" id="memberName" class="input-lg round form-control" placeholder="이름을 입력해주세요" required="required">
						</div>

					</div>
					<!-- Send Button -->
					<div class="pt-10">
						<button type="submit" class="submit_btn btn btn-mod btn-large btn-round btn-full" id="reg-btn">회원가입</button>
					</div>

				</form>

			</div>
		</div>
		<!-- End Registry Form -->

	</div>

</section>
<!-- End Section -->

<!-- Divider -->
<hr class="mt-0 mb-0 white" />
<!-- End Divider -->

<script>
	var auth;
	
	function formCheck(){
		if(checkWord.style.color != 'green') {
			if(checkWord.style.color == 'red'){
				alert('비밀번호를 일치시켜주세요')
			} else {
				alert('비밀번호를 확인해주세요')
			}
			return false;
		} else if(btn.value == '') {
			alert('아이디 중복을 확인해주세요');
			return false;
		} else if($('#checkBtn').val() == ''){
			alert('이메일 인증을 해주세요')
			return false;
		}
		
		return true;
	}

	function pwdCheck(){
		var password = memberPassword.value;
		var check = passwordCheck.value;
		if(password == check){
			checkWord.innerText = '';
			checkWord.style.color="green";
			checkWord.innerText = '비밀번호가 일치합니다';
		} else {
			checkWord.innerText = '';
			checkWord.style.color="red";
			checkWord.innerText = '비밀번호가 일치하지 않습니다.';
		}

	}
	
	function idDuplecatedCheck(){
		btn.value == '';
		var id = memberId.value;
		if (id == ''){
			alert('아이디를 입력해주세요');
			memberId.focus();
		} else {
			$.ajax({
				url:"idCheck.do",
				data : {id : id},
				success : function(data){
					if(data){
						alert('사용가능한 아이디입니다.');
						btn.value = 'yes';
					} else {
						alert('이미 존재하는 아이디입니다.');
						memberId.value = '';
						memberId.focus();
					}
				}
			})
		}
	}
	
	function sendMail() {
		if($('#memberMail').val() != ''){
			$.ajax({
				url : "sendAuthMail.do",
				data : {mail : $('#memberMail').val()},
				success : function(data) {
					alert('인증번호가 발송되었습니다.');
					$('#authCheck').attr('disabled',false);
					$('#checkBtn').attr('disabled',false);
					auth = data;
				}
			})
		} else {
			alert('이메일을 입력해주세요');
			$('#memberMail').focus();
		}
	}
	
	function checkAuth() {
		if($('#authCheck').val() != '') {
			if(auth == $('#authCheck').val()) {
				alert('인증번호가 확인되었습니다.')
				$('#checkBtn').val('y');
			} else {
				alert('인증번호가 일치하지 않습니다. 다시 입력해주세요')
				$('#authCheck').val('');
				$('#authCheck').focus();
			}
		} else {
			alert('인증번호를 입력해주세요');
			$('#authCheck').focus();
		}
	}
</script>
