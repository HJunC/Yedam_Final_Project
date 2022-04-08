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
	width: 80px;
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
				<h1 class="blog-page-title">write .</h1>
				<form action="writePost.do" enctype="multipart/form-data" method="post">
					<!-- <input type="number" name="boardTypeNo" value="1">	  -->
					<c:set var="ymd" value="<%=new java.util.Date()%>" />

					<table>
						<tr>
							<td>type_no.</td>
							<td><input type="number" name="boardTypeNo"
								class="input-md square form-control" value="1" />
							<td>
						</tr>
						<tr>
							<td>등록날짜</td>
							<td><fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" />
							<td>
						</tr>

						<tr>
							<td>Title</td>
							<td><input type="text" id="title" name="title"
								required="required" class="input-md square form-control"
								placeholder="Enter title" maxlength="100">
						</tr>

						<tr>
							<td>Subject</td>
							<td><textarea rows="4" cols="200" id="subject"
									name="subject" required="required"
									class="input-mx square form-control"
									placeholder="Enter subject" maxlength="400"> </textarea></td>
						<tr>
						 
						  <td>파일선택</td>
		      <td><input type="file" name="uploadFile" class="btn btn-warning"/></td>
		   
		   </tr>


					</table>

					<h1 class="blog-page-title"></h1>
					<button type="submit" class="btn btn-warning">submit</button>
					<button class="btn btn-secondary" onclick="location.href='free.do'">목록으로</button>

				</form>


				<!-- Send Button -->
				<div class="container relative">


					<c:if test="${board.boardTypeNo == 1}">
						<a href="free.do" class="btn btn-mod btn-g btn-small btn-round">목록으로</a>
					</c:if>
					<br>


					<c:if test="${board.boardTypeNo == 2}">
						<a href="notice.do" class="btn btn-mod btn-g btn-small btn-round">목록으로</a>
					</c:if>


					<c:if test="${board.boardTypeNo == 3}">
						<a href="technical.do"
							class="btn btn-mod btn-g btn-small btn-round">목록으로</a>
					</c:if>

				</div>


			</div>
		</div>
	</section>

</body>

</html>