<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FREE</title>
<meta name="description"
	content="Rhythm &mdash; One & Multi Page Creative Template">
<meta name="author"
	content="https://themeforest.net/user/bestlooker/portfolio">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body>

	<!-- Home Section -->
	<section class="small-section bg-dark-alfa-50 bg-scroll light-content"
		data-background="images/full-width-images/section-bg-19.jpg" id="home">
		<div class="container relative pt-10">
			<div class="row mb-5 mb-md-1">
				<div class="row">
					<div class="col-md-3">
						<div class="wow fadeInUpShort" data-wow-delay=".1s">
							<h1 class="hs-line-7 mb-40 mb-xs-20">manager notice </h1>
						</div>
					</div>
	</div>


					<section class="blog-page-title">

						<!-- Content Column -->
						<form id="frm" action="notice.do" method="post">
							<table class="col-lg-8 offset-lg-2 mb-sm-130">
									<tr class="active">
									<th>No .</th>
									<th>H I T</th>
									<th>I D</th>
									<th>T I T L E</th>
									<th>R E C O M M E N D</th>
									<th>D A T E</th>
								</tr>
					 
				<c:forEach items="${noticeList}" var="list2">
							
					<tr class="active" onclick="noticeSelect(${list2.boardNo})" >
									<th>${list2.boardNo}</th>
									<th>${list2.hit}</th>
									<th>${list2.writer}</th>
									<th>${list2.title}</th>
									<th>${list2.recommend}</th>
									<th>${list2.boardDate}</th>
								</tr>
	
						</c:forEach>
							</table>
						</form>
					</section>
							<div align=center>
								<div class="row mb-100 mb-md100">

									<a href="noticeWriter.do"
										class="btn btn-mod btn-w btn-medium btn-round">Write.</a>

									<div class="mb-30 mb-md-20"></div>
								<!-- Prev/Next Post -->
								</div>
								<div class="clearfix mt-40">
									<a href="#" class="blog-item-more left"> <i
										class="fa fa-chevron-left"></i>Prev
									</a> <a href="#" class="blog-item-more right"> <i
										class="fa fa-chevron-right"></i>Next
									</a>

									<ul class="pagination">
										<li><a href="../gnu4_tips?&amp;page=1">1</a></li>
										<li><a href="../gnu4_tips?&amp;page=2">2</a></li>
										<li><a href="../gnu4_tips?&amp;page=3">3</a></li>
										<li><a href="../gnu4_tips?&amp;page=4">4</a></li>
										<li><a href="../gnu4_tips?&amp;page=5">5</a></li>
										<li><a href="../gnu4_tips?&amp;page=6">6</a></li>
										<li><a href="../gnu4_tips?&amp;page=7">7</a></li>
										<li><a href="../gnu4_tips?&amp;page=8">8</a></li>
										<li><a href="../gnu4_tips?&amp;page=9">9</a></li>
										<li><a href="../gnu4_tips?&amp;page=10">10</a></li>
									</ul>
							</div>
							</div>
							</div>
							</div>
					</section>
 
 

</body>

</html>
