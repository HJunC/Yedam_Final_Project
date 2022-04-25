<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<script src="${resources}/js/moment.min.js"></script>
<script src="${resources}/js/moment-with-locales.min.js"></script>
<!-- Home Section -->
<section class="page-section bg-dark-alfa-50 bg-scroll" data-background="${resources}/images/project/octavian-dan-b21Ty33CqVs-unsplash.jpg" id="home">
    <div class="container relative">

        <div class="row">

            <div class="col-md-8">
                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                    <h1 class="hs-line-7 mb-20 mb-xs-10">개발 프로젝트</h1>
                </div>
                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
                        딱 맞는 사람과 함께 개발 프로젝트를 진행해보세요
                    </p>
                </div>
            </div>

        </div>

    </div>
</section>
<!-- End Home Section -->
<style>
    .my-project {
        background-color: #1b1b1b;
        padding: 0;
        color: white !important;
    }
    .my-project:hover {
        text-decoration : none;
        background-color: #0e0e0e;;
    }
</style>
<!-- Call Action Section -->
<section class="small-section bg-dark light-content">
    <div class="container relative">
        <c:choose>
            <c:when test="${not empty userProject}">
            <h3>내 프로젝트</h3>
                <a href="projectDetail.do?no=${userProject.projectNo}" class="list-group-item d-flex justify-content-between align-items-start pt-2 pb-2 my-project" aria-current="true">
                    <div class="ms-2 me-auto">
                        <div class="countdown-search-list mb-1">
                            <i class="fa fa-users"></i> (${userProject.crntRcnt}/${userProject.totalRcnt})
                        </div>
                        <div>
                            <h5 class="mb-2">${userProject.projectName} <span class="fs-6" style="color: #727272">(${userProject.projectTerm}일)</span></h5>
                            <div class="lang-search-list">${userProject.lang}</div>
                        </div>
                    </div>
                    <div>
                        <div class="info-search-list mt-40">
                            <i class="fa fa-eye"></i> ${userProject.hit}&nbsp;&nbsp;&nbsp;
                            <i class="fa fa-user-clock"></i> ${userProject.applyRcnt} 지원</span>
                        </div>
                    </div>
                </a>
                <c:if test="${userProject.state eq '3'}">
                    <!-- Bar Item -->
                    <div class="progress tpl-progress mt-4" style="background-color: #ebebeb; position: relative;">
                        <div id="progressBar"
                             class="progress-bar"
                             role="progressbar"
                             aria-valuemin="0"
                             aria-valuemax="100"
                             style="background-color: #6ead5a">
                            <div>
                                <fmt:formatDate value="${userProject.projectSdt}" type="both" pattern="yyyy-MM-dd"/>
                            </div>
                        </div>
                        <div style="position: absolute; top: 8px; right: 0;">
                            <fmt:formatDate value="${userProject.projectEdt}" type="both" pattern="yyyy-MM-dd"/>
                        </div>
                    </div>
                    <!-- End Bar Item -->
                    <script>
                      /**
                       * progressBar
                       */
                      var today = new Date();
                      const start_date = new Date('<fmt:formatDate value="${userProject.projectSdt}" type="both" pattern="yyyy-MM-dd"/>');
                      const end_date = new Date('<fmt:formatDate value="${userProject.projectEdt}" type="both" pattern="yyyy-MM-dd"/>');
                      const total = end_date - start_date;
                      const perc = today - start_date;
                      const progressValue = Math.round(perc / total * 100 );
                      document.getElementById("progressBar").setAttribute("aria-valuenow", progressValue);
                    </script>
                </c:if>
            </c:when>

            <c:otherwise>
                <div class="row wow fadeInUpShort">
                    <div class="col-md-8 offset-md-2 text-center">
                        <h3 class="call-action-1-heading" style="font-size: 30px; color: rgba(255, 255, 255, 0.3);">진행중인 프로젝트가 없습니다</h3>
                        <div class="call-action-1-decription mb-60 mb-sm-30"></div>
                        <div class="local-scroll">
                            <a href="projectInsertForm.do" class="btn btn-mod btn-w btn-large btn-round">프로젝트 생성하기</a>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

        <c:if test="${sessionScope.isWait == true}">
            <h4 class="mt-5">지원자</h4>
            <c:choose>
                <c:when test="${not empty requestList}">
                    <c:forEach items="${requestList}" var="item">
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
                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <h3 class="call-action-1-heading" style="font-size: 30px; color: rgba(255, 255, 255, 0.3);">지원자가 없습니다.</h3>
                </c:otherwise>
            </c:choose>
        </c:if>

        <c:if test="${not empty userRequest}">
            <h3 class="mt-50">지원한 프로젝트</h3>

            <ul class="mt-4 mb-4 clearlist">
                <c:forEach items="${userRequest}" var="item">
                <li class="d-flex justify-content-between align-items-center">
                    <a href="projectDetail.do?no=${item.projectNo}" class="d-flex align-items-center" style="text-decoration-line : none;">
                        <c:choose>
                            <c:when test="${item.state eq '1'}"><span class="badge bg-info text-dark">검토중</span></c:when>
                            <c:when test="${item.state eq '2'}"><span class="badge bg-success">승인</span></c:when>
                            <c:when test="${item.state eq '3'}"><span class="badge bg-danger">거절</span></c:when>
                            <c:when test="${item.state eq '9'}"><span class="badge bg-warning text-dark">취소</span></c:when>
                        </c:choose>
                        &nbsp;&nbsp;
                        <span class="badge bg-dark">
                           ${item.position eq 'FE' ? '프론트엔드 개발자' : null}
                            ${item.position eq 'BE' ? '백엔드 개발자' : null}
                            ${item.position eq 'FS' ? '풀스택 개발자' : null}
                            ${item.position eq 'DE' ? '디자이너' : null}
                            ${item.position eq 'PL' ? '기획자' : null}
                        </span>
                        &nbsp;&nbsp;
                        ${item.subject }
                        <span>- ${item.requestDt}</span>
                    </a>
                    <button type="button" class="btn btn-mod btn-w btn-medium btn-round" onclick="deleteRequest('${item.memberId }', '${item.projectNo }')">지원 삭제</button>
                </li>
                </c:forEach>
            </ul>
        </c:if>
    </div>
