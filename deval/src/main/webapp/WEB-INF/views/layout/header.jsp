<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script>
var socket = null;
var room = '${roomId}';
console.log(room)
if (room == '') {
	var webSocket = new WebSocket('ws://localhost:83/deval/socket');
} else {
	var webSocket = new WebSocket('ws://localhost:83/deval/socket?roomId=${roomId}');
}
console.log(webSocket)
socket = webSocket;
webSocket.onopen = function(e) {
	console.log(e);
	console.log("웹소켓이 연결되었습니다.");
	webSocket.onmessage = function(e) {
		console.log(e)
			$('#alarm').text(e.data);
			$('#alarm').css("display","block");
			setTimeout(function() {
				$('#alarm').css("display","none");
			},5000);
		}
	};
</script>
<!-- Navigation panel -->
<style>
.inner-nav ul li .mn-sub li form button{
	display: block;
    width: 100%;
    height: auto !important;
    line-height: 1.3 !important;
    position: relative;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0;
    padding: 12px 15px;
    font-size: 15px;
    font-weight: 400;
    text-align: left;
    text-transform: none;
    border-left: none;
    border-right: none;
    letter-spacing: 0;
    color: #ccc !important;
    outline-offset: -2px !important;
    cursor: pointer;
    -webkit-transition: all 0.27s cubic-bezier(0.000, 0.000, 0.580, 1.000);
    transition: all 0.27s cubic-bezier(0.000, 0.000, 0.580, 1.000);
    background-color: transparent;
    border: 0;
}
</style>
<nav class="main-nav dark transparent stick-fixed wow-menubar">
	<div class="full-wrapper relative clearfix">
	<div class="alert alert-primary" role="alert" id="alarm" style="display: none;"></div>
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
								<li><a href="${root}/trade/tradeList.do">중고거래</a></li>
							</ul>
						</li>
						<li class="mn-sub-multi">
							<a class="mn-group-title">Code</a>
							<ul>
								<li><a href="${root}/code/codeList.do">소스코드</a></li>
								<%-- <li><a href="${root}/code/review.do">코드리뷰</a></li> --%>
								<%-- <li><a href="${root}/code/question.do">질문</a></li> --%>
								<%-- <li><a href="${root}/code/answer.do">답변</a></li> --%>
							</ul>
						</li>
					</ul>
				</li>

				<li>
					<a href="#" class="mn-has-sub">구인/구직 <i class="mn-has-sub-icon"></i></a>
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
					<a href="${root}/study/studyMain.do" class="mn-has-sub">스터디</a>
				</li>

				<li>
					<a href="${root}/mento/main.do" class="mn-has-sub">멘토&멘티</a>
				</li>

				<!-- Divider -->
				<li><a>&nbsp;</a></li>
				<!-- End Divider -->
				
				<sec:authorize access="isAnonymous()">
					<li><a href="${root}/loginForm.do" class="mn-has-sub">로그인</a></li>
					<li><a href="${root}/signUpForm.do" class="mn-has-sub">회원가입</a></li>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<li>
						<a href="#" class="mn-has-sub">내 정보 <i class="mn-has-sub-icon"></i></a>
						<ul class="mn-sub">
						<sec:authorize access="hasAnyRole('USER','ADMIN')">
							<li><a href="${root}/myPage.do">마이페이지</a></li>						
						</sec:authorize>
						<sec:authorize access="hasRole('COMPANY')">
							<li><a href="${root}/coPage.do">회사페이지</a></li>
						</sec:authorize>
							<li><form action="${root}/logout" method="post">
									<sec:csrfInput/>
									<button type="submit">로그아웃</button>
								</form>
							</li>
						</ul>
					</li>
				</sec:authorize>

			</ul>
		</div>
		<!-- End Main Menu -->
	</div>
</nav>
<!-- End Navigation panel -->