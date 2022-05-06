<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- Home Section -->

<!-- End Home Section -->

<!-- Section -->
<section class="page-section bg-dark light-content">
	<div class="container">

		<!-- Nav Tabs -->
		<div class="align-center mb-70 mb-xxs-50 wow fadeInUpShort">
			<div class="wow fadeInUpShort" data-wow-delay=".1s">
				<h2 class="hs-line-7 mb-20 mb-xs-10">로그인</h2>
			</div>
		</div>
		</div>
		<!-- End Nav Tabs -->

		<!-- Tab panes -->
		<div class="tab-content tpl-minimal-tabs-cont section-text wow fadeInUpShort" id="myTabContent-1">

			<div class="tab-pane fade show active" id="account-login" role="tabpanel" aria-labelledby="account-login-tab">
				
				<!-- Login Form -->
				<div class="row">
					<div class="col-md-6 offset-md-3">

						
						<form action="login" method="post" class="form contact-form">
						<sec:csrfInput/>
							<div class="clearfix">

								<!-- Name -->
								<div class="form-group">
									<label for="username">아이디</label>
									<input type="text" name="username" id="username" class="input-lg round form-control" placeholder="Enter your Id">
								</div>

								<!-- Password -->
								<div class="form-group">
									<label for="password">비밀번호</label>
									<input type="password" name="password" id="password" class="input-lg round form-control" placeholder="Enter your password">
								</div>
								<div class="form-group">
									<input type="checkbox" name="remember-me" value="True">로그인 유지
								</div>
							</div>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
							<div align="center" style="color:red;"><h4>아이디 또는 비밀번호가 일치하지 않습니다.</h4></div>
							<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
						</c:if>
						<div class="clearfix">

								<div class="cf-left-col">

							

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