</section>
<!-- End Call Action Section -->

<!-- Divider -->
<hr class="mt-0 mb-0 white" />
<!-- End Divider -->

<!-- Call Action Section -->
<section class="small-section bg-dark light-content">
    <div class="container relative">
        <div>
            <h3 class="me-4" style="display: inline-block;">팀 프로젝트 찾기</h3>
            <a href="search.do?pageNum=1&amount=10" class="btn btn-mod btn-border-w btn-round btn-small">프로젝트 더보기</a>
        </div>
        <div class="list-group project-list">
            <script>
                var timeArray = [];
            </script>
            <c:forEach items="${projectList }" var="item">
                <a href="projectDetail.do?no=${item.projectNo}" class="list-group-item d-flex justify-content-between align-items-start pt-2 pb-2" aria-current="true">
                    <div class="ms-2 me-auto">
                        <div class="countdown-search-list mb-1">
                            <i class="fa fa-users"></i> (${item.crntRcnt}/${item.totalRcnt})&nbsp;&nbsp;&nbsp;
                            <i class="fa fa-stopwatch"></i> 마감 <span id="timer${item.projectNo}"></span>
                        </div>
                        <div>
                            <div class="mb-2">
                                <h5 class="list-title">${item.projectName}</h5>
                                <span class="fs-6" style="color: #727272">(${item.projectTerm}일)</span>
                            </div>
                            <div class="lang-search-list">${item.lang}</div>
                        </div>
                    </div>
                    <script>
                      timeArray.push({
                        "id": 'timer' + '${item.projectNo}',
                        "endDate": '<fmt:formatDate value="${item.recruitEdt}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>'
                      })
                    </script>
                    <div>
                        <div>
                            <span class="info-search-list">남은 포지션</span>
                            <span class="badge me-1 ${item.frontRcnt > 0 ? 'bg-custom-primary' : 'bg-dark'}" data-bs-toggle="tooltip" data-bs-placement="bottom" title="프론트엔드 개발자">FE ${item.frontRcnt}</span>
                            <span class="badge me-1 ${item.backRcnt > 0 ? 'bg-custom-primary' : 'bg-dark'}" data-bs-toggle="tooltip" data-bs-placement="bottom" title="백엔드 개발자">BE ${item.backRcnt}</span>
                            <span class="badge me-1 ${item.fullRcnt > 0 ? 'bg-custom-primary' : 'bg-dark'}" data-bs-toggle="tooltip" data-bs-placement="bottom" title="풀스택 개발자">FS ${item.fullRcnt}</span>
                            <span class="badge me-1 ${item.designRcnt > 0 ? 'bg-custom-primary' : 'bg-dark'}" data-bs-toggle="tooltip" data-bs-placement="bottom" title="디자이너">DE ${item.designRcnt}</span>
                            <span class="badge ${item.plannerRcnt > 0 ? 'bg-custom-primary' : 'bg-dark'}" data-bs-toggle="tooltip" data-bs-placement="bottom" title="기획자">PL ${item.plannerRcnt}</span>
                        </div>

                        <div class="info-search-list mt-40">
                            <i class="fa fa-eye"></i> ${item.hit}&nbsp;&nbsp;&nbsp;
                            <i class="fa fa-user-clock"></i> ${item.applyRcnt} 지원</span>
                        </div>
                    </div>
                </a>
            </c:forEach>
            <script>
              function countDate(id, endDate) {
                var getCurrentTime = moment();
                var targetTime = moment(endDate);
                var getCurrentTimeUnix = getCurrentTime.unix();
                var targetTimeUnix = targetTime.unix();
                var leftTime = targetTimeUnix - getCurrentTimeUnix;
                var duration = moment.duration(leftTime, 'seconds');
                var interval = 1000;
                var intv = setInterval(function(){
                  if (duration.asSeconds() <= 1 || getCurrentTimeUnix >= targetTimeUnix ) {
                    $("#"+id).html('-');
                    clearInterval(intv);
                  }else{
                    duration = moment.duration(duration.asSeconds() - 1, 'seconds');
                    var timer = {
                      hours : (duration.hours() < 10) ? '0' + duration.hours() : duration.hours(),
                      minutes : (duration.minutes() < 10) ? '0' + duration.minutes() : duration.minutes(),
                      seconds : (duration.seconds() < 10) ? '0' + duration.seconds() : duration.seconds()
                    }
                    $("#"+id).html(
                      targetTime.diff(getCurrentTime, 'days') + '일 ' +
                      timer.hours + ' : ' + timer.minutes + ' : ' +  timer.seconds
                    );
                  }
                }, interval);
              }

              timeArray.forEach(value => {
                countDate(value.id, value.endDate);
              });
            </script>
        </div>

    </div>
