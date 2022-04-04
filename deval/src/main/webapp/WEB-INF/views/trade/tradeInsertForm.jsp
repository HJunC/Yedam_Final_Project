<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
						<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">중고거래</h2>
					</div>
				</div>
			</div>
		</section>
		<section class="page-section bg-dark light-content pt-0">
			<form action="tradeInsert.do" class="form" method="post">
			<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
				<div class="container relative">
					<!-- 검색 -->
					<div class="row">
						<table class="table shopping-cart-table">
							<tr>
								<td colspan="1" align="right">제 목</td>
								<td colspan="3"><input class="form-control"id="title" name="title"></td>
								<td colspan="1">
								<select id="tradeType" name="tradeType" class="input-md round form-control" style="width: 120px">
								<option>거래유형</option>
								<option>판매</option>
								<option>구매</option>
								</select>
								</td>
							</tr>
							<tr>
								<td width="100" align="right">거래품목</td>
								<td><input class="form-control" id="tradeItem" name="tradeItem"></td>
								<td width="100" align="right">가 격</td>
								<td><input class="form-control" id="price" name="price"></td>
							</tr>
							<tr>
								<td align="right" colspan="1" style="vertical-align: top;">내 용</td>
								<td colspan="3"><textarea class="form-control" rows="10" id="subject" name="subject"></textarea></td>
								<td><input type="hidden" id="writer" name="writer" value="<sec:authentication property="principal.username"/>"></td>
							</tr>
						</table>
						<div align="right">
							<input class="btn btn-mod btn-round btn-border-w btn-small" type="submit" value="등록"> 
							<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" value="목록" onclick="location.href='tradeList.do'">
						</div>
					</div>
				</div>
			</form>
		</section>
		<br>
	</div>
</body>
</html>