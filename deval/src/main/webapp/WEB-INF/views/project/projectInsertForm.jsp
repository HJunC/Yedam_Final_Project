<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>

<!-- Home Section -->
<section class="page-section bg-dark-alfa-50 bg-scroll" data-background="${resources}/images/full-width-images/section-bg-11.jpg" id="home">
    <div class="container relative">

        <div class="row">

            <div class="col-md-8">
                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                    <h1 class="hs-line-7 mb-20 mb-xs-10">
                        👀<br>
                        팀 프로젝트 생성하기
                    </h1>
                </div>
                <div class="wow fadeInUpShort" data-wow-delay=".2s"></div>
            </div>

        </div>

    </div>
</section>
<!-- End Home Section -->


<!-- Section -->
<section class="page-section bg-dark light-content">
    <div class="container">

        <!-- Login Form -->
        <div class="row">
            <div>

                <form class="form contact-form" action="projectInsert.do" method="post">
                    <div class="clearfix">

                        <div class="form-group">
                            <label for="projectName">프로젝트 명</label>
                            <input type="text" name="projectName" id="projectName" class="input-lg round form-control bg-dark-input" placeholder="Enter username" pattern=".{3,100}" required aria-required="true">
                        </div>

                        <div class="form-group">
                            <label>포지션 인원 (본인 포함)</label>
                            <div class="row">
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">프론트엔드</span>
                                    <input type="number" id="frontRcnt" name="frontRcnt" class="input-lg round form-control bg-dark-input" min="0" max="9" value="0">
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="FE" name="leaderPosition" checked required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">백엔드</span>
                                    <input type="number" id="backRcnt" name="backRcnt" class="input-lg round form-control bg-dark-input" min="0" max="9" value="0">
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="BE" name="leaderPosition" required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">풀스택</span>
                                    <input type="number" id="fullRcnt" name="fullRcnt" class="input-lg round form-control bg-dark-input" min="0" max="9" value="0">
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="FS" name="leaderPosition" required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">디자인</span>
                                    <input type="number" id="designRcnt" name="designRcnt" class="input-lg round form-control bg-dark-input" min="0" max="9" value="0">
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="DE" name="leaderPosition" required>
                                    </div>
                                </div>
                                <div class="col input-group">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">기획</span>
                                    <input type="number" id="plannerRcnt" name="plannerRcnt" class="input-lg round form-control bg-dark-input" min="0" max="9" value="0">
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="PL" name="leaderPosition" required>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="projectTerm">프로젝트 기간</label>
                            <input type="number" name="projectTerm" id="projectTerm" class="input-lg round form-control bg-dark-input" required aria-required="true" min="0" max="365" value="3">
                        </div>
                        <div class="form-group">
                            <label for="lang">사용언어</label>
                            <input type="text" name="lang" id="lang" class="input-lg round form-control bg-dark-input" placeholder="JAVA, Spring, React ..." required aria-required="true">
                        </div>
                        <div class="form-group">
                            <label>진행방식</label>
                            <div class="row">
                                <div class="col input-group">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">온라인</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="ON" name="process" checked required>
                                    </div>
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">오프라인</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="OFF" name="process" required>
                                    </div>

                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">온/오프라인</span>
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="ONOFF" name="process" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="subject">프로젝트 설명</label>
                            <textarea name="subject" id="subject" class="input-lg round form-control bg-dark-input" required aria-required="true"></textarea>
                        </div>

                    </div>

                    <!-- Send Button -->
                    <div class="text-center pt-10">
                        <button type="submit" class="submit_btn btn btn-mod btn-w btn-large btn-round">생성하기</button>
                    </div>

                </form>

            </div>
        </div>
        <!-- End Login Form -->

    </div>
</section>
<!-- End Section -->