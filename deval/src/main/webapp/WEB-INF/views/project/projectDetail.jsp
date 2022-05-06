<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />

<script src="${resources}/js/moment.min.js"></script>
<script src="${resources}/js/moment-with-locales.min.js"></script>
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
                            <c:choose>
                                <c:when test="${project.state eq '1' or project.state eq '2'}">
                                     마감 <span id="timer"></span>
                                    <script>
                                    var getCurrentTime = moment();
                                    var targetTime = moment('<fmt:formatDate value="${project.recruitEdt}" type="both" pattern="yyyy-MM-dd"/>');
                                    var getCurrentTimeUnix = getCurrentTime.unix();
                                    var targetTimeUnix = targetTime.unix();
                                    var leftTime = targetTimeUnix - getCurrentTimeUnix;
                                    var duration = moment.duration(leftTime, 'seconds');
                                    var interval = 1000;
                                    var intv = setInterval(function(){
                                      if (duration.asSeconds() <= 1 || getCurrentTimeUnix >= targetTimeUnix ) {
                                        $("#timer").html('-');
                                        clearInterval(intv);
                                      }else{
                                        duration = moment.duration(duration.asSeconds() - 1, 'seconds');
                                        var timer = {
                                          hours : (duration.hours() < 10) ? '0' + duration.hours() : duration.hours(),
                                          minutes : (duration.minutes() < 10) ? '0' + duration.minutes() : duration.minutes(),
                                          seconds : (duration.seconds() < 10) ? '0' + duration.seconds() : duration.seconds()
                                        }
                                        $("#timer").html(
                                          targetTime.diff(getCurrentTime, 'days') + '일 ' +
                                          timer.hours + ' : ' + timer.minutes + ' : ' +  timer.seconds
                                        );
                                      }
                                    }, interval);
                                    </script>
                                </c:when>
                                <c:otherwise>
                                    모집 마감 <fmt:formatDate value="${project.recruitEdt}" type="both" pattern="yyyy-MM-dd"/>
                                </c:otherwise>
                            </c:choose>
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
            <a href="#test-modal" class="btn btn-mod btn-w btn-medium round mt-10 lightbox-gallery-5 mfp-inline" id="modalTest">프로젝트 완료하기 🎉</a>

            <div id="test-modal" class="mfp-hide">
                <div class="d-flex justify-content-between align-items-center">
                    <h3>축하합니다 🏆</h3>
                    <div class="d-flex">
                        <input type="text" id="uri" class="form-control">
                        <button type="button" id="uriClip" class="btn" title="주소 복사하기" data-bs-toggle="tooltip" data-bs-placement="bottom">
                            <i class="fa fa-share-square"></i>
                        </button>
                    </div>

                </div>

                <div class="form-group mb-4">
                    <label><svg style="width: 18px;" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>GitHub</title><path d="M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12"/></svg>
                        깃허브 Repository 주소 (추가 exp +100)</label>
                    <input type="text" class="form-control mb-1" id="githubUri">
                    <div id="uriResult"></div>
                </div>
                <button type="button" onclick="completeProject()" class="btn btn-mod btn-round btn-large">완료 (exp + 300)</button>
            </div>
            <!-- End Lightbox Modal -->
            <script>
              function uriClip(){
                document.getElementById("uri").select();
                document.execCommand("copy");
                console.log("복사하였습니다!");
              }

              setTimeout(() => {
                $(".mfp-inline").magnificPopup({
                  closeOnBgClick: false
                });
              }, 1000);

              $("#uri").val(location.href);
              $("#uriClip").on("click", function () {
                uriClip();
              });

              var insertGithubUri = '';
              $("#githubUri").on("change", function () {
                $("#uriResult").html('');
                var isDone = true;
                var uriArray = $("#githubUri").val().split("/");
                console.log(uriArray);

                if (uriArray[0] !== 'https:' || uriArray[3] == null || uriArray[4] == null) {
                  $("#uriResult").html('<span style="color: red;">올바른 형식이 아닙니다.</span>');
                  isDone = false;
                }

                if (uriArray[2] !== 'github.com') {
                  $("#uriResult").html('<span style="color: red;">깃허브 주소가 아닙니다.</span>');
                  isDone = false;
                }

                if (isDone) {

                  $.ajax({
                    url: 'https://api.github.com/repos/' + uriArray[3] + '/' + uriArray[4],
                    type: "GET",
                    success: function (res) {
                      if (res.message === "Not Found") {
                        $("#uriResult").html("없는 Repository");
                      } else {
                        var str = '<div id="repositoryInfo" class="card mt-2"><div class="card-body">' +
                          '<div>\n' +
                          '프로젝트 이름 : ' + res.name +
                          '</div>\n' +
                          '<div class="d-flex align-items-center">\n' +
                          '생성자 : ' +
                          '<img src="' + res.owner.avatar_url + '" class="me-2" style="width: 30px; border-radius: 30px;">\n' +
                          res.owner.login +
                          '</div>\n' +
                          '<div class="d-flex align-items-center">\n' +
                          '만들어진 날짜 : ' + res.created_at + ' ' +
                          '마지막 푸쉬 : ' + res.pushed_at +
                          '</div>\n' +
                          '</div></div>';
                        $("#uriResult").html(str);
                        insertGithubUri = res.url;
                      }
                    },
                    error: function (res) {
                      $("#uriResult").html('<span style="color: red;">'+res.message+'</span>');
                    }
                  })
                }
              })

            </script>
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
                <c:if test="${project.state eq '4' and project.gitUri != null}">
                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                    <link rel="stylesheet" href="${resources}/css/common/github-markdown-dark.css">
                    <!-- Nav Tabs -->
                    <div class="blog-item mb-80 mb-xs-40">
                        <div class="align-center mb-40 mb-xxs-30">
                            <ul class="nav nav-tabs tpl-tabs animate" role="tablist">

                                <li class="nav-item">
                                    <a href="#item-1" aria-controls="item-1" class="nav-link active" data-bs-toggle="tab" role="tab" aria-selected="true">프로젝트 개요</a>
                                </li>

                                <li class="nav-item">
                                    <a href="#item-2" aria-controls="item-2" class="nav-link" data-bs-toggle="tab" role="tab" aria-selected="false">언어</a>
                                </li>

                            </ul>
                        </div>
                        <!-- End Nav Tabs -->

                        <!-- Tab panes -->
                        <div class="tab-content tpl-minimal-tabs-cont section-text">

                            <div class="tab-pane fade show active" id="item-1" role="tabpanel"></div>

                            <div class="tab-pane fade" id="item-2" role="tabpanel">
                                <canvas id="myChart" width="400" height="400"></canvas>
                            </div>

                        </div>
                        <!-- End Tab panes -->

                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/js-base64@3.6.1/base64.min.js"></script>
                    <script>
                      $.ajax({
                        url: '${project.gitUri}',
                        type: "GET",
                        success: function (res) {
                          makeFirstTab(res);
                          makeProjectLanguages(res);
                        },
                        error: function (res) {
                          $("#item-1").html("연결에러");
                        }
                      })

                      /**
                       * 프로젝트 개요 view
                       * @param res
                       */
                      function makeFirstTab(res) {
                        var str = $(`<div class="card text-white mb-3" style="background-color: initial; border-color: rgb(255 255 255 / 14%);">
                                      <div class="card-header d-flex justify-content-between" style="background-color: #000">
                                        <div>프로젝트 명 : <a href="`+res.html_url+`" style="text-decoration: none;">`+res.name+`</a></div>
                                        <div>
                                            <div class="align-right"><span class="badge bg-dark">생성: `+moment(res.created_at).format("YYYY-MM-DD HH:mm:ss")+`</span></div>
                                            <div class="align-right"><span class="badge bg-dark">마지막 업데이트: `+moment(res.updated_at).format("YYYY-MM-DD HH:mm:ss")+`</span></div>
                                            <div class="align-right"><span class="badge bg-dark">마지막 푸쉬: `+moment(res.pushed_at).format("YYYY-MM-DD HH:mm:ss")+`</span></div>
                                        </div>
                                      </div>
                                      <div class="card-body">
                                        <div class="markdown-body" style="background-color: initial;">`+getReadme(res.url)+`</p>
                                      </div>
                                    </div>`);
                        $("#item-1").append(str);
                      }

                      /**
                       * 레포지토리 Readme 가지고오는 메소드
                       * @param url 깃헙 api 레포지토리 주소
                       * @returns string
                       */
                      function getReadme(url) {
                        let result;
                        $.ajax({
                          url: url+'/readme',
                          type: "GET",
                          async: false,
                          success: function (res) {
                            result = Base64.decode(res.content);
                          },
                          error: function (res) {
                            result = "연결에러";
                          }
                        })
                        result = getMarkdown(result);
                        return result;
                      }

                      /**
                       * 레포지토리 markdown 언어를 html로 변환
                       * @param text markdown언어
                       * @returns string
                       */
                      function getMarkdown(text) {
                        let result;
                        $.ajax({
                          url: 'https://api.github.com/markdown',
                          type: "POST",
                          data: JSON.stringify({
                            "text" : text
                          }),
                          async: false,
                          success: function (res) {
                            result = res;
                          },
                          error: function (res) {
                            result = "연결에러";
                          }
                        })
                        return result;
                      }

                      function makeProjectLanguages(res) {
                        const githubLang = getProjectLanguages(res.url);
                        let langList = [];
                        let langValue = [];
                        let backgroundList = [];
                        for (const [key, value] of Object.entries(githubLang)) {
                          langList.push(key);
                          langValue.push(value);
                          backgroundList.push(generateRandomCode());
                        }
                        const ctx = document.getElementById('myChart');

                        const data = {
                          labels: langList,
                          datasets: [{
                            label: 'My First Dataset',
                            data: langValue,
                            backgroundColor: backgroundList
                          }]
                        };

                        const myChart = new Chart(ctx, {
                          type: 'pie',
                          data: data,
                          options: {
                            legend: {
                              labels: {
                                fontColor: "white",
                                fontSize: 16
                              }
                            },
                          }
                        })

                      }

                      /**
                       * 사용언어 불러오는 메소드
                       * @param url
                       * @returns { {string: number} }
                       */
                      function getProjectLanguages(url) {
                        var result = {};
                        $.ajax({
                          url: url+'/languages',
                          type: "GET",
                          async: false,
                          success: function (res) {
                            result = res;
                          },
                          error: function (res) {
                            result = "연결에러";
                          }
                        })
                        return result;
                      }

                      /**
                       * 랜덤한 색상 얻는 메소드
                       * @returns {string}
                       */
                      function generateRandomCode() {
                        var RGB_1 = Math.floor(Math.random() * (255 + 1));
                        var RGB_2 = Math.floor(Math.random() * (255 + 1));
                        var RGB_3 = Math.floor(Math.random() * (255 + 1));
                        var strRGBA = 'rgba(' + RGB_1 + ',' + RGB_2 + ',' + RGB_3 + ',0.5)';
                        return strRGBA;
                      }
                    </script>
                </c:if>

                <div class="blog-page-title"></div>

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
                              and (project.state eq '1' or project.state eq '2')}">
                <div class="mb-80 mb-xs-40">

                    <h4 class="blog-page-title">지원자</h4>

                    <c:choose>
                        <c:when test="${not empty project.requestList}">
                            <c:forEach items="${project.requestList}" var="item">
                                <c:if test="${item.state eq '1'}">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <div style="color: #999999;">
                                                <i class="fa fa-user"></i> ${item.memberId }
                                                | 포지션 :
                                                    ${item.position eq 'FE' ? '프론트엔드 개발자' : null}
                                                    ${item.position eq 'BE' ? '백엔드 개발자' : null}
                                                    ${item.position eq 'FS' ? '풀스택 개발자' : null}
                                                    ${item.position eq 'DE' ? '디자이너' : null}
                                                    ${item.position eq 'PL' ? '기획자' : null}
                                                | 지원 일자 : ${item.requestDt }
                                            </div>
                                            <p>${item.subject }</p>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-mod btn-w btn-medium btn-round" onclick="approveRequest('${item.memberId }', '${item.projectNo }', '${item.position }')">수락</button>
                                            <button type="button" class="btn btn-mod btn-w btn-medium btn-round" onclick="refuseRequest('${item.memberId }', '${item.projectNo }')">거절</button>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h3 class="call-action-1-heading" style="font-size: 30px; color: rgba(255, 255, 255, 0.3);">지원자가 없습니다.</h3>
                        </c:otherwise>
                    </c:choose>

                </div>
                </c:if>

                <sec:authorize access="isAuthenticated()">
                    <c:if test="${!sessionScope.isTeam
                                and project.state eq '1'
                                and empty userRequest
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
                </sec:authorize>
                <c:if test="${not empty userRequest and userRequest.state eq '1'}">
                    <div class="mb-80 mb-xs-40">

                        <h4 class="blog-page-title">검토중인 요청</h4>

                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <div style="color: #999999;">
                                    <i class="fa fa-user"></i> ${userRequest.memberId }
                                    | 포지션 :
                                        ${userRequest.position eq 'FE' ? '프론트엔드 개발자' : null}
                                        ${userRequest.position eq 'BE' ? '백엔드 개발자' : null}
                                        ${userRequest.position eq 'FS' ? '풀스택 개발자' : null}
                                        ${userRequest.position eq 'DE' ? '디자이너' : null}
                                        ${userRequest.position eq 'PL' ? '기획자' : null}
                                    | 지원 일자 : ${userRequest.requestDt }
                                </div>
                                <p>${userRequest.subject }</p>
                            </div>
                        </div>
                    </div>

                </c:if>
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
                                    <a href="search.do?langArray=${item}">${item}</a>
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
                                    <p class="mb-1">프론트엔드 개발자 <span class="badge bg-info text-dark" id="feCount"></span></p>
                                    <p class="mb-1">백엔드 개발자  <span class="badge bg-info text-dark" id="beCount"></span></p>
                                    <p class="mb-1">풀스택 개발자  <span class="badge bg-info text-dark" id="fsCount"></span></p>
                                    <p class="mb-1">디자이너  <span class="badge bg-info text-dark" id="deCount"></span></p>
                                    <p class="mb-1">기획자  <span class="badge bg-info text-dark" id="plCount"></span></p>
                                </div>
                            </div>
                            <script>
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
                            </script>
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
                                <button type="button" onclick="pageGoUpdateForm()" class="btn btn-mod btn-w btn-round btn-small">
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

  /**
   * 프로젝트 합류 요청 ajax
   */
  function addRequest() {
    var data = $("#addRequestForm").serializeObject();
    $.ajax({
      url: "../api/project/request",
      type: "POST",
      data: data,
      dataType: "json",
      success: function(res) {
        console.log(res);
        alert("지원하였습니다.");
        var msg = {
          memberId : '${project.leaderId}',
          subject : data.memberId + "님이 프로젝트에 " + data.position + " 포지션으로 지원하였습니다.!"
        }
        webSocket.send(JSON.stringify(msg));
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
        location.href = "main.do";
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

  /**
   * 프로젝트 완료
   */
  function completeProject() {
    $.ajax({
      url: "../api/project/complete",
      type: "POST",
      data: {
        "projectNo": ${project.projectNo},
        "leaderId": '${project.leaderId}',
        "gitUri": insertGithubUri
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

  /**
   * 요청 승인
   * @param memberId
   * @param projectNo
   * @param position
   */
  function approveRequest(memberId, projectNo, position) {
    $.ajax({
      url: "../api/project/approveRequest",
      type: "POST",
      data: {
        memberId,
        projectNo,
        position
      },
      success: function (res) {
        console.log(res);
        alert("팀에 합류하였습니다 !");
        var msg = {
          memberId,
          subject : projectNo + "번 프로젝트에 " + position + " 포지션으로 합류하였습니다!"
        }
        webSocket.send(JSON.stringify(msg));
        location.reload();
      },
      error: function (res) {
        console.log(res);
        alert("에러");
      }
    })
  }

  /**
   * 요청 거절
   * @param memberId
   * @param projectNo
   */
  function refuseRequest(memberId, projectNo) {
    $.ajax({
      url: "../api/project/refuseRequest",
      type: "POST",
      data: {
        memberId,
        projectNo
      },
      success: function (res) {
        console.log(res);
        alert("요청이 거절되었습니다.");
        var msg = {
          memberId,
          subject : projectNo + "번 프로젝트 지원요청이 거절되었습니다."
        }
        webSocket.send(JSON.stringify(msg));
        location.reload();
      },
      error: function (res) {
        console.log(res);
        alert("에러");
      }
    })
  }

  function pageGoUpdateForm() {
    var insdoc = "<input type='hidden' name='leaderId' value='${member.name}'>";
    insdoc += "<input type='hidden' name='projectNo' value='${project.projectNo}'>";

    var goform = $("<form>", {
      method: "post",
      action: 'projectUpdateForm.do',
      html: insdoc
    }).appendTo("body"); goform.submit();
  }
</script>
