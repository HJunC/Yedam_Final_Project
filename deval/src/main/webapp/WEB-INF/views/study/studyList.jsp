<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-03-25
  Time: 오전 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />

<html>
<body>
<!-- Home Section -->
		<section class="home-section bg-dark light-content" id="home">
			<div class="container min-height-100vh d-flex align-items-center pt-100 pb-100">
				<div class="split-background d-none d-lg-block d-xl-block"></div>

	<!-- Hero Content -->
		<div class="home-content text-start">
			<div class="row">

				<div class="col-lg-5 d-flex align-items-center mb-md-60">
					<div>
						<h1 class="hs-line-10 uppercase mb-30 mb-xs-10 wow fadeInUpShort"
							data-wow-delay=".1s">STUDY</h1>
						<h2 class="hs-line-7 mb-60 mb-xs-40 wow fadeInUpShort"
							data-wow-delay=".2s">
							Developer Study<span class="sr-only">Challenge, Passion, cooperation</span>
							<span data-period="2800" data-type='[ "Challenge", "Passion", "cooperation"]' class="typewrite" aria-hidden="true">
							<span class="wrap"></span></span>
						</h2>
						<div class="local-scroll wow fadeInUpShort" data-wow-delay=".3s">
							<a href="addStudy.do" class="btn btn-mod btn-w btn-medium btn-round mx-md-1">스터디등록</a>
							<a href="studyList.do" class="btn btn-mod btn-w btn-medium btn-round mx-md-1">스터디 목록</a>
						</div>
					</div>
				</div>
				<div class="split-image col-lg-6 offset-lg-1 d-flex align-items-center parallax" data-offset="20">
					<img src="${resources }/images/studyimg/study_img2.jpg" alt="Add Image Description Here" class="wow fadeScaleIn" />
				</div>
			</div>
		</div>
		<!-- End Hero Content -->
			<!-- Scroll Down -->
				<div class="local-scroll scroll-down-wrap wow fadeInUpShort"
					data-wow-offset="0">
					<a href="#about" class="scroll-down"><i class="scroll-down-icon"></i>
					<span class="sr-only">Scroll to the next section</span></a>
				</div>
		<!-- End Scroll Down -->
		</div>
	</section>
	<div align="center">
		<table style="width: 100%;">
			<thead>
				<tr class="row100 head">
					<th>스터디번호</th>
					<th>지역</th>
					<th>언어</th>
					<th>스터디명</th>
					<th>스터디장</th>
					<th>난이도</th>
					<th>인원</th>
					<th>학습기간</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${study}" var="std">
					<tr onclick="studySearch('${std.studyNo }')">
						<td>${std.studyNo }</td>
						<td>${std.location }</td>
						<td>${std.lang1 }
						<c:if test="${not empty std.lang2 }">
						/ ${std.lang2 }
						</c:if></td>
						<td>${std.studyNm }</td>
						<td>${std.leaderId }</td>
						<td>${std.defficulty }</td>
						<td>${std.maxRcnt }</td>
						<td>${std.studySdt }~${std.studyEdt }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	  <!-- Pagination 페이징처리 시작-->
           <div class="pagination mt-30 mt-xs-10">
           <a href=""><i class="fa fa-chevron-left"></i></a>
           <a href="" class="active">1</a>
           <a href="">2</a>
           <a href="">3</a>
           <a href="">4</a>
           <a href="">5</a>
           <a href=""><i class="fa fa-chevron-right"></i></a>
           </div>
      <!-- End Pagination 페이징처리 끝-->
	</div>
	<div>
		<form id="selfrm" action="studySelect.do" method="post">
		<sec:csrfInput/>
			<input type="hidden" id="studyNo" name="studyNo">
		</form>
	</div>
	<script type="text/javascript">
		function studySearch(n) {
			document.forms.selfrm.studyNo.value = n;
			document.forms.selfrm.submit();
		}
	</script>
	
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script src="${resources}/js/study/common.js"></script>
</body>


</html>