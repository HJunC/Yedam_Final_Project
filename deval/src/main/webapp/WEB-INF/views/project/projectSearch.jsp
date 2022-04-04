<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
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
    .tags label {
        display: inline-block;
        margin: 0 2px 8px 0;
        padding: 5px 7px 6px 7px;
        border: 1px solid #ddd;
        color: #555;
        font-size: 15px;
        text-decoration: none;
        border-radius: 3px;
        -webkit-transition: all 0.27s cubic-bezier(0.000, 0.000, 0.580, 1.000);
        transition: all 0.27s cubic-bezier(0.000, 0.000, 0.580, 1.000);
    }
</style>
<!-- Section -->
<section class="page-section bg-dark light-content" style="overflow: initial;">
    <div class="container relative">

        <div class="row">

            <!-- Content -->
            <div class="col-md-8 offset-lg-1 mb-sm-80 order-first order-md-last">

                <div class="list-group project-list">

                    <c:forEach items="${projectList }" var="item">
                        <a href="projectDetail.do?no=${item.projectNo}" class="list-group-item d-flex justify-content-between align-items-start" aria-current="true">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold">${item.projectName}</div>
                                모집일
                                <fmt:formatDate value="${item.recruitSdt}" type="both" pattern="yyyy-MM-dd"/>
                                ~
                                <fmt:formatDate value="${item.recruitEdt}" type="both" pattern="yyyy-MM-dd"/>
                            </div>
                            <span class="badge me-1 ${item.frontRcnt > 0 ? 'bg-primary' : 'bg-dark'}">프론트엔드 ${item.frontRcnt}</span>
                            <span class="badge me-1 ${item.backRcnt > 0 ? 'bg-primary' : 'bg-dark'}">백엔드 ${item.backRcnt}</span>
                            <span class="badge me-1 ${item.fullRcnt > 0 ? 'bg-primary' : 'bg-dark'}">풀스택 ${item.fullRcnt}</span>
                            <span class="badge me-1 ${item.designRcnt > 0 ? 'bg-primary' : 'bg-dark'}">디자인 ${item.designRcnt}</span>
                            <span class="badge me-1 ${item.plannerRcnt > 0 ? 'bg-primary' : 'bg-dark'}">기획 ${item.plannerRcnt}</span>
                        </a>
                    </c:forEach>

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

                <form class="form" id="searchForm" action="/project/search" style="position: sticky; top: 100px" method="get">

                    <!-- Search Widget -->
                    <div class="widget">
                        <h3 class="widget-title">프로젝트 명</h3>

                        <div class="search-wrap">
                            <button class="search-button animate" type="submit" title="Start Search">
                                <i class="fa fa-search"></i>
                            </button>
                            <input type="text" class="form-control search-field round" name="projectName" placeholder="Search..." value="<c:out value='${search.projectName}'/>">
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
                            checkBox += '<input type="checkbox" class="btn-check" id="btncheck'+index+'" autocomplete="off">';
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
                                <a href="">프론트엔드</a>
                                <a href="">백엔드</a>
                                <a href="">풀스택</a>
                                <a href="">디자이너</a>
                                <a href="">기획자</a>
                            </div>
                        </div>

                    </div>
                    <!-- End Widget -->

                    <!-- 기간 -->
                    <div class="widget">

                        <h3 class="widget-title">프로젝트 기간</h3>

                        <div class="widget-body">
                            <input type="number" name="projectTerm" class="input-lg round form-control bg-dark-input" value="<c:out value='${search.projectTerm}'/>">
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
    var total = ${pageMaker.total}
    var current = ${pageMaker.cri.pageNum}

    window.pagObj = $('#pagination').twbsPagination({
      totalPages: total,
      startPage: current,
      visiblePages: 5, // 최대로 보여줄 페이지
      prev: "<i class='fa fa-chevron-left'></i>", // Previous Button Label
      next: "<i class='fa fa-chevron-right'></i>", // Next Button Label
      first: '«', // First Button Label
      last: '»', // Last Button Label
      onPageClick: function (event, page) { // Page Click event
        console.info("current page : " + page);
      } }).on('page', function (event, page) {
      searchDateList(page);
    });

  function searchDateList(page) {
    var searchForm = $("#searchForm");
    console.log(page);
    searchForm.find("input[name='pageNum']").val(page);
    searchForm.submit();
  }

</script>