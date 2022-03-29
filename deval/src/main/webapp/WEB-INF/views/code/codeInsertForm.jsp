<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div align="center">
		<section class="page-section bg-dark light-content" id="home">
			<div class="container relative text-center">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">소스코드</h2>
					</div>
				</div>
			</div>
		</section>
		<section class="page-section bg-dark light-content pt-0">
			<form action="codeInsert.do" class="form">
				<div class="container relative">
					<!-- 검색 -->
					<div class="row">
						<div align="left">&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="lang">언어</label> 
							<select id="cqLang" name="cqLang" class="input-md round form-control" style="width: 100px">
								<option>전체</option>
								<option>JAVA</option>
								<option>C#</option>
								<option>C++</option>
								<option>USA</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp; 
							<label for="type">유형</label> 
							<select id="cqType" name="cqType" class="input-md round form-control" style="width: 100px">
								<option>전체</option>
								<option>공유</option>
								<option>질문</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</div>
					<br>
					<div class="table-responsive">
						<table class="table shopping-cart-table">
							<tr>
								<th>제 목</th>
								<td><input size="122" id="title" name="title"></td>
							</tr>
							<tr>
								<th style="vertical-align: top;">내 용</th>
								<td><textarea rows="10" cols="160" id="subject" name="subject"></textarea></td>
								<%-- <td><input type="hidden" id="writer" name="writer" value="${code.writer }"></td> --%>
								<td><input type="hidden" id="writer" name="writer" value="popo"></td>
							</tr>
						</table>
						<div align="right">
							<input class="btn btn-mod btn-round btn-border-w btn-small" type="submit" value="등록"> 
							<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" value="목록" onclick="location.href='codeList.do'">
						</div>
					</div>
				</div>
			</form>
		</section>
		<br>
	</div>
</body>
</html>