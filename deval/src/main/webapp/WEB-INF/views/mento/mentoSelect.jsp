<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="upload" value="/upload"/>
<c:set var="resources" value="${pageContext.request.contextPath }/resources"/>
<link rel="stylesheet" href="${resources}/css/custom/team-project-style.css">
<body>
 <section class="page-section bg-dark light-content">
                    <div class="container relative">
                    <c:if test="${!empty mento }">
                        <!-- Product Content -->
                        <div class="row mb-60 mb-xs-30">
                            
                            <!-- Product Images -->
                            <div class="col-md-4 mb-md-30">
                                
                                <div id="select-img">
                                    <img src="${upload}/${mento.photo}" alt="" style="border-radius: 70%;object-fit : cover;"/>
                                </div>
                                
                            </div>
                            <!-- End Product Images -->
                            
                            <!-- Product Description -->
                            <div class="col-sm-8 col-md-5 mb-xs-40">
                                
                                <h1 class="h3 mt-0">${mento.mentoId }</h1>
                                
                                <hr class="mt-0 mb-30 white" />
                                
                                <div class="row">
                                    <div class="col-6 lead mt-0 mb-20">
                                        <strong><i class="fa fa-won-sign"></i>${mento.price }</strong>
                                    </div>
                                    <div class="col-6 align-right gray">
                                        <i class="fa fa-hands-helping"></i>
                                        &nbsp;(${mento.people } menti)
                                    </div>
                                </div>
                                
                                <hr class="mt-0 mb-30 white" /> 
                                
                                <div class="gray mb-30">
                                    ${mento.info }
                                </div>
                                
                                <hr class="mt-0 mb-30 white" /> 
                                
                                <div class="mb-30">
                                    <form method="post" action="#" class="form">
                                        <input type="number" class="input-lg round" min="1" max="100" value="1" />
                                        <a href="#" class="btn btn-mod btn-w btn-large btn-round">서비스신청</a> 
                                    </form>
                                </div>
                                
                                <hr class="mt-0 mb-30" /> 
                                
                                <div class="gray small">
                                    <div>SKU: 2134</div>
                                    <div>Category: <a href=""> Polo shirts</a></div>
                                    <div>Tags: <a href="">polo shirt</a>, <a href="">men</a></div>
                                </div>
                                
                            </div>
                            <!-- End Product Description -->
                            
                            <!-- Features -->
                            <div class="col-sm-4 col-md-3 mb-xs-40">
                                
                                <!-- Features Item -->
                                <div class="alt-service-wrap">
                                    <div class="alt-service-item">
                                        <div class="alt-service-icon">
                                            <i class="far fa-paper-plane"></i>
                                        </div>
                                        <h3 class="alt-services-title">Free Shipping</h3>
                                        <div class="gray">Vivamus neque orci, ultricies blandit ultricies vel, semper.</div>
                                    </div>
                                </div>
                                <!-- End Features Item -->
                                
                                <!-- Features Item -->
                                <div class="alt-service-wrap">
                                    <div class="alt-service-item">
                                        <div class="alt-service-icon">
                                            <i class="far fa-clock"></i>
                                        </div>
                                        <h3 class="alt-services-title">14 days moneyback</h3>
                                        <div class="gray">Vivamus neque orci, ultricies blandit ultricies vel, semper.</div>
                                    </div>
                                </div>
                                <!-- End Features Item -->
                                
                                <!-- Features Item -->
                                <div class="alt-service-wrap">
                                    <div class="alt-service-item">
                                        <div class="alt-service-icon">
                                            <i class="fa fa-gift"></i>
                                        </div>
                                        <h3 class="alt-services-title">100% Original</h3>
                                        <div class="gray">Vivamus neque orci, ultricies blandit ultricies vel, semper.</div>
                                    </div>
                                </div>
                                <!-- End Features Item -->
                                    
                                    
                                
                            </div>
                            <!-- End Features -->
                            
                        </div>
                        <!-- End Product Content -->
                        
                        
                   
                		</c:if>
                    </div>
                </section>

</body>
</html>