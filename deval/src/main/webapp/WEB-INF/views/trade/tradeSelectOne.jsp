<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="resources" value="${pageContext.request.contextPath}/resources" />
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
				<div class="container relative">
					<div class="row">
						<div class="col-lg-8 offset-lg-2">
							<div class="table-responsive">
							<form id="frm" name="frm">
							<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
									<table class="table shopping-cart-table">
										<tr>
											<th>#${trade.tradeNo }[${trade.tradeType }]${trade.title }</th>
											<td><input type="hidden" id="tradeNo" name="tradeNo"
												value="${trade.tradeNo }"></td>
										</tr>
										<tr>
											<th>작성자 : ${trade.writer }</th>
											<th>작성일자 : ${trade.tradeDate }</th>
											<th>조회수 : ${trade.hit }</th>
										</tr>
										<tr>
											<th>거래품목 : ${trade.tradeItem }</th>
											<th>가격 : ${trade.price }</th>
										</tr>
										<tr>
											<th style="vertical-align: top;" height="500px"><br>${trade.subject }</th>
										</tr>
									</table>
									<%-- <c:if test="${trade.writer not eq <sec:authentication property='principal.username'/>}"> --%>
									<div align="left">
										<input class="btn btn-mod btn-round btn-border-w btn-small"
											type="button" onclick="tradeCall('T')" value="거래신청">
									</div>
									<%-- </c:if> --%>
									<div align="right">
										<input class="btn btn-mod btn-round btn-border-w btn-small"
											type="button" onclick="tradeCall('U')" value="수정"> 
										<input class="btn btn-mod btn-round btn-border-w btn-small"
											type="button" onclick="tradeCall('D')" value="삭제"> 
										<input class="btn btn-mod btn-round btn-border-w btn-small"
											type="button" value="목록" onclick="location.href='tradeList.do'">
									</div>
								<br>
								</form>
								<form id="frm2" name="frm2">
								<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
								<div align="left">
									<!-- Accordion -->
									<dl class="accordion">
										<dt>
											<a href="">댓글리스트</a>
										</dt>
										<dd class="gray">
											<table class="table shopping-cart-table">
												<c:forEach items="${comments }" var="comment">
												<tr>
													<td>${comment.writer } : ${comment.commentSub }</td>
													<!-- <td width="300px"></td> -->
													<td width="135px" align="right">
													<input class="btn btn-mod btn-round btn-border-w btn-small" type="button" value="수정">
													<input class="btn btn-mod btn-round btn-border-w btn-small" type="button" value="삭제">
													
													</td>
												</tr>
												</c:forEach>
												<tr>
													<td>댓글달기  <input style="" class="btn btn-mod btn-round btn-border-w btn-small"
														size="90" id="commentSub" name="commentSub">
														<input type="hidden" id="boardNo" name="boardNo" value="${trade.tradeNo }"></td>
														<td><input type="hidden" id="writer" name="writer" value="<sec:authentication property="principal.username"/>"></td>
														<td>
														<input class="btn btn-mod btn-round btn-border-w btn-small"
															type="button" value="등록" onclick="commentUpdate('IN')">
													</td>
												</tr>
											</table>
										</dd>
									</dl>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		
		<br>
	</div>
</body>
<script type="text/javascript">
	function tradeCall(str) {
		if (str == "U") {
			frm.method = "get";
			frm.action = "tradeUpdateForm.do";
		} else if (str == "D") {
			window.alert('삭제하였습니다.');
			frm.action = "tradeDelete.do";
		} else if (str == "T") {
			/* frm.action = "tradeReq.do"; */
		}
		frm.submit();
	}
	
	function commentUpdate(str){
		if (str == "IN") {
			frm2.method = "post";
			frm2.action = "../comment/commentInsert.do";
		}
		frm2.submit();
	}
</script>
</html>