</section>
<!-- End Call Action Section -->

<!-- Divider -->
<hr class="mt-0 mb-0 white" />
<!-- End Divider -->

<!-- Section -->
<section class="page-section bg-dark light-content pt-60">
    <div class="container relative">

        <div class="row">
            <h3 class="me-4" style="display: inline-block;">완료된 프로젝트</h3>
            <%--<c:forEach items="${completedList }" var="item">
                ${item.projectName}
            </c:forEach>--%>
            <!-- Post Item -->
            <div class="col-sm-6 col-md-4 col-lg-4 mb-md-50">

                <div class="post-prev-img">
                    <img src="${resources}/images/blog/post-prev-1.jpg" alt="" class="wow scaleOutIn" data-wow-duration="1.2s" />
                </div>

                <div class="post-prev-title mb-10">
                    Branding
                </div>

            </div>
            <!-- End Post Item -->

            <!-- Post Item -->
            <div class="col-sm-6 col-md-4 col-lg-4 mb-md-50">

                <div class="post-prev-img">
                    <img src="${resources}/images/blog/post-prev-2.jpg" alt="" class="wow scaleOutIn" data-wow-duration="1.2s" />
                </div>

                <div class="post-prev-title mb-10">
                    Design & Development
                </div>

            </div>
            <!-- End Post Item -->

            <!-- Post Item -->
            <div class="col-sm-6 col-md-4 col-lg-4 mb-md-50">

                <div class="post-prev-img">
                    <img src="${resources}/images/blog/post-prev-3.jpg" alt="" class="wow scaleOutIn" data-wow-duration="1.2s" />
                </div>

                <div class="post-prev-title mb-10">
                    Marketing
                </div>

            </div>
            <!-- End Post Item -->

        </div>

    </div>
