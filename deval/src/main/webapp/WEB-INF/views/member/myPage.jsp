<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-03-25
  Time: 오후 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<<<<<< HEAD
마이페이지
=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>

<!-- Home Section -->
<section class="small-section bg-dark-alfa-50 bg-scroll light-content" data-background="images/full-width-images/section-bg-19.jpg" id="home">
    <div class="container relative pt-70">
    
        <div class="row">
            
            <div class="col-md-8">
                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                    <h1 class="hs-line-7 mb-20 mb-xs-10">Blog</h1>
                </div>
                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
                        We share our best ideas in our blog
                    </p>
                </div>
            </div>
            
            <div class="col-md-4 mt-30 wow fadeInUpShort" data-wow-delay=".1s">
                <div class="mod-breadcrumbs text-end">
                    <a href="#">Home</a>&nbsp;<span class="mod-breadcrumbs-slash">•</span>&nbsp;<a href="#">Blog</a>&nbsp;<span class="mod-breadcrumbs-slash">•</span>&nbsp;<span>Classic</span>
                </div>                                
            </div>
            
        </div>
    
    </div>
</section>
<!-- End Home Section -->


<!-- Section -->
<section class="page-section">
    <div class="container relative">
        
        <div class="row">
            
            <!-- Content -->
            <div class="col-md-8 offset-lg-1 mb-sm-80 order-first order-md-last">
                
               <!-- Pagination -->
                <div class="pagination">
                    <a href=""><i class="fa fa-chevron-left"></i></a>
                    <a href="" class="active">1</a>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a class="no-active">...</a>
                    <a href="">9</a>
                    <a href=""><i class="fa fa-chevron-right"></i></a>
                </div>
                <!-- End Pagination -->
                
            </div>
            <!-- End Content -->
            
            <!-- Sidebar -->
            <div class="col-md-4 col-lg-3 mt-10">
                
                <!-- Search Widget -->
                <div class="widget">
                    <form class="form">
                        <div class="search-wrap">
                            <button class="search-button animate" type="submit" title="Start Search">
                                <i class="fa fa-search"></i>
                            </button>
                            <input type="text" class="form-control search-field round" placeholder="Search...">
                        </div>
                    </form>
                </div>
                <!-- End Search Widget -->
                
                <!-- Widget -->
                <div class="widget">
                    
                    <h3 class="widget-title">Categories</h3>
                    
                    <div class="widget-body">
                        <ul class="clearlist widget-menu">
                            <li>
                                <a href="#" title="">Branding</a>
                                <small>
                                    - 7
                                </small>
                            </li>
                            <li>
                                <a href="#" title="">Design</a>
                                <small>
                                    - 15
                                </small>
                            </li>
                            <li>
                                <a href="#" title="">Development</a>
                                <small>
                                    - 3
                                </small>
                            </li>
                            <li>
                                <a href="#" title="">Photography</a>
                                <small>
                                    - 5
                                </small>
                            </li>
                            <li>
                                <a href="#" title="">Other</a>
                                <small>
                                    - 1
                                </small>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <!-- End Widget -->
                
                <!-- Widget -->
                <div class="widget">
                    
                    <h3 class="widget-title">Tags</h3>
                    
                    <div class="widget-body">
                        <div class="tags">
                            <a href="">Design</a>
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
                
                <!-- Widget -->
                <div class="widget">
                    
                    <h3 class="widget-title">Latest posts</h3>
                    
                    <div class="widget-body">
                        <ul class="clearlist widget-posts">
                            <li class="clearfix">
                                <a href=""><img src="${resources}/images/blog/previews/post-prev-1.jpg" alt="" width="100" class="widget-posts-img" /></a>
                                <div class="widget-posts-descr">
                                    <a href="#" title="">Minimalistic Design Forever</a>
                                    Posted by John Doe 7 March 
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href=""><img src="${resources}/images/blog/previews/post-prev-2.jpg" alt="" width="100" class="widget-posts-img" /></a>
                                <div class="widget-posts-descr">
                                    <a href="#" title="">Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit</a>
                                    Posted by John Doe 7 March
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href=""><img src="${resources}/images/blog/previews/post-prev-3.jpg" alt="" width="100" class="widget-posts-img" /></a>
                                <div class="widget-posts-descr">
                                    <a href="#" title="">New Web Design Trends in 2021 Year</a>
                                    Posted by John Doe 7 March
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href=""><img src="${resources}/images/blog/previews/post-prev-4.jpg" alt="" width="100" class="widget-posts-img" /></a>
                                <div class="widget-posts-descr">
                                    <a href="#" title="">Hipster’s Style in Web Design and Logo</a>
                                    Posted by John Doe 7 March
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href=""><img src="${resources}/images/blog/previews/post-prev-5.jpg" alt="" width="100" class="widget-posts-img" /></a>
                                <div class="widget-posts-descr">
                                    <a href="#" title="">Duis Tristique Condimentum Nulla Bibendum Consectetu</a>
                                    Posted by John Doe 7 March
                                </div>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <!-- End Widget -->
                
                <!-- Widget -->
                <div class="widget">
                    
                    <h3 class="widget-title">Comments</h3>
                    
                    <div class="widget-body">
                        <ul class="clearlist widget-comments">
                            <li>
                                John Doe on <a href="#" title="">Lorem ipsum dolor sit amet</a>
                            </li>
                            <li>
                                Emma Johnson on <a href="#" title="">Suspendisse accumsan interdum tellus</a>
                            </li>
                            <li>
                                John Doe on <a href="#" title="">Praesent ultricies ut ipsum</a>
                            </li>
                            <li>
                                Mark Deen on <a href="#" title="">Vivamus malesuada vel nulla vulputate</a>
                            </li>
                            <li>
                                Sam Brin on <a href="#" title="">Aenean auctor egestas auctor</a>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <!-- End Widget -->
                
                <!-- Widget -->
                <div class="widget">
                    
                    <h3 class="widget-title">Text widget</h3>
                    
                    <div class="widget-body">
                        <div class="widget-text clearfix">
                            
                            <img src="${resources}/images/blog/previews/post-prev-6.jpg" alt="" width="100" class="left img-left">
                            
                            Consectetur adipiscing elit. Quisque magna ante eleifend eleifend. 
                            Purus ut dignissim consectetur, nulla erat ultrices purus, ut consequat sem elit non sem.
                            Quisque magna ante eleifend eleifend. 
                        
                        </div>
                    </div>
                    
                </div>                            
                <!-- End Widget -->
                
                <!-- Widget -->
                <div class="widget">
                    
                    <h3 class="widget-title">Archive</h3>
                    
                    <div class="widget-body">
                        <ul class="clearlist widget-menu">
                            <li>
                                <a href="#" title="">February 2021</a>
                            </li>
                            <li>
                                <a href="#" title="">January 2021</a>
                            </li>
                            <li>
                                <a href="#" title="">December 2020</a>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <!-- End Widget -->
                
            </div>
            <!-- End Sidebar -->
        
        </div>
        
    </div>
</section>
<!-- End Section -->                
>>>>>>> 6266cd4 (feat:jdbc log처리)
