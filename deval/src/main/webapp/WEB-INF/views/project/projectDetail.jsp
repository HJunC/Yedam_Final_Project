<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />

<!-- Home Section -->
<section class="small-section bg-dark-alfa-50 bg-scroll light-content" data-background="${resources}/images/full-width-images/section-bg-19.jpg" id="home">
    <div class="container relative pt-70">

        <div class="row">

            <div class="col-md-8">
                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                <c:choose>
                    <c:when test="${project.state eq '1'}"><p class="badge bg-info text-dark">모집중</p></c:when>
                    <c:when test="${project.state eq '2'}"><p class="badge bg-warning text-dark">모집완료</p></c:when>
                    <c:when test="${project.state eq '3'}"><p class="badge bg-primary">진행중</p></c:when>
                    <c:when test="${project.state eq '4'}"><p class="badge bg-success">완료</p></c:when>
                    <c:when test="${project.state eq '8'}"><p class="badge bg-warning text-dark">모집기간 지남</p></c:when>
                    <c:when test="${project.state eq '9'}"><p class="badge bg-danger">취소됨</p></c:when>
                </c:choose>
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
                            <span><i class="fa fa-user-clock"></i> ${project.applyRcnt} 신청자 수</span>
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
                 aria-valuemax="100"
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
        <script>
          /**
           * progressBar
           */
          var today = new Date();
          const start_date = new Date('<fmt:formatDate value="${project.projectSdt}" type="both" pattern="yyyy-MM-dd"/>');
          const end_date = new Date('<fmt:formatDate value="${project.projectEdt}" type="both" pattern="yyyy-MM-dd"/>');
          const total = end_date - start_date;
          const perc = today - start_date;
          const progressValue = Math.round(perc / total * 100 );
          document.getElementById("progressBar").setAttribute("aria-valuenow", progressValue);
        </script>

        <c:if test="${project.state eq '2' and project.leaderId eq member.name}">

            <!-- Lightbox Modal -->
            <a href="#test-modal" class="btn btn-mod btn-w btn-medium round mt-10 lightbox-gallery-5 mfp-inline">프로젝트 시작하기</a>

            <div id="test-modal" class="mfp-hide">
                <h3>프로젝트를 시작할까요? 🎪</h3>
                <h5>총 프로젝트 기간 ${project.projectTerm}일</h5>
                <div class="d-flex justify-content-between mb-40">

                    <div class="form-group">
                        시작일<input type="date" class="input-lg round form-control" name="projectSdt" id="projectSdt" readonly>
                    </div>
                    <div class="form-group">
                        종료일<input type="date" class="input-lg round form-control" name="projectEdt" id="projectEdt" readonly>
                    </div>
                </div>
                <button type="button" onclick="startProject()" class="btn btn-mod btn-round btn-large">시작</button>
            </div>
            <!-- End Lightbox Modal -->

        </c:if>

        <jsp:useBean id="now" class="java.util.Date" />
        <fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />
        <fmt:formatDate value="${project.projectEdt}" pattern="yyyyMMdd" var="projectEdt"/>
        <c:if test="${nowDate >= projectEdt && project.leaderId eq member.name && project.state eq '3'}">

            <!-- Lightbox Modal -->
            <a href="#test-modal" class="btn btn-mod btn-w btn-medium round mt-10 lightbox-gallery-5 mfp-inline">프로젝트 완료하기 🎉</a>

            <div id="test-modal" class="mfp-hide">
                <h3>프로젝트를 무사히 완주 🏆 <i class="fa fa-share-square"></i></h3>
                <div class="d-flex justify-content-between mb-40">
                    <label>프로젝트 주소</label>
                    <input type="text" class="form-control">
                </div>
                <button type="button" onclick="completeProject()" class="btn btn-mod btn-round btn-large">완료 (exp + 300)</button>
            </div>
            <!-- End Lightbox Modal -->

        </c:if>

    </div>
</section>
<!-- End Home Section -->

<style>
    .team-list {
        display: flex;
        padding-bottom: 20px !important;
    }
    .team-list:last-child {
        padding: 0 !important;
    }