</section>
<!-- End Section -->

<!-- Divider -->
<hr class="mt-0 mb-0 white" />
<!-- End Divider -->

<!-- Process Section -->
<section class="page-section bg-dark light-content">
    <div class="container relative">

        <!-- Grid -->
        <div class="row">

            <!-- Text Item -->
            <div class="col-md-12 col-lg-3">
                <div class="align-left">
                    <h2 class="work-process-heading mt-0">매칭 서비스</h2>
                    <p class="work-process-description">
                        Lorem ipsum dolor sit amet casume adipisin elit. In maximus ligula semper metus pellentesque mattis. Maecenas volutpat, diam enim.
                    </p>
                </div>
            </div>
            <!-- End Text Item -->

            <!-- Item -->
            <div class="col-md-4 col-lg-3">
                <div class="work-process-item text-center pt-20">
                    <div class="work-process-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
                            <path d="M20 15c0 .552-.448 1-1 1s-1-.448-1-1 .448-1 1-1 1 .448 1 1m-3 0c0 .552-.448 1-1 1s-1-.448-1-1 .448-1 1-1 1 .448 1 1m-3 0c0 .552-.448 1-1 1s-1-.448-1-1 .448-1 1-1 1 .448 1 1m5.415 4.946c-1 .256-1.989.482-3.324.482-3.465 0-7.091-2.065-7.091-5.423 0-3.128 3.14-5.672 7-5.672 3.844 0 7 2.542 7 5.672 0 1.591-.646 2.527-1.481 3.527l.839 2.686-2.943-1.272zm-13.373-3.375l-4.389 1.896 1.256-4.012c-1.121-1.341-1.909-2.665-1.909-4.699 0-4.277 4.262-7.756 9.5-7.756 5.018 0 9.128 3.194 9.467 7.222-1.19-.566-2.551-.889-3.967-.889-4.199 0-8 2.797-8 6.672 0 .712.147 1.4.411 2.049-.953-.126-1.546-.272-2.369-.483m17.958-1.566c0-2.172-1.199-4.015-3.002-5.21l.002-.039c0-5.086-4.988-8.756-10.5-8.756-5.546 0-10.5 3.698-10.5 8.756 0 1.794.646 3.556 1.791 4.922l-1.744 5.572 6.078-2.625c.982.253 1.932.407 2.85.489 1.317 1.953 3.876 3.314 7.116 3.314 1.019 0 2.105-.135 3.242-.428l4.631 2-1.328-4.245c.871-1.042 1.364-2.384 1.364-3.75"/>
                        </svg>
                    </div><h3 class="work-process-title">1. 팀원 모집</h3>
                </div>
            </div>
            <!-- End Item -->

            <!-- Item -->
            <div class="col-md-4 col-lg-3">
                <div class="work-process-item text-center pt-20">
                    <div class="work-process-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
                            <path d="M6 3.447h-1v-1.447h19v16h-7.731l2.731 4h-1.311l-2.736-4h-1.953l-2.736 4h-1.264l2.732-4h-2.732v-1h8v-1h3v1h3v-14h-17v.447zm2.242 17.343c-.025.679-.576 1.21-1.256 1.21-.64 0-1.179-.497-1.254-1.156l-.406-4.034-.317 4.019c-.051.656-.604 1.171-1.257 1.171-.681 0-1.235-.531-1.262-1.21l-.262-6.456-.308.555c-.241.437-.8.638-1.265.459-.404-.156-.655-.538-.655-.951 0-.093.012-.188.039-.283l1.134-4.098c.17-.601.725-1.021 1.351-1.021h4.096c.511 0 1.012-.178 1.285-.33.723-.403 2.439-1.369 3.136-1.793.394-.243.949-.147 1.24.217.32.396.286.95-.074 1.297l-3.048 2.906c-.375.359-.595.849-.617 1.381-.061 1.397-.3 8.117-.3 8.117zm-5.718-10.795c-.18 0-.34.121-.389.294-.295 1.04-1.011 3.666-1.134 4.098l1.511-2.593c.172-.295.623-.18.636.158l.341 8.797c.01.278.5.287.523.002 0 0 .269-3.35.308-3.944.041-.599.449-1.017.992-1.017.547.002.968.415 1.029 1.004.036.349.327 3.419.385 3.938.043.378.505.326.517.022 0 0 .239-6.725.3-8.124.033-.791.362-1.523.925-2.061l3.045-2.904c-.661.492-2.393 1.468-3.121 1.873-.396.221-1.07.457-1.772.457h-4.096zm16.476 1.005h-5v-1h5v1zm2-2h-7v-1h7v1zm-15.727-4.994c-1.278 0-2.315 1.038-2.315 2.316 0 1.278 1.037 2.316 2.315 2.316s2.316-1.038 2.316-2.316c0-1.278-1.038-2.316-2.316-2.316zm0 1c.726 0 1.316.59 1.316 1.316 0 .726-.59 1.316-1.316 1.316-.725 0-1.315-.59-1.315-1.316 0-.726.59-1.316 1.315-1.316zm15.727 1.994h-7v-1h7v1z"/>
                        </svg>
                    </div><h3 class="work-process-title">2. 프로젝트 시작</h3>
                </div>
            </div>
            <!-- End Item -->

            <!-- Item -->
            <div class="col-md-4 col-lg-3">
                <div class="work-process-item text-center pt-20">
                    <div class="work-process-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
                            <path d="M15.551 14.703c.474 1.372 2.049 2.459 3.801 1.868l.021-.007c1.565-.544 2.391-2.242 1.854-3.807-.187-.546-.425-1.137-.695-1.757h-5.967c.299 1.366.625 2.647.986 3.703m2.264-9.232l-4.051 1.388c.183 1.037.379 2.103.59 3.141h5.726c-.655-1.404-1.445-2.94-2.265-4.529m.492-1.226c1.524 2.958 3.086 5.915 3.866 8.187.598 1.744-.045 3.895-2.028 4.874l1.211 3.529c.291.812 1.322.926 2.392.808l.252.735-4.728 1.622-.272-.788c.903-.479 1.688-1.215 1.41-2.054l-1.208-3.52c-2.162.439-3.994-.861-4.596-2.61-.791-2.304-1.405-5.566-1.976-8.837l5.677-1.946zm-8.872 6.755h-5.967c-.27.62-.508 1.211-.695 1.757-.536 1.565.289 3.263 1.854 3.807l.021.007c1.753.591 3.328-.496 3.801-1.868.362-1.056.688-2.337.986-3.703m-5.515-1h5.726c.211-1.038.407-2.104.591-3.141l-4.051-1.388c-.821 1.589-1.611 3.125-2.266 4.529m7.45-3.809c-.571 3.271-1.185 6.533-1.976 8.837-.602 1.749-2.434 3.049-4.596 2.61l-1.208 3.52c-.278.839.507 1.575 1.41 2.054l-.271.788-4.729-1.622.252-.735c1.07.118 2.102.004 2.392-.808l1.211-3.529c-1.983-.979-2.625-3.13-2.028-4.874.78-2.272 2.342-5.229 3.867-8.187l5.676 1.946zm7.13 7.811c.414 0 .75.336.75.75 0 .413-.336.75-.75.75s-.75-.337-.75-.75c0-.414.336-.75.75-.75m-14.5.248c0 .414.336.75.75.75s.75-.336.75-.75c0-.413-.336-.75-.75-.75s-.75.337-.75.75m3.25-2.25c.414 0 .75.337.75.75 0 .414-.336.75-.75.75s-.75-.336-.75-.75c0-.413.336-.75.75-.75m10.5-.499c.414 0 .75.336.75.751 0 .413-.336.75-.75.75s-.75-.337-.75-.75c0-.415.336-.751.75-.751m-5.249-7.977v-3.023c0-.277-.223-.5-.5-.5-.275 0-.499.223-.499.5v3.023c0 .276.224.5.499.5.277 0 .5-.224.5-.5m1.932.462l1.641-2.79c.142-.238.062-.545-.176-.685-.239-.139-.544-.062-.684.177l-1.643 2.79c-.14.238-.06.545.176.685.08.047.167.069.254.069.172 0 .339-.088.432-.246m-4.552.246c-.171 0-.337-.088-.432-.246l-1.642-2.79c-.14-.238-.061-.545.177-.685.237-.14.544-.061.685.177l1.643 2.79c.139.238.061.545-.178.685-.08.047-.166.069-.253.069"/>
                        </svg>
                    </div><h3 class="work-process-title">3. 프로젝트 완성</h3>
                </div>
            </div>
            <!-- End Item -->

        </div>
        <!-- End Grid -->

    </div>
