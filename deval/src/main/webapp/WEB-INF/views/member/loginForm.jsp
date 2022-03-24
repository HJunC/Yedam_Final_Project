<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Home Section -->
<section class="page-section bg-dark-alfa-50 bg-scroll" data-background="images/full-width-images/section-bg-19.jpg" id="home">
	<div class="container relative">

		<div class="row">

			<div class="col-md-8">
				<div class="wow fadeInUpShort" data-wow-delay=".1s">
					<h1 class="hs-line-7 mb-20 mb-xs-10">로그인</h1>
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

		<!-- Nav Tabs -->
		<div class="align-center mb-70 mb-xxs-50 wow fadeInUpShort">
			<ul class="nav nav-tabs tpl-minimal-tabs animate" id="myTab-account" role="tablist">

				<li class="nav-item">
					<a href="#account-login" class="nav-link active" id="account-login-tab" data-bs-toggle="tab"  role="tab" aria-controls="account-login" aria-selected="true">일반회원</a>
				</li>

				<li class="nav-item">
					<a href="#account-company" class="nav-link" id="account-company-tab" data-bs-toggle="tab" role="tab" aria-controls="account-company" aria-selected="false">기업회원</a>
				</li>

			</ul>
		</div>
		<!-- End Nav Tabs -->

		<!-- Tab panes -->
		<div class="tab-content tpl-minimal-tabs-cont section-text wow fadeInUpShort" id="myTabContent-1">

			<div class="tab-pane fade show active" id="account-login" role="tabpanel" aria-labelledby="account-login-tab">

				<!-- Login Form -->
				<div class="row">
					<div class="col-md-6 offset-md-3">

						<form action="login.do" method="post" class="form contact-form">
							<div class="clearfix">

								<!-- Name -->
								<div class="form-group">
									<label for="username">아이디</label>
									<input type="text" name="memberId" id="username" class="input-lg round form-control" placeholder="Enter your Id" pattern=".{3,100}" required aria-required="true">
								</div>

								<!-- Password -->
								<div class="form-group">
									<label for="password">비밀번호</label>
									<input type="password" name="memberPassword" id="password" class="input-lg round form-control" placeholder="Enter your password" pattern=".{5,100}" required aria-required="true">
								</div>

							</div>

							<div class="clearfix">

								<div class="cf-left-col">

									<!-- Inform Tip -->
									<div class="form-tip pt-20">
										<a href="">Forgot Password?</a>
									</div>

								</div>

								<div class="cf-right-col">

									<!-- Send Button -->
									<div class="text-end pt-10">
										<button type="submit" class="submit_btn btn btn-mod btn-w btn-large btn-round" >Login</button>
									</div>

								</div>

							</div>

						</form>

					</div>
				</div>
				<!-- End Login Form -->

			</div>

			<div class="tab-pane fade" id="account-company" role="tabpanel" aria-labelledby="account-login-tab">

				<!-- Login Form -->
				<div class="row">
					<div class="col-md-6 offset-md-3">

						<form action="login.do" method="post" class="form contact-form">
							<div class="clearfix">

								<!-- Name -->
								<div class="form-group">
									<label for="1">아이디</label>
									<input type="text" name="1" id="1" class="input-lg round form-control" placeholder="Enter your Id" pattern=".{3,100}" required aria-required="true">
								</div>

								<!-- Password -->
								<div class="form-group">
									<label for="2">비밀번호</label>
									<input type="password" name="2" id="2" class="input-lg round form-control" placeholder="Enter your password" pattern=".{5,100}" required aria-required="true">
								</div>

							</div>

							<div class="clearfix">

								<div class="cf-left-col">

									<!-- Inform Tip -->
									<div class="form-tip pt-20">
										<a href="">Forgot Password?</a>
									</div>

								</div>

								<div class="cf-right-col">

									<!-- Send Button -->
									<div class="text-end pt-10">
										<button type="submit" class="submit_btn btn btn-mod btn-w btn-large btn-round" >Login</button>
									</div>

								</div>

							</div>

						</form>

					</div>
				</div>
				<!-- End Login Form -->

			</div>

		</div>

	</div>
</section>
<!-- End Section -->

<!-- Divider -->
<hr class="mt-0 mb-0 white" />
<!-- End Divider -->