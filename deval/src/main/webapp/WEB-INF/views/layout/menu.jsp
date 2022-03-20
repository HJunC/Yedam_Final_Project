<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<hr>
<a href="home.do">홈으로</a>
<c:if test="${empty user && empty company}">
	<a href="loginForm.do">로그인</a>
	<a href="signUpForm.do">회원가입</a>
</c:if>
<c:if test="${not empty user}">
	<a href="myPage.do">마이 페이지</a>
	<a href="logout.do">로그아웃</a>
</c:if>
<c:if test="${not empty company}">
	<a href="companyPage.do">회사 페이지</a>
	<a href="comanyLogout.do">로그아웃</a>
</c:if>
<hr>