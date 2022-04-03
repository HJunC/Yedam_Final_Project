<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
   content="Rhythm &mdash; One & Multi Page Creative Template">
<meta name="author" content="https://themeforest.net/user/bestlooker/portfolio">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>write here</title>
</head>
<body>
<section class="page-section bg-dark light-content">
<div align="center">
 <h1 class="blog-page-title">free .</h1>
	
	            <div class="table_list table_list_2 mt10">
	                <table class="table_center th_type">
		                <colgroup>
			                <col style="width:20%">
			                <col style="width:*">
			                <col style="width:9%">
			                <col style="width:12%">
			                <col style="width:11%">
			                <col style="width:11%">
		                </colgroup>
		                
	                <thead>
	                <tr>
	                    <th scope="col">번 호</th>
	                    <th scope="col">제 목</th>
	                    <th scope="col">작 성 자</th>
	                    <th scope="col">조 회</th>
	                    <th scope="col">추 천 수</th>
	                    <th scope="col">등 록 일 </th>
	                </tr>
	                
	
	<c:forEach items="${boardList}" var="list">

									<tr class="active" onclick="freeSelect(${list.boardNo})">
										<th>${list.boardNo}</th>
										<th>${list.hit}</th>
										<th>${list.writer}</th>
										<th>${list.title}</th>
										<th>${list.recommend}</th>
										 <th><fmt:formatDate  pattern="yyyy-MM-dd" value="${list.boardDate}"/></th>
									</tr>
								</c:forEach>
							</thead>
						</table>
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