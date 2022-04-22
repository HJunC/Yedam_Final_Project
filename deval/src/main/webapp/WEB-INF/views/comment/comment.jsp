<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<section class="page-section bg-dark light-content pt-0">
	<div class="container relative">
		<div class="row">
			<div class="col-lg">
				<div align="left">
					<!-- Accordion -->
					<dl class="accordion">
						<dt>
							<a href="" role="button" aria-expanded="false">댓글</a>
						</dt>
						<dd class="gray">
							<table class="table shopping-cart-table">
								<tbody id="commentBody">
									<tr>
										<td><input class="form-control" size="90" id="commentSub"
											<c:if test="${empty user}">disabled="disabled"</c:if>>
										</td>
										<td></td>
										<td><input
											class="btn btn-mod btn-round btn-border-w btn-small"
											<c:if test="${empty user}">disabled="disabled"</c:if>
											type="button" value="등록" onclick="commentInsert()"></td>
									</tr>
								</tbody>
							</table>

							<!-- End Accordion -->
							<!-- Comments -->
							<div class="mb-80 mb-xs-40">
								<ul class="media-list comment-list clearlist">
									<!-- Comment Item -->
									<c:forEach var="comment" items="${comments}">
										<li class="media comment-item">
											<div class="media-body">
												<div class="comment-item-data">
													<div class="comment-author">${comment.writer}</div>
													<br>
													<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
														value="${comment.commentDate}" />
													<c:if test="${comment.writer eq user}">
														<span class="separator">&mdash;</span>
														<input class="btn btn-mod btn-border-w btn-round"
															type="button" onclick="updateActive()" value="수정">
														<input class="btn btn-mod btn-border-w btn-circle"
															type="button" style="display: none;"
															onclick="commentUpdate(${comment.commentNo})" value="수정">
														<input class="btn btn-mod btn-border-w btn-circle"
															type="button" style="display: none;"
															onclick="updateCancle('${comment.commentSubject}')"
															value="취소">
														<input class="btn btn-mod btn-border-w btn-round"
															type="button"
															onclick="commentDelete(${comment.commentNo})" value="삭제">
													</c:if>
												</div>

												<p>${comment.commentSubject}</p>
											</div>
										</li>
									</c:forEach>
									<!-- End Comment Item -->
								</ul>
							</div>
						</dd>
					</dl>
					<!-- End Comments -->
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
function commentInsert(){
	if($('#commentSub').val != '') {
		$.ajax({
			url : "../comment/commentInsert.do",
			type : 'post',
			data : {
						commentSubject : $('#commentSub').val(),
						writer : '${user}',
						boardNo : ${bno}
					},
			success : function(data){
				if(data != 0) {
					window.location.reload();
				}
			}
		})
	} else {
		alert('댓글을 입력해주세요')
		$('#commentSub').focus();
	
	}
}

function updateActive() {
	$(event.target).parent().children().eq(2).css('display','none');
	$(event.target).parent().children().eq(3).css('display','');
	$(event.target).parent().children().eq(4).css('display','');
	$(event.target).parent().children().eq(5).css('display','none');
	var input = $(event.target).parent().parent().children().eq(1);
	input.empty();
	input.append($('<input class="form-control" id="updInput">'))
}

function updateCancle(subject) {
	$(event.target).parent().children().eq(2).css('display','');
	$(event.target).parent().children().eq(3).css('display','none');
	$(event.target).parent().children().eq(4).css('display','none');
	$(event.target).parent().children().eq(5).css('display','');
	$(event.target).parent().parent().children().eq(1).empty();
	$(event.target).parent().parent().children().eq(1).text(subject);
}

function commentUpdate(no){
	if($('#updInput').val() != ''){
		$.ajax({
			type : 'post',
			url : '../comment/commentUpdate.do',
			data : {
				commentNo : no,
				commentSubject : $('#updInput').val()
			},
			success : function(data) {
				if(data != 0) {
					location.reload();
				}
			}
		})
	} else {
		alert('수정할 내용을 입력해주세요');
		$('#updInput').focus();
	}
}

function commentDelete(no){
	$.ajax({
        type:'POST',
        url : "../comment/commentDelete.do",
        data: {no : no},
        success : function(data){
        	location.reload();
        },
        error:function(request,status,error){
        	
       }
    });
}


</script>
