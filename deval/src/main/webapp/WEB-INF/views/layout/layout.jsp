<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>

</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="menu"/>
	<tiles:insertAttribute name="side"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
	<script src="resources/js/jquery-3.6.0.min.js"></script>
</body>
</html>