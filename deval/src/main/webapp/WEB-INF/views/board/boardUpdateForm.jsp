<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<div align="center" class="container">
<div class="col-md-6 mb-md-20">
 <h1 class="blog-page-title">detail .</h1>		
 <form action="boardUpdate.do" method="post">
<table>
			 <tr>
				<td>글번호</td>
				<td><input type="hidden" value="${board.boardNo}" name="boardNo" id="boardNo" readonly>${board.boardNo}</td>
			
			 </tr>
				<tr>
				<td>Title</td>
				<td><input type="text" value="${board.title}" name="title" id="title"></td>
			 </tr>
				 <tr>
				<td>Subject</td>
				<td><textarea rows="5" cols="30" name="subject" id="subject">${board.subject}</textarea>
				 </tr>
				 
				  <tr>
				<td>유형</td>
				<td><input type="hidden" value="${board.boardTypeNo}" name="boardTypeNo" id="boardTypeNo">${board.boardTypeNo}</td>
				 </tr>
				 
				 <tr>
				<td>카테고리</td>
				<td><input type="hidden" value="${board.category}" name="category" id="category">${board.category}</td>
				 </tr>
				
				 <tr>
				<td>조회수</td>
				<td><input type="hidden" value="${board.hit}" name="hit" id="hit">${board.hit}</td>
                 </tr>
   </table>
   
   <button type="submit" class="btn btn-mod btn-g btn-small btn-square">수정</button>
  		
</form>
 
			<!-- Send Button --> 
 <div class="container relative">
	

<c:if test = "${board.boardTypeNo == 1}" > 
 <a href="free.do" class="btn btn-mod btn-g btn-small btn-square">목록으로</a></c:if>
 	<br>
  		 

<c:if test = "${board.boardTypeNo == 2}" > 
 <a href="notice.do" class="btn btn-mod btn-g btn-small btn-square">목록으로</a></c:if>
 	

<c:if test = "${board.boardTypeNo == 3}" > 
 <a href="technical.do" class="btn btn-mod btn-g btn-small btn-square">목록으로</a></c:if>
 	
</div>


 </div>
 </div>
 </section>
</body>
</html>