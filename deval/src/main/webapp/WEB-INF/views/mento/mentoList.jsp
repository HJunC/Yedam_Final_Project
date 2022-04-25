<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토리스트 페이지</title>
</head>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources"/>
<c:set var="upload" value="/upload"/>
<body>
 <main id="main">    
            
                <!-- Home Section -->
                <section class="small-section bg-dark-alfa-50 bg-scroll light-content" id="home">
                    <div class="container relative pt-70">
                    
                        <div class="row">
                            
                            <div class="col-md-8">
                                <div class="wow fadeInUpShort" data-wow-delay=".1s" style="width: 954px;">
                                    <h1 class="hs-line-7 mb-20 mb-xs-10">실력있는 멘토들을 소개합니다</h1>
                                </div>
                                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
                                        특정레벨이상의 멘토들을 선정했습니다
                                    </p>
                                </div>
                            </div>
                            
                        </div>
                    
                    </div>
                </section>
                <!-- End Home Section -->
                <div style="width: 843px;height: 457px;margin: 0 auto;">
                	<img alt="mentoImage" src="${resources}/images/mento/mento1.png" style="width: 100%;height: 100%;object-fit: cover;border-radius:210px;">
                </div>
                
                <!-- Section -->
                <section class="page-section bg-dark light-content">
                    <div class="container relative">
                        
                        <!-- Shop options -->
                        <div class="clearfix mb-40">
                            <c:if test="${not empty mento}">
                            <div class="float-sm-start mt-10 mb-sm-20">
								<p><strong>${mento[0].lang }</strong>언어의 멘토들은 현재 <strong>${pageMaker.total}</strong>명입니다</p>
							</div>
                            </c:if>
                        </div>
                        <div>
                        	<c:if test="${exp >= 1000 }">
                        		<input type="button" value="버튼">
                        	</c:if>
                        </div>
                        <!-- End Shop options -->
                        
                        
                        <!-- 멘토리스트 출력부분 -->
                        <div class="row">
                    		<c:forEach var="mento" items="${mento }">
                            <!-- Shop Item -->
                            <div class="col-sm-6 col-md-3 mb-60 mb-xs-40">
                                <div class="post-prev-img" style="border-radius: 70%;" >
                                	<div class="sdsdssdsds">
	                                    <!-- 사진출력 -->
	                                    <c:if test="${not empty mento.photo }">
	                                    	<img src="/upload/${mento.photo}" style="height: 400px; width: 296px; object-fit: cover;" alt=".."/>
	                                    </c:if>
	                                    <c:if test="${empty mento.photo }">
	                                    	<img src="${resources}/images/mento/prev.bmp" style="height: 400px; width: 296px; object-fit: cover;" alt=".."/>
	                                    </c:if>
                                	</div>                                
                                </div>
                                
                                <div class="post-prev-title align-center">
                                	<!-- 멘토 이름이 들어가는 곳 -->
                                   <p> <Strong>${mento.mentoId }</Strong>(${mento.history})</p>
                                </div>
								<c:if test="${empty mento.info }">
									<div class="post-prev-text align-center">
										<strong>안녕하세요.</strong>
									</div>
								</c:if>
								<c:if test="${!empty mento.info}">
                                <div class="post-prev-text align-center">
                                    <strong>${mento.info }</strong>
                                </div>
								</c:if>
                                <div class="post-prev-more align-center">
                                    <button type="button" class="btn btn-mod btn-w btn-round" onclick="selectMento('${mento.mentoId}')"><i class="fa fa-search"></i> 멘토상세보기</button>
                                </div>
                                </div>
                               </c:forEach>
                            </div>
                        <div>
                        	<!-- mentoSelect 처리부분 -->
                        	<form id="frm2" action="mentoSelect.do" method="get">
                        		<input type="hidden" id="mentoId" name="mentoId">
                        		<input type="hidden" id="lang" name="lang">
                        	</form>
                        </div>
						<!-- Pagination -->
						<form method="get" id="searchForm">
							<div class="pagination mt-30 mt-xs-10">
								<ul class="pagination" id="pagination"></ul>
							</div>
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	                    	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	                    	<input type="hidden" name="lang" value="${mento[0].lang}">
						</form>
						<!-- End Pagination -->

			</div>
                </section>
                <!-- End Section -->                
            </main>
            <script src="${resources}/js/common/jQueryPage.js"></script>
            <script type="text/javascript">
            	function selectMento(id) {
            		frm2.mentoId.value = id;
            		frm2.lang.value = '${mento[0].lang}'
            		frm2.submit();
            	}
            	
            	<!-- paging -->
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
</body>
</html>