</section>
<!-- End Process Section -->

<!-- Testimonials Section -->
<section class="page-section bg-dark bg-dark-alfa-70 bg-scroll light-content" data-background="${resources}/images/project/thomas-lefebvre-gp8BLyaTaA0-unsplash.jpg">
    <div class="container relative">

        <div class="row">
            <div class=" col-lg-8 offset-lg-2 wow fadeInUpShort">

                <div class="text-center mb-50 mb-sm-20">
                    <h2 class="section-title">프로젝트 후기</h2>
                </div>

                <div class="text-slider">

                    <!-- Slide Item -->
                    <div>
                        <blockquote class="testimonial">
                            <p style="font-size: 20px;">
                                훌륭한 개발자들 만나서 즐겁게 프로젝트 했습니다 덕분에 취업에 성공했습니다 감사합니다
                            </p>
                            <footer class="testimonial-author mt-20 mt-sm-10">
                                — 황준철, Google inc.
                            </footer>
                        </blockquote>
                    </div>
                    <!-- End Slide Item -->

                    <!-- Slide Item -->
                    <div>
                        <blockquote class="testimonial">
                            <p style="font-size: 20px;">
                                빠르게 사람을 모집하고 진행할 수 있어서 좋았습니다
                            </p>
                            <footer class="testimonial-author mt-20 mt-sm-10">
                                — 김지수, Naver inc.
                            </footer>
                        </blockquote>
                    </div>
                    <!-- End Slide Item -->

                    <!-- Slide Item -->
                    <div>
                        <blockquote class="testimonial">
                            <p style="font-size: 20px;">
                                해보고 싶은 프로젝트가 있어서 이용했는데 좋네요 ㅎㅎ 앞으로도 잘 이용하겠습니다
                            </p>
                            <footer class="testimonial-author mt-20 mt-sm-10">
                                — 곽두팔, Kakao inc.
                            </footer>
                        </blockquote>
                    </div>
                    <!-- End Slide Item -->

                </div>

            </div>
        </div>

    </div>
</section>
<!-- End Testimonials Section -->

<script>
  // 작성시간
  moment.locale('ko');
  function createAtKr(date) {
    return moment(date).fromNow();
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

  /**
   * 지원 삭제
   */
  function deleteRequest(memberId, projectNo) {
    $.ajax({
      url: "../api/project/deleteRequest",
      type: "POST",
      data: {
        memberId,
        projectNo
      },
      success: function (res) {
        alert("지원 신청을 삭제하였습니다.");
        location.reload();
      },
      error: function (res) {
        console.log(res);
        alert("에러");
      }
    })
  }
</script>