</style>
<!-- Section -->
<section class="page-section bg-dark light-content">
    <div class="container relative">

        <div class="row">

            <!-- Content -->
            <div class="col-md-8 mb-sm-80">

                <h4 class="blog-page-title">프로젝트 설명</h4>

                <!-- Post -->
                <div class="blog-item mb-80 mb-xs-40">
                    <div id="viewer"></div>
                </div>
                <script src="${resources}/js/common/toastui-editor-all.min.js"></script>

                <!-- End Post -->

                <!-- Comments -->
                <div class="mb-80 mb-xs-40">

                    <h4 class="blog-page-title">팀원 <small class="number">(${fn:length(team)}/${project.totalRcnt})</small></h4>

                    <ul class="media-list comment-list clearlist">

                        <c:forEach items="${team }" var="item">
                            <!-- Comment Item -->
                            <li class="team-list">
                                <a class="float-start" href="#">
                                    <img class="media-object comment-avatar" src="${resources}/images/user-avatar.png" alt="" width="50" height="50">
                                </a>
                                <div class="media-body">
                                    <div class="comment-item-data">
                                        <div class="comment-author">${item.memberId}</div>
                                        ${item.position eq 'FE' ? '프론트엔드 개발자' : null}
                                        ${item.position eq 'BE' ? '백엔드 개발자' : null}
                                        ${item.position eq 'FS' ? '풀스택 개발자' : null}
                                        ${item.position eq 'DE' ? '디자이너' : null}
                                        ${item.position eq 'PL' ? '기획자' : null}
                                    </div>
                                </div>
                            </li>
                            <!-- End Comment Item -->
                        </c:forEach>

                    </ul>

                </div>
                <!-- End Comments -->

                <%--프로젝트 모집중인 팀장만 볼수있는 화면--%>
                <c:if test="${project.leaderId eq member.name
                              and project.state eq '1' or project.state eq '2'}">
                <div class="mb-80 mb-xs-40">

                    <h4 class="blog-page-title">신청현황</h4>

                    <c:choose>
                        <c:when test="${not empty project.requestList}">
                            <c:forEach items="${project.requestList}" var="item">
                                ${item.memberId} / ${item.position}
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h3 class="call-action-1-heading" style="font-size: 30px; color: rgba(255, 255, 255, 0.3);">지원자가 없습니다.</h3>
                        </c:otherwise>
                    </c:choose>
                </div>
                </c:if>

                <%--<sec:authorize access="isAuthenticated()">--%>
                    <c:if test="${sessionScope.userProjectState ne '팀장'
                                and sessionScope.userProjectState ne '팀원'
                                and project.state eq '1'
                                and !isRequest
                                and (project.frontRcnt + project.backRcnt + project.fullRcnt + project.designRcnt + project.plannerRcnt) != 0}">
                        <!-- Add Comment -->
                        <div class="mb-80 mb-xs-40">

                            <h4 class="blog-page-title">참가 신청</h4>

                            <!-- Form -->
                            <form id="addRequestForm" class="form">
                                <input type="hidden" name="projectNo" value="${project.projectNo}">
                                <input type="hidden" name="memberId" value="${member.name}">
                                <div class="mb-30 mb-md-20">
                                    <!-- Website -->
                                    <h6>지원 포지션</h6>
                                    <div class="d-flex justify-content-start">
                                        <c:if test="${project.frontRcnt > 0}">
                                            <div class="col input-group">
                                                <span class="input-group-text bg-dark" style="border-color: #5e646a;">프론트엔드</span>
                                                <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                                    <input class="form-check-input mt-0" type="radio" value="FE" name="position" required>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${project.backRcnt > 0}">
                                            <div class="col input-group">
                                                <span class="input-group-text bg-dark" style="border-color: #5e646a;">백엔드</span>
                                                <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                                    <input class="form-check-input mt-0" type="radio" value="BE" name="position" required>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${project.fullRcnt > 0}">
                                            <div class="col input-group">
                                                <span class="input-group-text bg-dark" style="border-color: #5e646a;">풀스택</span>
                                                <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                                    <input class="form-check-input mt-0" type="radio" value="FS" name="position" required>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${project.designRcnt > 0}">
                                            <div class="col input-group">
                                                <span class="input-group-text bg-dark" style="border-color: #5e646a;">디자인</span>
                                                <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                                    <input class="form-check-input mt-0" type="radio" value="DE" name="position" required>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${project.plannerRcnt > 0}">
                                            <div class="col input-group">
                                                <span class="input-group-text bg-dark" style="border-color: #5e646a;">기획</span>
                                                <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                                    <input class="form-check-input mt-0" type="radio" value="PL" name="position" required>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>

                                <!-- subject -->
                                <div class="mb-30 mb-md-20">
                                    <h6>지원 내용</h6>
                                    <textarea name="subject" id="subject" class="input-md round form-control" rows="6" placeholder="본인을 소개해주세요 😀" maxlength="400"></textarea>
                                </div>

                                <!-- Send Button -->
                                <button type="button" class="btn btn-mod btn-w btn-medium btn-round" onclick="addRequest()">
                                    신청하기
                                </button>

                            </form>
                            <!-- End Form -->

                        </div>
                        <!-- End Add Comment -->
                    </c:if>
               <%-- </sec:authorize>--%>

            </div>
            <!-- End Content -->

            <!-- Sidebar -->
            <div class="col-md-4 col-lg-3 offset-lg-1 mt-10">

                <div>

                    <!-- 언어 -->
                    <div class="widget">

                        <h3 class="widget-title">사용 기술</h3>

                        <div class="widget-body">
                            <div class="tags">
                                <c:forEach var="item" items="${project.langArray}">
                                    <a href="#">${item}</a>
                                </c:forEach>
                            </div>
                        </div>

                    </div>
                    <!-- End Widget -->

                    <!-- 포지션 -->
                    <c:choose>
                        <c:when test="${project.state eq '1'}">
                            <div class="widget">
                                <h3 class="widget-title">남은 포지션</h3>
                                <div class="widget-body">
                                    <p class="mb-1">프론트엔드 개발자 <span class="badge <c:if test='${project.frontRcnt > 0}'>bg-primary</c:if>">${project.frontRcnt}</span></p>
                                    <p class="mb-1">백엔드 개발자 <span class="badge <c:if test='${project.backRcnt > 0}'>bg-primary</c:if>">${project.backRcnt}</span></p>
                                    <p class="mb-1">풀스택 개발자 <span class="badge <c:if test='${project.fullRcnt > 0}'>bg-primary</c:if>">${project.fullRcnt}</span></p>
                                    <p class="mb-1">디자이너 <span class="badge <c:if test='${project.designRcnt > 0}'>bg-primary</c:if>">${project.designRcnt}</span></p>
                                    <p class="mb-1">기획자 <span class="badge <c:if test='${project.plannerRcnt > 0}'>bg-primary</c:if>">${project.plannerRcnt}</span></p>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="widget">
                                <h3 class="widget-title">포지션 정보</h3>
                                <div class="widget-body">
                                    <p class="mb-1">프론트엔드 개발자 <span class="badge bg-info" id="feCount"></span></p>
                                    <p class="mb-1">백엔드 개발자  <span class="badge bg-info" id="beCount"></span></p>
                                    <p class="mb-1">풀스택 개발자  <span class="badge bg-info" id="fsCount"></span></p>
                                    <p class="mb-1">디자이너  <span class="badge bg-info" id="deCount"></span></p>
                                    <p class="mb-1">기획자  <span class="badge bg-info" id="plCount"></span></p>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <!-- End 포지션 -->

                    <!-- 기간 -->
                    <div class="widget">

                        <h3 class="widget-title">진행 기간 (${project.projectTerm}일)</h3>

                        <div class="widget-body">
                            <fmt:formatDate value="${project.projectSdt}" type="both" pattern="yyyy-MM-dd"/>
                            ~
                            <fmt:formatDate value="${project.projectEdt}" type="both" pattern="yyyy-MM-dd"/>
                        </div>

                    </div>
                    <!-- End Widget -->

                    <!-- 진행 방식 -->
                    <div class="widget">

                        <h3 class="widget-title">진행 방식</h3>

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

                    <c:if test="${project.leaderId eq member.name
                                  and project.state ne '4'}">
                        <!-- 설정 -->
                        <div class="widget">

                            <h3 class="widget-title">설정</h3>

                            <div class="widget-body">
                                <button type="button" onclick="" class="btn btn-mod btn-w btn-round btn-small">
                                    수정하기
                                </button>
                                <button type="button" onclick="deleteProject()" class="btn btn-mod btn-w btn-round btn-small" style="background: rgb(251 71 71 / 90%);">
                                    프로젝트 삭제
                                </button>
                            </div>

                        </div>
                        <!-- End Widget -->
                    </c:if>

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
  /**
   * 작성시간 표시
   */
  moment.locale('ko');
  $("#createAt").append(moment("<fmt:formatDate value="${project.recruitSdt}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>").fromNow());

  const viewer = new toastui.Editor.factory({
    el: document.querySelector("#viewer"),
    viewer: true,
    initialValue: '${project.subject}',
    theme: 'dark'
  });

  /**
   * 프로젝트 시작 시간 설정
   */
  today = new Date();
  var projectSdtInput = document.getElementById("projectSdt");
  projectSdtInput.setAttribute("value", moment(today).format("YYYY-MM-DD"));
  var projectEdtInput = document.getElementById("projectEdt");
  projectEdtInput.setAttribute("value", moment(today.setDate(today.getDate() + ${project.projectTerm})).format("YYYY-MM-DD"));
  /*$("#projectSdt").on("change", (e) => {
    const sdtDate = new Date(projectSdtInput.value);
    projectEdtInput.setAttribute("value", moment(sdtDate.setDate(sdtDate.getDate() + ${project.projectTerm})).format("YYYY-MM-DD"));
  })*/


  var feCount = 0;
  var beCount = 0;
  var fsCount = 0;
  var deCount = 0;
  var plCount = 0;
  <c:forEach items="${team }" var="item">
  <c:if test="${item.position eq 'FE'}">feCount++</c:if>
  <c:if test="${item.position eq 'BE'}">beCount++</c:if>
  <c:if test="${item.position eq 'FS'}">fsCount++</c:if>
  <c:if test="${item.position eq 'DE'}">deCount++</c:if>
  <c:if test="${item.position eq 'PL'}">plCount++</c:if>
  </c:forEach>
  $("#feCount").html(feCount);
  $("#beCount").html(beCount);
  $("#fsCount").html(fsCount);
  $("#deCount").html(deCount);
  $("#plCount").html(plCount);

  /**
   * 프로젝트 합류 요청 ajax
   */
  function addRequest() {
    $.ajax({
      url: "../api/project/request",
      type: "POST",
      data: $("#addRequestForm").serialize(),
      dataType: "json",
      success: function(res) {
        console.log(res);
        alert("지원하였습니다.");
        location.reload();
      },
      error: function (error) {
        alert("에러입니다.")
        console.log(error);
      }
    })
  }

  /**
   * todo 프로젝트 수정
   */
  function updateProject() {
    $.ajax({
      url: "../api/project/update",
      type: "POST",
      data: "",
      dataType: "json",
      success: function(res) {
        console.log(res);
        alert("수정하였습니다.");
        location.reload();
      },
      error: function (error) {
        alert("에러입니다.")
        console.log(error);
      }
    })
  }

  /**
   * 프로젝트 삭제
   */
  function deleteProject() {
    $.ajax({
      url: "../api/project/delete",
      type: "POST",
      data: {
        "projectNo": ${project.projectNo},
        "leaderId": '${project.leaderId}'
      },
      dataType: "json",
      success: function(res) {
        alert("프로젝트가 삭제되었습니다.");
        location.href = "/project/main.do";
      },
      error: function (error) {
        alert("에러입니다.")
        console.log(error);
      }
    })
  }

  /**
   * 프로젝트 시작
   */
  function startProject() {
    $.ajax({
      url: "../api/project/start",
      type: "POST",
      data: {
        "projectNo": ${project.projectNo},
        "leaderId": '${member.name}',
        "projectSdt": $("input[name=projectSdt]").val(),
        "projectEdt": $("input[name=projectEdt]").val(),
      },
      dataType: "json",
      success: function(res) {
        console.log(res);
        alert("프로젝트가 시작되었습니다.");
        location.reload();
      },
      error: function (error) {
        alert("에러입니다.")
        console.log(error);
      }
    })
  }

  function completeProject() {
    $.ajax({
      url: "../api/project/complete",
      type: "POST",
      data: {
        "projectNo": ${project.projectNo},
        "leaderId": '${project.leaderId}'
      },
      dataType: "json",
      success: function(res) {
        console.log(res);
        alert("프로젝트가 완료되었습니다.");
        location.reload();
      },
      error: function (error) {
        alert("에러입니다.");
        console.log(error);
      }
    })
  }
</script>
