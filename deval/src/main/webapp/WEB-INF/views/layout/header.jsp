<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<!-- Navigation panel -->
<nav class="main-nav dark transparent stick-fixed wow-menubar">
	<div class="full-wrapper relative clearfix">

		<!-- Logo ( * your text or image into link tag *) -->
		<div class="nav-logo-wrap local-scroll">
			<a href="home.do" class="logo">
				Developers Vally
				<%--<img src="" alt="Company logo" width="188" height="37" />--%>
			</a>
		</div>

		<!-- Mobile Menu Button -->
		<div class="mobile-nav" role="button" tabindex="0">
			<i class="fa fa-bars"></i>
			<span class="sr-only">Menu</span>
		</div>

		<!-- Main Menu -->
		<div class="inner-nav desktop-nav">
			<ul class="clearlist">

				<li>
					<a href="home.do" class="mn-has-sub active">커뮤니티 <i class="mn-has-sub-icon"></i></a>
					<!-- Sub Multilevel -->
					<ul class="mn-sub mn-has-multi">

						<li class="mn-sub-multi">
							<a class="mn-group-title">Free</a>
							<ul>
								<li><a href="#">자유게시판</a></li>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">최신기술</a></li>
								<li><a href="#">중고거래</a></li>
							</ul>
						</li>
						<li class="mn-sub-multi">
							<a class="mn-group-title">Code</a>
							<ul>
								<li><a href="#">코드공유</a></li>
								<li><a href="#">코드리뷰</a></li>
								<li><a href="#">질문</a></li>
								<li><a href="#">답변</a></li>
							</ul>
						</li>
					</ul>
				</li>

				<li>
					<a href="#" class="mn-has-sub">채용공고</a>
				</li>

				<li>
					<a href="#" class="mn-has-sub">팀 프로젝트</a>
				</li>

				<li>
					<a href="#" class="mn-has-sub">스터디</a>
				</li>

				<li>
					<a href="#" class="mn-has-sub">멘토&멘티</a>
				</li>

				<!-- Divider -->
				<li><a>&nbsp;</a></li>
				<li><a>&nbsp;</a></li>
				<!-- End Divider -->

				<c:if test="${empty user && empty company}">
				<li><a href="loginForm.do" class="mn-has-sub">로그인</a></li>
				<li><a href="signUpForm.do" class="mn-has-sub">회원가입</a></li>
				</c:if>

				<c:if test="${not empty user}">
				<li>
					<a href="#" class="mn-has-sub">내 정보 <i class="mn-has-sub-icon"></i></a>
					<ul class="mn-sub">
						<li><a href="">마이페이지</a></li>
						<li><a href="logout.do">로그아웃</a></li>
					</ul>
				</li>
				</c:if>

				<c:if test="${not empty company}">
					<li>
						<a href="#" class="mn-has-sub">내 정보 <i class="mn-has-sub-icon"></i></a>
						<ul class="mn-sub">
							<li><a href="">회사페이지</a></li>
							<li><a href="logout.do">로그아웃</a></li>
						</ul>
					</li>
				</c:if>

			</ul>
		</div>
		<!-- End Main Menu -->

	</div>
</nav>
<!-- End Navigation panel -->