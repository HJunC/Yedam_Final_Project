<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>

<!-- Home Section -->
<section class="small-section bg-dark-alfa-50 bg-scroll light-content" data-background="images/full-width-images/section-bg-19.jpg" id="home">
    <div class="container relative pt-70">

        <div class="row">

            <div class="col-md-8">
                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                    <h2 class="hs-line-7 mb-40 mb-xs-20" style="font-size: 52px;">${project.projectName}</h2>
                </div>
                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                    <div class="mb-20 mb-xs-0">
                        <!-- Author, Categories, Comments -->
                        <div class="blog-item-data">
                            <span><i class="fa fa-user"></i> ${project.leaderId}</span>
                            <span class="separator">&nbsp;</span>
                            <span><i class="fa fa-clock"></i>
                                모집일
                                <fmt:formatDate value="${project.recruitSdt}" type="both" pattern="yyyy-MM-dd"/>
                                ~
                                <fmt:formatDate value="${project.recruitEdt}" type="both" pattern="yyyy-MM-dd"/>
                            </span>
                            <span class="separator">&nbsp;</span>
                            <span><i class="fa fa-comments"></i> ${project.applyRcnt} 신청자 수</span>
                            <span class="separator">&nbsp;</span>
                            <span><i class="fa fa-eye"></i> ${project.hit} 조회수</span>
                            <span class="separator">&nbsp;</span>
                            <span id="createAt"><i class="fa fa-pen"></i> </span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Bar Item -->
        <div class="progress tpl-progress" style="background-color: #ebebeb; position: relative;">
            <div id="progressBar"
                 class="progress-bar"
                 role="progressbar"
                 aria-valuemin="0"
                 aria-valuemax="${project.projectTerm}"
                 style="background-color: #6ead5a">
                <div>
                    <fmt:formatDate value="${project.projectSdt}" type="both" pattern="yyyy-MM-dd"/>
                </div>
            </div>
            <div style="position: absolute; top: 8px; right: 0;">
                <fmt:formatDate value="${project.projectEdt}" type="both" pattern="yyyy-MM-dd"/>
            </div>
        </div>
        <!-- End Bar Item -->
    </div>
</section>
<!-- End Home Section -->


