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
<meta name="author"
	content="https://themeforest.net/user/bestlooker/portfolio">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>write here</title>

<style>
@import url('https://fonts.googleapis.com/css?family=Varela+Round');

body {
	background: @BACKGROUND;
	font-family: "Varela Round", Nunito, Montserrat, sans-serif;
	margin: 0;
	padding: 0;
	text-transform: capitalize;
}

tr {
	border: 1px;
	line-height: 50px;
}

td {
	width: 250px;
}

.button {
	background-color: orange;
	width: 100px;
	height: 30px;
	border: none;
	border-radius: 2px;
	padding: 2px 1px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 10px 1px;
	cursor: pointer;
	float: center;
}
</style>
</head>

<body>

	<section class="page-section bg-dark light-content">
		<div align="center" class="container">
			<div class="col-md-6 mb-md-20">
				<h1 class="blog-page-title">detail .</h1>
				<form action="boardUpdateForm.do" method="post">
					<c:set var="ymd" value="<%=new java.util.Date()%>" />
					<table>
						<tbody>
							<tr>
								<td>등록날짜</td>
								<td><fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" /></td>
							</tr>

							<tr>
								<td>글번호</td>
								<td><input type="hidden" value="${board.boardNo}"
									name="boardNo" id="boardNo">${board.boardNo}</td>
							</tr>


							<tr>
								<td>Title</td>
								<td><input type="hidden" value="${board.title}"
									name="title" id="title">${board.title}</td>
							</tr>

							<tr>
								<td>Subject</td>
								<td><input type="hidden" value="${board.subject}"
									name="subject" id="subject">${board.subject}</td>
							</tr>

							<tr>
								<td>유형</td>
								<td><input type="hidden" value="${board.boardTypeNo}"
									name="boardTypeNo" id="boardTypeNo">${board.boardTypeNo}</td>
							</tr>


							<tr>
								<td>카테고리</td>
								<td><input type="hidden" value="${board.category}"
									name="category" id="category">${board.category}</td>
							</tr>


							<tr>
								<td>조회수</td>
								<td><input type="hidden" value="${board.hit}" name="hit"
									id="hit">${board.hit}</td>
							</tr>

							<tr>
								<td>추천수</td>
								<td><input type="hidden" value="${board.recommend}"
									name="recommend" id="recommend">${board.recommend}</td>
							</tr>

						</tbody>
					</table>

					<!-- 	<div class="container relative">
						<div class="mb-80 mb-xs-40"> -->
					<button type="submit" class="button">게시글 수정</button>

				</form>


				<button class="button"
					onclick="location.href='boardDelete.do?boardNo=${board.boardNo}'">게시글
					삭제</button>
				<br>
				<button type="submit" class="btn btn-success"
					value="${board.recommend}" name="recommend" id="recommend">게시글
					추천</button>

				<h4 class="blog-page-title"></h4>

				<div class="mb-60 mb-md-30"></div>

				<table id="tbl">
					
					<c:forEach items="${comments}" var="comment">
						<tr>
						<td>나도 한마디(id)</td>						
						<td>${comment.commentDate}</td>
						<td>${comment.commentSub}</td>
						</tr>
					</c:forEach>
					
				</table>
				
				<form action="commentPost.do" method="post">
					<table>
						<tr>
						 
							<td>Subject</td>
							<td><textarea rows="4" cols="500" id="commentSub"
									name="commentSub" required="required"
									class="input-mx square form-control"
									placeholder="Enter subject" maxlength="400"></textarea></td>
						</tr>
					</table>
		  <hr>
		  <button type="button" class="btn btn-warning" id="addComment">submit</button>
				</form>
				
<!-- <button class="btn btn-secondary"
					onclick="location.href='boardDetail.do'">목록으로</button> -->



				<script type="text/javascript">
 					$("#addComment").on("click", function() {
						$.ajax({
							url : "commentPost.do",
							data : {
								"commentSub" : $("#commentSub").val(),
								"boardNo" : $("#boardNo").val()
							},
							type : "POST",
							dataType : "json",
							success : function(data) {
								console.log(data);
								makeTr(data);
							},
							error : function() {
								alert("다시 작성하세요.");
							}

						})
 					});
					
					function makeTr(data){
						$("#tbl").empty();
// 						<tr>
	// 						
	// 						<td></td>
	// 						<td>안녕하세요</td>
// 						</tr>
						
						$.each(data, function(idx, item){
// 							console.log(item);
							let tr = $("<tr>");
							tr.append(
								$("<th>").text("나도 한마디"),
								$("<td>").text(item.commentDate),
								$("<td>").text(item.commentSub)
							);
						$("#tbl").append(tr);
						});
					}
					
				</script>



				<h4 class="blog-page-title"></h4>
				<br>
				<div class="container relative">
					<c:if test="${board.boardTypeNo == 1}">
						<a href="free.do" class="btn btn-mod btn-q btn-medium btn-round">목록으로</a>
					</c:if>

					<c:if test="${board.boardTypeNo == 2}">
						<a href="notice.do" class="btn btn-mod btn-q btn-medium btn-round">목록으로</a>
					</c:if>

					<c:if test="${board.boardTypeNo == 3}">
						<a href="technical.do"
							class="btn btn-mod btn-q btn-medium btn-round">목록으로</a>
					</c:if>

				</div>
			</div>
		</div>
	</section>


</body>
</html>