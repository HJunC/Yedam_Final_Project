<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title><tiles:getAsString name="title"/></title>
		<meta name="description" content="Rhythm &mdash; One & Multi Page Creative Template">
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
		<!-- Favicons -->
		<link rel="shortcut icon" href="${resources}/images/favicon.png">
		<script src="${resources}/js/jquery-3.5.1.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="${resources}/css/bootstrap.min.css">
		<link rel="stylesheet" href="${resources}/css/template.css">
		<link rel="stylesheet" href="${resources}/css/custom/custom-style.css">
</head>
	<body class="appear-animate">
		<!-- Page Loader -->
		<div class="page-loader dark">
			<div class="loader">Loading...</div>
		</div>
		<!-- End Page Loader -->

		<!-- Skip to Content -->
		<a href="#main" class="btn skip-to-content">Skip to Content</a>
		<!-- End Skip to Content -->

		<div class="page bg-dark light-content" id="top">
			<tiles:insertAttribute name="header"/>
			<main id="main">
				<tiles:insertAttribute name="body"/>
			</main>
			<tiles:insertAttribute name="footer"/>
		</div>
		<!-- JS -->
		
		<script src="${resources}/js/jquery.easing.1.3.js"></script>
		<script src="${resources}/js/bootstrap.bundle.min.js"></script>
		<script src="${resources}/js/SmoothScroll.js"></script>
		<script src="${resources}/js/jquery.scrollTo.min.js"></script>
		<script src="${resources}/js/jquery.localScroll.min.js"></script>
		<script src="${resources}/js/jquery.viewport.mini.js"></script>
		<script src="${resources}/js/jquery.countTo.js"></script>
		<script src="${resources}/js/jquery.appear.js"></script>
		<script src="${resources}/js/jquery.parallax-1.1.3.js"></script>
		<script src="${resources}/js/jquery.fitvids.js"></script>
		<script src="${resources}/js/owl.carousel.min.js"></script>
		<script src="${resources}/js/isotope.pkgd.min.js"></script>
		<script src="${resources}/js/imagesloaded.pkgd.min.js"></script>
		<script src="${resources}/js/jquery.magnific-popup.min.js"></script>
		<script src="${resources}/js/masonry.pkgd.min.js"></script>
		<script src="${resources}/js/jquery.lazyload.min.js"></script>
		<script src="${resources}/js/wow.min.js"></script>
		<script src="${resources}/js/morphext.js"></script>
		<script src="${resources}/js/typed.min.js"></script>
		<script src="${resources}/js/all.js"></script>
		<script src="${resources}/js/contact-form.js"></script>
		<script src="${resources}/js/jquery.ajaxchimp.min.js"></script>
		<script src="${resources}/js/objectFitPolyfill.min.js"></script>
		<script src="${resources}/js/splitting.min.js"></script>
	</body>
</html>