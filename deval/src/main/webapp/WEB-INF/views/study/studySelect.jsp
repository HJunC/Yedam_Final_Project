<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudySelect.jsp</title>
</head>
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
      <div>
         <h1>게시글 상세내용</h1>
      </div>
      <sec:csrfInput/>
      <c:choose>
         <c:when test="${empty study.studyNo}">
            <h1>선택한 게시글이 존재하지 않습니다.</h1>
         </c:when>
         <c:otherwise>
            <div>
               <table border="1">
                  <tbody>
                     <tr>
                        <th>스터디장</th>
                        <td>${study.leaderId }</td>
                        <th>등록일자</th>
                        <td>${study.uploadDate }</td>
                     </tr>
                     <tr>
                     	<th>스터디명</th>
                        <td colspan="9">${study.studyNm }</td>
                     </tr>
                     <tr>
                        <th>내용</th>
                        <td colspan="10">${study.subject}</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </c:otherwise>
      </c:choose><br><br>
      <div>
      	 <form action="studyUpdateForm.do" method="post">
      	 <sec:csrfInput/>
	         <button type="button" onclick="location.href='studyList.do'">목록</button>
	       	 <button type="button" onclick="">신청</button>
	         <button type="button" onclick="">문의</button>
	         <button type="submit">수정</button>
	         
	         <input type="hidden" name="studyNo" value="${study.studyNo }">
         </form>
      </div>
   </div>
</body>
</html>