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
 <h1 class="blog-page-title">write .</h1>

         <form action="writePost.do" method="post">
            
            <div>
               <h3><label for="title">title</label></h3>
               <input type="text" id="title" name="title" required="required"
                  class="input-mdrotund form-control" placeholder="Enter title"
                  maxlength="100">
         
                  <h3><label for="subject">Subject</label></h3>
               <input type="text" id="subject" name="subject" required="required"
                  class="input-md round form-control" placeholder="Enter subject"
                  maxlength="400">
               
            <div class="mb-30 mb-md-20">
               <h1 class="blog-page-title"></h1>
               <button type="submit" class="btn btn-mod btn-g btn-small btn-round">submit</button>
               <button type="reset"  class="btn btn-mod btn-b btn-small btn-round">cancel</button>
           </div>      
           </div>      
         </form>
           </div>      
           </div>      
   </section>
</body>
</html>