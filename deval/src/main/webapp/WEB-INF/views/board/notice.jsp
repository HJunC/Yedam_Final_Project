<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rhythm</title>
<meta name="description"
	content="Rhythm &mdash; One & Multi Page Creative Template">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<meta name="author"
	content="https://themeforest.net/user/bestlooker/portfolio">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="shortcut icon" href="images/favicon.png">

<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.rtl.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style-responsive.css">
<link rel="stylesheet" href="css/vertical-rhythm.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/splitting.css">
</head>

<body>

	<section class="small-section bg-dark-alfa-50 bg-scroll light-content"
		data-background="images/full-width-images/section-bg-19.jpg" id="home">
		<div class="container relative pt-80">
			<div class="row">

				<div class="wow fadeInUpShort" data-wow-delay=".1s">
					<h1 class="hs-line-7 mb-40 mb-xs-20">Notice.</h1>
				</div>

<div class="container">
				<!-- Content Column -->
				<div class="table-responsive">
					<form role="form">
						<table class="table table-striped">
							<thead>
								<tr class="active">
									<th>No .</th>
									<th>H I T</th>
									<th>I D</th>
									<th>T I T L E</th>
									<th>R EC O M M E N D</th>
									<th>D A T E</th>
								</tr>
 			<c:forEach items="${noticeList}" var="list2">
									<tr class="active" onclick="noticeSelect(${list2.boardNo})">
									<th>${list2.boardNo}</th>
									<th>${list2.hit}</th>
									<th>${list2.writer}</th>
									<th>${list2.title}</th>
									<th>${list2.recommend}</th>
									<th><fmt:formatDate  pattern="yyyy-MM-dd" value="${list2.boardDate}"/></th>
								</tr>
								</c:forEach>
							</thead>
						</table>
					</form>
				</div>
			</div>

 	<div class="row mb-100 mb-md100">
				<a href="write.do" class="btn btn-mod btn-w btn-medium btn-round">Write.</a>
				<div class="mb-30 mb-md-20">


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

	<form action="noticeSelect.do" method="post" id="boardSS2">

		<input type="hidden" name="boardNo" id="boardSe2" />

	</form>
	<script>


function noticeSelect(n){
boardSS2.boardSe2.value= n;
boardSS2.submit();   
}

</script>

</body>
</html>