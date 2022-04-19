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
                <section class="small-section bg-dark-alfa-50 bg-scroll light-content" data-background="images/full-width-images/section-bg-19.jpg" id="home">
                    <div class="container relative pt-70">
                    
                        <div class="row">
                            
                            <div class="col-md-8">
                                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                                    <h1 class="hs-line-7 mb-20 mb-xs-10">실력있는 멘토들을 소개합니다</h1>
                                </div>
                                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
                                        특정레벨이상의 멘토들을 선정했습니다 골라주세요
                                    </p>
                                </div>
                            </div>
                            
                        </div>
                    
                    </div>
                </section>
                <!-- End Home Section -->
                
                
                <!-- Section -->
                <section class="page-section bg-dark light-content">
                    <div class="container relative">
                        
                        <!-- Shop options -->
                        <div class="clearfix mb-40">
                            <c:if test="${not empty mento}">
                            <div class="float-sm-start mt-10 mb-sm-20">
								${mento[0].lang }언어의 멘토들은 현재 ${fn:length(mento)}명입니다
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
                                <div class="post-prev-img" style="border-radius: 70%;">
                                    <!-- 사진출력 -->
                                    <a href="#"><img src="${upload}/${mento.photo}" alt=".." /></a>
                                </div>
                                
                                <div class="post-prev-title align-center">
                                	<!-- 멘토 이름이 들어가는 곳 -->
                                   <p> <Strong>${mento.mentoId }</Strong>(${mento.history})</p>
                                </div>

                                <div class="post-prev-text align-center">
                                    <strong>${mento.info }</strong>
                                </div>
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
                        	</form>
                        </div>
                                
                    </div>
                </section>
                <!-- End Section -->                
            </main>
            <script type="text/javascript">
            	function selectMento(id) {
            		frm2.mentoId.value = id;
            		frm2.submit();
            	}
            </script>
</body>
</html>