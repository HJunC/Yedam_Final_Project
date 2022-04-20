<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script>
var URL_CONFIG = '${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath }';
var socket = null;
var room = '${roomId}';
console.log(room)
if (room == '') {
	var webSocket = new WebSocket('ws://' + URL_CONFIG + '/socket');
} else {
	var webSocket = new WebSocket('ws://' + URL_CONFIG + '/socket?roomId=${roomId}');
}
console.log(webSocket)
socket = webSocket;
webSocket.onopen = function(e) {
	console.log(e);
	console.log("웹소켓이 연결되었습니다.");
	webSocket.onmessage = function(e) {
		console.log(e)
			$('#alarmText').text(e.data);
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
.custom-alert {
	position: fixed;
	bottom: 0;
	z-index: 1;
	right: 0;
	margin: 16px 40px;
	box-shadow: 0 4px 12px rgb(71 71 71 / 30%);
}
</style>
<div class="alert alert-primary custom-alert" role="alert" id="alarm" style="display: none;">
	<span id="alarmText"></span>
	<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<nav class="main-nav dark transparent stick-fixed wow-menubar">
	<div class="full-wrapper relative clearfix">
		<!-- Logo ( * your text or image into link tag *) -->
		<div class="nav-logo-wrap local-scroll">
			<a href="${root}/home.do" class="logo">
				Developers Vally
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
							<ul>
								<li><a href="${root}/board/notice.do">공지사항</a></li>
								<li><a href="${root}/cq/codeList.do">코드공유</a></li>
								<li><a href="${root}/board/technical.do">최신기술</a></li>
								<li><a href="${root}/board/free.do">자유게시판</a></li>
							</ul>
						</li>
					</ul>
				</li>

				<li>
					<a href="#" class="mn-has-sub">채용 <i class="mn-has-sub-icon"></i></a>
					<ul class="mn-sub mn-has-multi">
						<li class="mn-sub-multi">
							<ul>
								<li><a href="${root}/job/seeking.do">채용정보</a></li>
							</ul>
						</li>
					</ul>
				</li>

				<li>
					<a href="${root}/project/main.do">팀 프로젝트</a>
				</li>
				
				<li>
					<a href="${root}/study/studyMain.do">스터디</a>
				</li>

				<li>
					<a href="${root}/mento/main.do">멘토&멘티</a>
				</li>

				<!-- Divider -->
				<li>&nbsp;</li>
				<!-- End Divider -->
				
				<sec:authorize access="isAnonymous()">
					<li><a href="${root}/loginForm.do">로그인</a></li>
					<li><a href="${root}/signUpForm.do">회원가입</a></li>
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