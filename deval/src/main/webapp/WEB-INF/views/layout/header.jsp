<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!-- Navigation panel -->
<nav class="main-nav dark transparent stick-fixed wow-menubar">
	<div class="full-wrapper relative clearfix">

		<!-- Logo ( * your text or image into link tag *) -->
		<div class="nav-logo-wrap local-scroll">
			<a href="${root}/home.do" class="logo">
				Developers Vally
				<%--<img src="" alt="Company logo" width="188" height="37" />--%>
			</a>
		</div>

		<!-- Mobile Menu Button -->
		<div class="mobile-nav" role="button" tabindex="0">
			<i class="fa fa-bars"></i>
			<span class="sr-only">메뉴</span>
		</div>

		<!-- Main Menu -->
		<div class="inner-nav desktop-nav">
			<ul class="clearlist">

				<li>
					<a href="#" class="mn-has-sub active">커뮤니티 <i class="mn-has-sub-icon"></i></a>
					<!-- Sub Multilevel -->
					<ul class="mn-sub mn-has-multi">

						<li class="mn-sub-multi">
							<a class="mn-group-title">Free</a>
							<ul>
								<li><a href="${root}/board/free.do">자유게시판</a></li>
								<li><a href="${root}/board/notice.do">공지사항</a></li>
								<li><a href="${root}/board/technical.do">최신기술</a></li>
								<li><a href="${root}/board/usedTransaction.do">중고거래</a></li>
							</ul>
						</li>
						<li class="mn-sub-multi">
							<a class="mn-group-title">Code</a>
							<ul>
								<li><a href="${root}/code/shared.do">코드공유</a></li>
								<li><a href="${root}/code/review.do">코드리뷰</a></li>
								<li><a href="${root}/code/question.do">질문</a></li>
								<li><a href="${root}/code/answer.do">답변</a></li>
							</ul>
						</li>
					</ul>
				</li>

				<li>
					<a href="#" class="mn-has-sub">구인구직 <i class="mn-has-sub-icon"></i></a>
					<ul class="mn-sub mn-has-multi">
						<li class="mn-sub-multi">
							<ul>
								<li><a href="${root}/job/offer.do">구인</a></li>
								<li><a href="${root}/job/seeking.do">구직</a></li>
							</ul>
						</li>
					</ul>
				</li>

				<li>
					<a href="${root}/project/main.do" class="mn-has-sub">팀 프로젝트</a>
				</li>

				<li>
					<a href="${root}/study/main.do" class="mn-has-sub">스터디</a>
				</li>

				<li>
					<a href="${root}/mento/main.do" class="mn-has-sub">멘토&멘티</a>
				</li>

				<!-- Divider -->
				<li><a>&nbsp;</a></li>
				<li><a>&nbsp;</a></li>
				<!-- End Divider -->

				<c:if test="${empty user && empty company}">
				<li><a href="${root}/loginForm.do" class="mn-has-sub">로그인</a></li>
				<li><a href="${root}/signUpForm.do" class="mn-has-sub">회원가입</a></li>
				</c:if>

				<c:if test="${not empty user}">
				<li>
					<a href="#" class="mn-has-sub">내 정보 <i class="mn-has-sub-icon"></i></a>
					<ul class="mn-sub">
						<li><a href="${root}/myPage.do">마이페이지</a></li>
						<li><a href="${root}/logout.do">로그아웃</a></li>
					</ul>
				</li>
				</c:if>

				<c:if test="${not empty company}">
					<li>
						<a href="#" class="mn-has-sub">내 정보 <i class="mn-has-sub-icon"></i></a>
						<ul class="mn-sub">
							<li><a href="${root}/coPage.do">회사페이지</a></li>
							<li><a href="${root}/logout.do">로그아웃</a></li>
						</ul>
					</li>
				</c:if>

			</ul>
		</div>
		<!-- End Main Menu -->

	</div>
</nav>
<!-- End Navigation panel -->