<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<script src="${resources}/js/moment.min.js"></script>
<script src="${resources}/js/moment-with-locales.min.js"></script>
<!-- Home Section -->
<section class="small-section bg-dark-alfa-50 bg-scroll light-content" data-background="images/full-width-images/section-bg-19.jpg" id="home">
    <div class="container relative pt-70">

        <div class="row">

            <div class="col-md-8">
                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                    <h2 class="hs-line-7 mb-20 mb-xs-10">🔍프로젝트 찾기</h2>
                </div>
                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0">

                    </p>
                </div>
            </div>

            <div class="col-md-4 mt-30 wow fadeInUpShort" data-wow-delay=".1s">
                <div class="mod-breadcrumbs text-end">
                    <a href="/project/main.do">프로젝트</a>&nbsp;<span class="mod-breadcrumbs-slash">•</span>&nbsp;<span>프로젝트 검색</span>
                </div>
            </div>

        </div>

    </div>
</section>
<!-- End Home Section -->

<style>
    .widget {
        margin-bottom: 24px;
    }
</style>
<!-- Section -->
<section class="page-section bg-dark light-content" style="overflow: initial;">
    <div class="container relative">

        <div class="row">

            <!-- Content -->
            <div class="col-md-8 offset-lg-1 mb-sm-80 order-first order-md-last">

                <div class="list-group project-list">
                    <c:if test="${not empty projectList}">
                        <script>
                          var timeArray = [];
                        </script>
                        <c:forEach items="${projectList }" var="item">
                            <a href="projectDetail.do?no=${item.projectNo}" class="list-group-item d-flex justify-content-between align-items-start pt-3 pb-3" aria-current="true">
                                <div class="ms-2 me-auto">
                                    <div class="countdown-search-list mb-2">
                                        <i class="fa fa-users"></i> (${item.crntRcnt}/${item.totalRcnt})&nbsp;&nbsp;&nbsp;
                                        <i class="fa fa-stopwatch"></i> 마감 <span id="timer${item.projectNo}"></span>
                                    </div>
                                    <div>
                                        <h5 class="mb-2">${item.projectName} <span class="fs-6" style="color: #727272">(${item.projectTerm}일)</span></h5>
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
                                        <span class="badge me-1 ${item.frontRcnt > 0 ? 'bg-custom-primary' : 'bg-dark'}">프론트엔드 ${item.frontRcnt}</span>
                                        <span class="badge me-1 ${item.backRcnt > 0 ? 'bg-custom-primary' : 'bg-dark'}">백엔드 ${item.backRcnt}</span>
                                        <span class="badge me-1 ${item.fullRcnt > 0 ? 'bg-custom-primary' : 'bg-dark'}">풀스택 ${item.fullRcnt}</span>
                                        <span class="badge me-1 ${item.designRcnt > 0 ? 'bg-custom-primary' : 'bg-dark'}">디자인 ${item.designRcnt}</span>
                                        <span class="badge ${item.plannerRcnt > 0 ? 'bg-custom-primary' : 'bg-dark'}">기획 ${item.plannerRcnt}</span>
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
                            console.log(value)
                            countDate(value.id, value.endDate);
                          });
                        </script>
                    </c:if>
                    <c:if test="${empty projectList}">
                        <h3 class="call-action-1-heading" style="font-size: 30px; color: rgba(255, 255, 255, 0.3);">검색 결과가 없습니다.</h3>
                    </c:if>
                </div>

                <!-- Pagination -->
                <div class="pagination">
                    <ul class="pagination" id="pagination"></ul>
                </div>
                <!-- End Pagination -->

            </div>
            <!-- End Content -->

            <!-- Sidebar -->
            <div class="col-md-4 col-lg-3 mt-10">

                <form class="form" id="searchForm" action="../project/search.do" style="position: sticky; top: 100px" method="get">

                    <!-- Search Widget -->
                    <div class="widget">
                        <h3 class="widget-title">프로젝트 명</h3>

                        <div class="search-wrap">
                            <button class="search-button animate" type="button" title="Start Search" onclick="search()">
                                <i class="fa fa-search"></i>
                            </button>
                            <input type="text" class="form-control search-field round" name="projectName" placeholder="Search..." value="${search.projectName}">
                        </div>
                    </div>
                    <!-- End Search Widget -->

                    <!-- 언어 -->
                    <div class="widget">

                        <h3 class="widget-title">언어</h3>

                        <script src="${resources}/js/common/Languages.js"></script>

                        <div class="widget-body">
                            <div class="tags" id="languages"></div>
                        </div>

                        <script>
                          var languages = $("#languages");
                          var checkBox = "";
                          mostUsed.forEach((item, index) => {
                            checkBox += '<input type="checkbox" class="btn-check" id="btncheck'+index+'" name="langArray" value="' + item + '">';
                            checkBox += '<label class="btn btn-outline-primary" for="btncheck'+index+'">' + item + '</label>';
                          })
                          languages.append(checkBox);
                        </script>
                    </div>
                    <!-- End Widget -->

                    <!-- 포지션 -->
                    <div class="widget">

                        <h3 class="widget-title">모집 포지션</h3>

                        <div class="widget-body">
                            <div class="tags">
                                <input type="checkbox" class="btn-check" id="FE" name="frontRcnt" value="1">
                                <label class="btn btn-outline-primary" for="FE">프론트엔드</label>
                                <input type="checkbox" class="btn-check" id="BE" name="backRcnt" value="1">
                                <label class="btn btn-outline-primary" for="BE">백엔드</label>
                                <input type="checkbox" class="btn-check" id="FS" name="fullRcnt" value="1">
                                <label class="btn btn-outline-primary" for="FS">풀스택</label>
                                <input type="checkbox" class="btn-check" id="DE" name="designRcnt" value="1">
                                <label class="btn btn-outline-primary" for="DE">디자이너</label>
                                <input type="checkbox" class="btn-check" id="PL" name="plannerRcnt" value="1">
                                <label class="btn btn-outline-primary" for="PL">기획자</label>
                            </div>
                        </div>

                    </div>
                    <!-- End Widget -->

                    <!-- 기간 -->
                    <div class="widget">

                        <h3 class="widget-title">프로젝트 기간</h3>

                        <div class="widget-body">
                            <input type="number" name="termStart" class="input-lg round form-control bg-dark-input" min="3" max="365" value="3">
                            ~
                            <input type="number" name="termEnd" class="input-lg round form-control bg-dark-input" min="3" max="365" value="15">
                        </div>

                    </div>
                    <!-- End Widget -->

                    <!-- 진행 방식 -->
                    <div class="widget">

                        <h3 class="widget-title">프로젝트 진행 방식</h3>

                        <div class="widget-body">
                            <div class="tags">
                                <a href="">온라인</a>
                                <a href="">오프라인</a>
                                <a href="">온/오프라인</a>
                            </div>
                        </div>

                    </div>
                    <!-- End Widget -->
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                </form>

            </div>
            <!-- End Sidebar -->

        </div>

    </div>
</section>
<!-- End Section -->

<script src="${resources}/js/common/jQueryPage.js"></script>

<script>
    var endPage = ${pageMaker.endPage}
    var current = ${pageMaker.cri.pageNum}

    window.pagObj = $('#pagination').twbsPagination({
      totalPages: endPage,
      startPage: current,
      visiblePages: 5, // 최대로 보여줄 페이지
      prev: "<i class='fa fa-chevron-left'></i>", // Previous Button Label
      next: "<i class='fa fa-chevron-right'></i>", // Next Button Label
      first: '«', // First Button Label
      last: '»', // Last Button Label
      onPageClick: function (event, page) { // Page Click event
        console.info("current page : " + page);
      } }).on('page', function (event, page) {
      searchPage(page);
    });

  function searchPage(page) {
    var searchForm = $("#searchForm");
    searchForm.find("input[name='pageNum']").val(page);
    searchForm.submit();
  }

  function search() {
    var searchForm = $("#searchForm");
    searchForm.find("input[name='pageNum']").val("1");
    searchForm.submit();
  }
</script>