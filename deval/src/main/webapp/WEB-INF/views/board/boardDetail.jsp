<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
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
table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.type09 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.type09 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</
head
>
</style>
<body>


	<div align="center">
		<section class="page-section bg-dark light-content" id="home">
			<div class="container relative text-center">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">detail</h2>
					</div>
					<div class="table-responsive">
						<c:set var="upload" value="/upload" />
						<form action="boardUpdateForm.do" method="post">
							<div align="right">
								<button type="submit"
									class="btn btn-mod btn-round btn-border-w btn-small">수정</button>
								<a href='boardDelete.do?boardNo=${board.boardNo}'
									class="btn btn-mod btn-round btn-border-w btn-small">삭제</a>
							</div>
							<c:set var="ymd" value="<%=new java.util.Date()%>" />
							<h4 class="blog-page-title"></h4>

							<table class="type09">
								<tbody>
								<thead>
									<tr>
										<td scope="cols">등록날짜 <fmt:formatDate value="${ymd}"
												pattern="yyyy-MM-dd" /></td>
									</tr>
									<tr>
										<td scope="cols">글번호 <input type="hidden"
											value="${board.boardNo}" name="boardNo" id="boardNo">${board.boardNo}</td>
									</tr>
									<tr>
										<td>조회수 <input type="hidden" value="${board.hit}"
											name="hit" id="hit">${board.hit}</td>

										<td>추천수 <input type="hidden" value="${board.recommend}"
											name="recommend" id="recommend">${board.recommend}</td>
									</tr>
									<%-- 	<tr>
										<td>file</td>
										<td class="post-prev-img" style="border-radius: 70%;"><a
											href="#" img src="images/${board.photo}" id="photo"
											alt="이미지 미리보기" width="100" height="200"></a></td>
									</tr> --%>
									<tr>
										<td scope="cols">Title <input type="hidden"
											value="${board.title}" name="title" id="title">${board.title}</td>
									</tr>

									<tr>
										<td scope="cols">Subject <input type="hidden"
											value="${board.subject}" name="subject" id="subject">${board.subject}</td>
									</tr>
									<%-- <tr>
										<td>유형</td>
										<td><input type="hidden" value="${board.boardTypeNo}"
											name="boardTypeNo" id="boardTypeNo">${board.boardTypeNo}</td>
									</tr>
									<tr>
										<td>카테고리</td>
										<td><input type="hidden" value="${board.category}"
											name="category" id="category">${board.category}</td>
									</tr> --%>

								</thead>
								</tbody>
							</table>
							<!-- 	<div class="container relative">
						<div class="mb-80 mb-xs-40"> -->
						</form>


						<h4 class="blog-page-title"></h4>
						<br>


						<p class="btn btn-success" id="recommenBtn">게시글추천</p>
						<div class="mb-60 mb-md-30"></div>
						<div align="center">

							<form action="commentPost.do" method="post">
								<textarea style="width: 50%" rows="2" cols="400" id="commentSub"
									name="commentSub" required="required"
									class="input-md square form-control"
									placeholder="Enter Comment... " maxlength="400"></textarea>
								<br>
								<button type="button"
									class="btn btn-mod btn-round btn-border-w btn-small"
									id="addComment">submit</button>

							</form>
						</div>
						<table id="tbl">
							<c:forEach items="${comments}" var="comment">
								<tr>
									<td>나도 한마디(id)</td>
									<td>${comment.commentDate}</td>
									<td>${comment.commentSub}</td>
								</tr>
							</c:forEach>
						</table>

						<!-- <button class="btn btn-secondary"
					onclick="location.href='boardDetail.do'">목록으로</button> -->


						<div align="right">
							<c:if test="${board.boardTypeNo == 1}">
								<a href="free.do"
									class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
							</c:if>

							<c:if test="${board.boardTypeNo == 2}">
								<a href="notice.do"
									class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
							</c:if>

							<c:if test="${board.boardTypeNo == 3}">
								<a href="technical.do"
									class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
							</c:if>

						</div>


					</div>
				</div>
			</div>
		</section>
	</div>



	<script type="text/javascript">
		$("#addComment").on("click", function() {
			$.ajax({
				url : "/deval/comment/commentPost.do",
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
					alert("다시");
				}

			})
		});

		$("#recommenBtn").on("click", function() {
			$.ajax({
				url : "recommend.do",
				type : "POST",
				data : {
					"boardNo" : $("#boardNo").val()
				},
				dataType : "json",
				success : function(data) {
					document.getElementById('recommend').text = data;
				}
			})
		});

		function makeTr(data) {
			$("#tbl").empty();
			$.each(data, function(idx, item) {
				let tr = $("<tr>");
				tr.append($("<th>").text("나도 한마디"), $("<td>").text(
					     item.commentDate), $("<td>").text(
		                           item.commentSub));
				$("#tbl").append(tr);
			});
		}
	</script>

	<script src="http://madalla.kr/js/jquery-1.8.3.min.js"></script>
	
	<script type="text/javascript">
		$(function() {
			$("#file").on('change', function() {
				readURL(this);
			});
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#photo').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>





</body>
</html>
