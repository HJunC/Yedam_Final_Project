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
<div align="center">
<div class="col-md-6 mb-md-20"> 
            <h1 class="blog-page-title">detail.</h1>
         <div class="input-md round form-control">
         글번호 ${board.boardNo}
            유형 ${board.boardTypeNo}
카테고리${board.category}
조회수${board.hit}
<table>
<tr>
               <th>제목${board.title}</th>
<tr>
                  <th>내용${board.subject}</th>
<tr>
                  <th>작성일${board.boardDate}</th>
<tr>   
                  <th>글쓴이${board.writer}</th>
<tr>
</table>
</div>
</div>
<a href="free.do"><button type="submit" class="btn btn-mod btn-g btn-small btn-square">list</button></a>
</div>
</section>
</body>
</html>