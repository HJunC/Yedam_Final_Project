<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>
@import url('https://fonts.googleapis.com/css?family=Varela+Round');
 
body{
  background:@BACKGROUND;
  font-family:"Varela Round",Nunito,Montserrat,sans-serif;
  margin:0;padding:0;
  text-transform:capitalize;

}
 
tr{
	border: 1px;
	line-height: 50px;
}

td{
	width: 250px;

}
	
.button {
background-color: orange;
width: 100px;
height: 40px; 
border: none;
 border-radius: 5px;
 padding: 2px 1px;
 text-align: center;
 text-decoration: none;
 display: inline-block;
 font-size: 20px;
 margin: 10px 1px;
 cursor: pointer;
 float: right; 
}


</style>
</head>
<body>

<section class="page-section bg-dark light-content">
<div align="center" class="container" >
<div class="col-md-7">
<h1 class="hs-line-7 mb-40 mb-xs-20">free.</h1>
<div class="table-responsive">


<a href="write.do" class="button" class="blog-page-title">Write.</a>
</div>
<div class="board_list"> 
		
		            <table >
					 <colgroup>
			                <col style="width:15%"/>
			                <col style="width:30%"/>
			                <col style="width:15%"/>
			                <col style="width:10%"/>
			                <col style="width:15%"/>
			                <col style="width:20%"/>
		            </colgroup>
                      <tr>	
	                    <th scope="col">번호</th>
	                    <th scope="col">제목</th>
	                    <th scope="col">작성자</th>
	                    <th scope="col">조회</th>
	                    <th scope="col">추천</th>
	                    <th scope="col">작성일</th>
	         </tr>
	         
	          <c:forEach items="${boardList}" var="list">
								 
									<tr class="active" onclick="freeSelect(${list.boardNo})">
										<th>${list.boardNo}</th>
										<th>${list.title}</th>
										<th>${list.writer}</th>
										<th>${list.hit}</th>
										<th>${list.recommend}</th>
									 	<th>
										<c:set var="ymd" value="<%=new java.util.Date()%>" /> 
										<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" />
										<!--<fmt:formatDate value="${list.boardDate}" pattern="yyyy-MM-dd"/>-->
										</th>
									</tr>
								    </c:forEach>
					<tbody>
							
			 </table>

				 <br><br><h4 class="blog-page-title"></h4>
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