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
<div class= "input-md round form-control">
 <h1 class="blog-page-title">write .</h1>

		<!-- Form -->
		<form action="writePost.do" method="post">
				<div class= "input-md round form-control">
			<h3><label for="title">title</label></h3> 
			<input type="text" id="title" name="title" required="required" 
				class="input-md round form-control"
						placeholder="Enter title" maxlength="100">

<h3><label for="subject">Subject</label></h3>
		<input type="text"  id="subject" name="subject" required="required"
						class="input-md round form-control" 
					placeholder="Enter subject" maxlength="400">

<div class= "input-md round form-control">
 <h1 class="blog-page-title"></h1>
			<!-- Send Button --> 
			<button type="submit" class= "input-md round form-control">submit</button>
			<button type="reset"  class= "input-md round form-control">cancel</button>
 
</div>
</div>
 </form> 
</div>
</div>
 </section>
 
</body>
</html> 