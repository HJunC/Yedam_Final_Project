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
					<a href="">댓글</a>
				</dt>
				<dd class="gray">
					<table class="table shopping-cart-table">
					<tbody id="commentBody">
					<tr>
						<td>
							<input class="form-control" size="90" id="commentSub" name="commentSubject"> 
							<input type="hidden" id="boardNo" name="boardNo" value="${bno}">
						</td>
						<td>
							<input type="hidden" id="writer" name="writer"
							value="${user}">
						</td>
						<td>
							<input class="btn btn-mod btn-round btn-border-w btn-small" <c:if test="${empty user}">disabled="disabled"</c:if>
							type="button" value="등록" onclick="commentUpdate('IN')">
						</td>
					</tr>
					</tbody>
					</table>
				</dd>
			</dl>
			<!-- End Accordion -->
			<!-- Comments -->
               <div class="mb-80 mb-xs-40">
                   <ul class="media-list comment-list clearlist">
                       <!-- Comment Item -->
                       <c:forEach var="comment" items="${comments}">
                       <li class="media comment-item">
							<div class="media-body">
                               <div class="comment-item-data">
                                   <div class="comment-author">
                                       ${comment.writer}
                                   </div>
                                   <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentDate}"/> <span class="separator">&mdash;</span>
                                   <input class="btn btn-mod btn-round btn-border-w btn-small" type="button" onclick="commentDelete(${comment.commentNo })" value="삭제">
                               </div>
	
                               <p>
                                   ${comment.commentSubject}
                               </p>
                           </div>
                       </li>
                       </c:forEach>
                       <!-- End Comment Item -->
                   </ul>
               </div>
<!-- End Comments -->
		</div>
	</div>
	</div>
	</div>
	</section>
<script type="text/javascript">
function commentInsert(){
	if()
}

function commentUpdate(str){
	if (str == "IN") {
		frm2.method = "post";
		frm2.action = "../comment/commentInsert.do";
	}
	frm2.submit();
}

function commentDelete(no){
	$.ajax({
        type:'POST',
        url : "../comment/commentDelete.do",
        data: {"no":no},
        success : function(data){
        	location.reload();
        },
        error:function(request,status,error){
        	
       }
    });
}


</script>
