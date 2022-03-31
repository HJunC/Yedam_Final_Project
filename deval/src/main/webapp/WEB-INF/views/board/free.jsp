<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<body>
   <section class="page-section bg-dark light-content"
      data-background="images/full-width-images/section-bg-19.jpg" id="home">
      <div class="container relative pt-80">
               <div class="wow fadeInUpShort" data-wow-delay=".1s">
                  <h1 class="hs-line-7 mb-40 mb-xs-20">Free ~ </h1>


						<!-- Content Column -->
					 <table class="table table-striped">
                     <tr class="active">
			<th>No .</th>
									<th>H I T</th>
									<th>I D</th>
									<th>T I T L E</th>
									<th>R EC O M M E N D</th>
									<th>D A T E</th>
								</tr>
					 

						<c:forEach items="${boardList}" var="list">
						
								<tr class="active" onclick="freeSelect(${list.boardNo})" >
									<th>${list.boardNo}</th>
									<th>${list.hit}</th>
									<th>${list.writer}</th>
									<th>${list.title}</th>
									<th>${list.recommend}</th>
									<th>${list.boardDate}</th>
								</tr>
						</c:forEach>
 
	   </table>
    </div>
                        <div class="row mb-100 mb-md100">
                           <a href="write.do"
                              class="btn btn-mod btn-w btn-medium btn-round">Write.</a>
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
<form action="boardSelect.do" method="post" id="boardSS">

<input type="hidden" name="boardNo" id="boardSe" />

</form>
<script>


function freeSelect(e){
boardSS.boardSe.value= e;
boardSS.submit();   
   
}

</script>

</body>
</html>