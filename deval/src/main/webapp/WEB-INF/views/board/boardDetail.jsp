<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<link rel="stylesheet"
	href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet"
	href="${resources}/css/common/toastui-editor-dark.min.css" />
<section class="small-section bg-dark-alfa-50 bg-scroll light-content"
	data-background="${resources}/images/full-width-images/section-bg-19.jpg"
	id="home">
	<div class="container relative pt-100">
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">
					<input type="hidden" value="${board.title}" name="title" id="title">
					${board.title}
				</h2>
				<br> <br>
				<div class="table-responsive">
					<c:set var="upload" value="/upload" />
					<form action="boardUpdateForm.do">
						<input type="hidden" name="boardTypeNo" value="${board.boardNo}">
						<div align="right">
							<c:if test="${board.boardTypeNo != 1}">
								<c:if test="${user == board.writer}">
									<input class="btn btn-mod btn-round btn-border-w btn-small"
										type="button"
										onclick="location.href='boardUpdateForm.do?boardNo=${board.boardNo}'"
										value="수정">
									<a href='boardDelete.do?boardNo=${board.boardNo}'
										class="btn btn-mod btn-round btn-border-w btn-small">삭제</a>
								</c:if>
							</c:if>
							<c:if test="${board.boardTypeNo == 1}">
								<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
									<input class="btn btn-mod btn-round btn-border-w btn-small"
										type="button"
										onclick="location.href='boardUpdateForm.do?boardNo=${board.boardNo}'"
										value="수정">
									<a href='boardDelete.do?boardNo=${board.boardNo}'
										class="btn btn-mod btn-round btn-border-w btn-small">삭제</a>
								</sec:authorize>
							</c:if>
						</div>
						<table>
							<tr>
								<th>#${board.boardNo}</th>
								<th><c:if test="${board.boardTypeNo == 1}">[ 공지사항 ]</c:if>
									<c:if test="${board.boardTypeNo == 2}">[ 자유게시판 ]</c:if> <c:if
										test="${board.boardTypeNo == 3}">[ 최신기술동향 ]</c:if>
								<td>
								<th>작성자 : ${board.writer }</th>
								<th>작성일자 : <fmt:formatDate pattern="yyyy-MM-dd hh:mm"
										value="${board.boardDate}" /></th>
								<th>조회수 : ${board.hit}</th>
								<sec:authorize access="hasAnyRole('ROLE_USER')">
									<th id="recommend">추천수 : ${board.recommend}</th>
								</sec:authorize>
								 <tr>
                              <td>file</td>
                              <td class="post-prev-img" style="border-radius: 70%;">
                              <img src="/upload/${board.photo}" id="photo" alt="이미지 미리보기"/></td>
                           </tr> 
							<tr>
								<th style="vertical-align: top;" height="500px" colspan="4"><input
									type="hidden" value="${board.subject}" name="subject"
									id="subject">${board.subject}</th>
							<tr>
								<%-- <tr>
                              <td>유형</td>
                              <td><input type="hidden" value="${board.boardTypeNo}"
                                 name="boardTypeNo" id="boardTypeNo">${board.boardTypeNo}</td>
                           </tr>
                           <tr>
                              <td>카테고리</td>
                              <td><input type="hidden" value="${board.category}"
                                 name="category" id="category">${board.category}</td>
                           </tr> --%>
							</tbody>
						</table>
						<!--    <div class="container relative">
                  <div class="mb-80 mb-xs-40"> -->
					</form>

					<div align="right" class="col">
						<c:if test="${board.boardTypeNo != 1}">
							<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
								<p class="btn btn-mod btn-round btn-border-w btn-small"
									id="recommenBtn">게시글추천</p>
								<h1 class="blog-page-title"></h1>

							</sec:authorize>
						</c:if>

						<div align="left">
							<!-- Accordion -->


							<form action="commentInsert.do" method="post">
								<table class="table shopping-cart-table">
									<tbody id="commentBody">
										<tr>
											<td><input class="form-control" size="90"
												id="commentSub"
												<c:if test="${empty user}">disabled="disabled"</c:if>>
											</td>
											<td></td>
											<td><input
												class="btn btn-mod btn-round btn-border-w btn-small"
												<c:if test="${empty user}">disabled="disabled"</c:if>
												type="button" value="등록" onclick="commentInsert()">
											</td>
										</tr>
									</tbody>
								</table>

							</form>



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
															onclick="commentUpdate(${comment.commentNo})"
															value="수정하기">
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

							<!-- <button class="btn btn-secondary"
               onclick="location.href='boardDetail.do'">목록으로</button> -->
							<div align="right">
								<c:if test="${board.boardTypeNo == 1}">
									<a href="notice.do"
										class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
								</c:if>
								<c:if test="${board.boardTypeNo == 2}">
									<a href="free.do"
										class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
								</c:if>
								<c:if test="${board.boardTypeNo == 3}">
									<a href="technical.do"
										class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</section>





<script type="text/javascript">
   $("#addComment").on("click", function() {
      $.ajax({
         url : "/deval/comment/commentPost.do",
         data : {
            "commentSubject" : $("#commentSub").val(),
            "boardNo" : ${board.boardNo},
            "writer" : "${user}"
         },
         type : "POST",
         dataType : "json",
         success : function(data) {
            console.log(data);
            makeTr(data);
         },
         error : function() {
            alert("다시");
         }
      })
   });

   $("#recommenBtn").on("click", function() {
      $.ajax({
         url : "recommend.do",
         type : "POST",
         data : {
            "boardNo" : ${board.boardNo}
         },
         dataType : "json",
         success : function(data) {
            document.getElementById('recommend').text = data;
         }
      })
   });

   function makeTr(data) {
      $("#tbl").empty();
      $.each(data, function(idx, item) {
         console.log(item)
         let tr = $("<tr>");
         tr.append($("<th>").text(item.writer), $("<td>").text(
               item.commentDate), $("<td>").text(item.commentSubject));
         $("#tbl").append(tr);
      });
   }
</script>

<script src="http://madalla.kr/js/jquery-1.8.3.min.js"></script>

<script type="text/javascript">
   $(function() {
      $("#file").on('change', function() {
         readURL(this);
      });
   });

   function readURL(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(e) {
            $('#photo').attr('src', e.target.result);
         }
         reader.readAsDataURL(input.files[0]);
      }
   }


   function commentInsert(){
   	if($('#commentSub').val != '') {
   		$.ajax({
   			url : "../comment/commentInsert.do",
   			type : 'post',
   			data : {
   						commentSubject : $('#commentSub').val(),
   						writer : '${user}',
   						boardNo : ${board.boardNo}
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
</body>
</html>