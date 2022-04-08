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
 width: 80px;
 height: 35px;
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
 <form action="boardUpdate.do" method="post">
        <c:set var="ymd" value="<%=new java.util.Date()%>" /> 
           
<table>
		  <tr>
			<td>수정날짜</td>
				<td><fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" /><td>
			 </tr>
			 <tr>
				<td>글번호</td>
				<td><input type="hidden" value="${board.boardNo}" name="boardNo" id="boardNo" readonly>${board.boardNo}</td>
			
			 </tr>
			  <tr>
				<td>type_no</td>
				<td><input type="hidden" value="${board.boardTypeNo}" name="boardTypeNo" id="boardTypeNo">${board.boardTypeNo}</td>
				 </tr>
				 
				 <tr>
				<td>카테고리</td>
				<td><input type="hidden" value="${board.category}" name="category" id="category">${board.category}</td>
				 </tr>
				<tr>
				<td>Title</td>
				<td><input type="text" value="${board.title}" name="title" id="title"></td>
			 </tr>
				 <tr>
				<td>Subject</td>
				<td><textarea rows="5" cols="30" name="subject" id="subject">${board.subject}</textarea>
				 </tr>
				 
				
				 
   </table>
    <h1 class="blog-page-title"></h1>
   <button type="submit" class="button">수정</button>
  		
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