<!-- Section -->
<section class="page-section bg-dark light-content">
    <div class="container relative">

        <div class="row">

            <!-- Content -->
            <div class="col-md-8 mb-sm-80">

                <h4 class="blog-page-title">프로젝트 설명</h4>

                <!-- Post -->
                <div class="blog-item mb-80 mb-xs-40">${project.subject}</div>
                <!-- End Post -->

                <!-- Comments -->
                <div class="mb-80 mb-xs-40">

                    <h4 class="blog-page-title">팀원 <small class="number">(${fn:length(team)})</small></h4>

                    <ul class="media-list comment-list clearlist">

                        <c:forEach items="${team }" var="item">
                            <!-- Comment Item -->
                            <li class="media comment-item">
                                <a class="float-start" href="#"><img class="media-object comment-avatar" src="${resources}/images/user-avatar.png" alt="" width="50" height="50"></a>
                                <div class="media-body">
                                    <div class="comment-item-data">
                                        <div class="comment-author">${item.memberId}</div>${item.position}
                                    </div>
                                </div>
                            </li>
                            <!-- End Comment Item -->
                        </c:forEach>

                    </ul>

                </div>
                <!-- End Comments -->


                <!-- Add Comment -->
                <div class="mb-80 mb-xs-40">

                    <h4 class="blog-page-title">참가 신청</h4>

                    <!-- Form -->
                    <form id="addRequestForm" class="form">
                        <input type="hidden" name="projectNo" value="${project.projectNo}">
                        <input type="hidden" name="memberId" value="<sec:authentication property="principal.username"/>">
                        <div class="mb-30 mb-md-20">
                            <!-- Website -->
                            <label for="website">포지션</label>
                            <div class="row">
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">프론트엔드</span>
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="FE" name="position" required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">백엔드</span>
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="BE" name="position" required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">풀스택</span>
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="FS" name="position" required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">디자인</span>
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="DE" name="position" required>
                                    </div>
                                </div>
                                <div class="col input-group">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">기획</span>
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="PL" name="position" required>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- subject -->
                        <div class="mb-30 mb-md-20">
                            <label for="subject">지원내용</label>
                            <textarea name="subject" id="subject" class="input-md round form-control" rows="6" placeholder="본인을 소개해주세요 😀" maxlength="400"></textarea>
                        </div>

                        <!-- Send Button -->
                        <button type="submit" class="btn btn-mod btn-w btn-medium btn-round">
                            신청하기
                        </button>

                    </form>
                    <!-- End Form -->

                </div>
                <!-- End Add Comment -->


            </div>
            <!-- End Content -->

            <!-- Sidebar -->
            <div class="col-md-4 col-lg-3 offset-lg-1 mt-10">

                <div>

                    <!-- 언어 -->
                    <div class="widget">

                        <h3 class="widget-title">언어</h3>

                        <div class="widget-body">
                            <div class="tags">
                                <a href="">Java</a>
                                <a href="">Portfolio</a>
                                <a href="">Digital</a>
                                <a href="">Branding</a>
                                <a href="">Theme</a>
                                <a href="">Clean</a>
                                <a href="">UI & UX</a>
                                <a href="">Love</a>
                            </div>
                        </div>

                    </div>
                    <!-- End Widget -->

                    <!-- 포지션 -->
                    <div class="widget">

                        <h3 class="widget-title">포지션</h3>

                        <div class="widget-body">
                            <ul class="clearlist widget-menu">
                                <li>
                                    <a href="#" title="">프론트엔드 개발자</a>
                                    <small>
                                        - ${project.frontRcnt}
                                    </small>
                                </li>
                                <li>
                                    <a href="#" title="">백엔드 개발자</a>
                                    <small>
                                        - ${project.backRcnt}
                                    </small>
                                </li>
                                <li>
                                    <a href="#" title="">풀스택 개발자</a>
                                    <small>
                                        - ${project.fullRcnt}
                                    </small>
                                </li>
                                <li>
                                    <a href="#" title="">디자이너</a>
                                    <small>
                                        - ${project.designRcnt}
                                    </small>
                                </li>
                                <li>
                                    <a href="#" title="">기획자</a>
                                    <small>
                                        - ${project.plannerRcnt}
                                    </small>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!-- End Widget -->

                    <!-- 기간 -->
                    <div class="widget">

                        <h3 class="widget-title">프로젝트 진행 기간 (${project.projectTerm}일)</h3>

                        <div class="widget-body">
                            <ul class="clearlist widget-menu">
                                <li>
                                    <div class="form-group">
                                        시작일<input type="date" class="input-lg round form-control bg-dark-input" value="${project.projectSdt}">
                                    </div>
                                </li>
                                <li>
                                    <div class="form-group">
                                        종료일<input type="date" class="input-lg round form-control bg-dark-input" value="${project.projectEdt}">
                                    </div>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!-- End Widget -->

                    <!-- 진행 방식 -->
                    <div class="widget">

                        <h3 class="widget-title">프로젝트 진행 방식</h3>

                        <div class="widget-body">
                            <c:if test="${project.process eq 'ON'}">
                                <p>온라인</p>
                            </c:if>
                            <c:if test="${project.process eq 'OFF'}">
                                <p>오프라인</p>
                            </c:if>
                            <c:if test="${project.process eq 'ONOFF'}">
                                <p>온/오프라인</p>
                            </c:if>
                        </div>

                    </div>
                    <!-- End Widget -->

                </div>

            </div>
            <!-- End Sidebar -->

        </div>

    </div>
</section>
<!-- End Section -->

<script src="${resources}/js/moment.min.js"></script>
<script src="${resources}/js/moment-with-locales.min.js"></script>
<script>
  // 작성시간
  moment.locale('ko');
  var createAt = document.getElementById("createAt");
  createAt.append(moment("<fmt:formatDate value="${project.recruitSdt}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>").fromNow());

  // progressBar
  var progressBar = document.getElementById("progressBar");
  progressBar.setAttribute("aria-valuenow", "5");

  var today = new Date();
  today = moment(today).format("YYYY-MM-DD");

  function addRequest() {
    $.ajax({
      url: "/api/project/request",
      data: $("#addRequestForm").serialize(),
      dataType: "json",
      success: function(data) {
        console.log(data);
      },
      error: function (error) {
        console.log(error);
      }
    })
  }

</script>

(모집중)
- 프로젝트 신청
- 프로젝트 삭제 (작성자)

(진행중)
- 프로젝트 마감일 수정
- 프로젝트 삭제 (프로젝트 마감일 < 오늘날짜)

(완료)
- 프로젝트 공유하기 (공유X)