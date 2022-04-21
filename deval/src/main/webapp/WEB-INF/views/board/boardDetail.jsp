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
					<input type="hidden" value="${board.title}" name="title" id="title">${board.title}</h2>
				<div class="table-responsive">
					<c:set var="upload" value="/upload" />
					<form action="boardUpdateForm.do" method="post">
						<input type="hidden" name="boardTypeNo" value="${board.boardNo}">
						<div align="right">
							<c:if test="${board.boardTypeNo != 1}">
								<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
									<button type="submit"
										class="btn btn-mod btn-round btn-border-w btn-small">수정</button>
									<a href='boardDelete.do?boardNo=${board.boardNo}'
										class="btn btn-mod btn-round btn-border-w btn-small">삭제</a>
								</sec:authorize>
							</c:if>
						</div>
						<h4 class="blog-page-title"></h4>
						<table>
							<colgroup>
								<col width="30%">
								<col width="*">
							</colgroup>
					<form action="boardUpdateForm.do">
						<input type="hidden" name="boardTypeNo" value="${board.boardNo}">
						<div align="right">
							<c:if test="${board.boardTypeNo != 1}">
								<c:if test="${user == board.writer}">
									<input class="btn btn-mod btn-round btn-border-w btn-small"
										type="button" onclick="location.href='boardUpdateForm.do?'"
										value="수정">
									<a href='boardDelete.do?boardNo=${board.boardNo}'
										class="btn btn-mod btn-round btn-border-w btn-small">삭제</a>
								</c:if>
							</c:if>
							<tbody>
								<tr>

							<c:if test="${board.boardTypeNo == 1}">
								<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
									<input class="btn btn-mod btn-round btn-border-w btn-small"
										type="button" onclick="location.href='boardUpdateForm.do?'"
										value="수정">
									<a href='boardDelete.do?boardNo=${board.boardNo}'
										class="btn btn-mod btn-round btn-border-w btn-small">삭제</a>
								</sec:authorize>
							</c:if>

						</div>

						<table>
							<tr>
								<th>#${board.boardNo}</th>
								<th><c:if
										test="${board.boardTypeNo == 1}">[공지사항</c:if> <c:if
										test="${board.boardTypeNo == 2}">[자유게시판]</c:if> <c:if
										test="${board.boardTypeNo == 3}">[최신기술동향]</c:if>
								<th>작성자 : ${board.writer }</th>
								<th>작성일자 : <fmt:formatDate pattern="yyyy-MM-dd hh:mm"
										value="${board.boardDate}" /></th>
								<th>조회수 : ${board.hit}</th>
						
									<th>등록날짜 &nbsp;<fmt:formatDate pattern="yy-MM-dd"
											value="${board.boardDate}" /></th>
									<th>글번호 &nbsp;<input type="hidden"
										value="${board.boardNo}" name="boardNo" id="boardNo">${board.boardNo}</th>
							<sec:authorize access="hasAnyRole('ROLE_USER')">
								<th>추천수<input type="hidden" value="${board.recommend}"
									name="hit" id="hit">${board.recommend}</th>
							</sec:authorize>
							<%-- <tr>
                              <td>file</td>
                              <td class="post-prev-img" style="border-radius: 70%;">
                              <a href="#" src="images/${board.photo}" id="photo"
                                 alt="이미지 미리보기"></a></td>
                           </tr>  --%>
								</tr>

									<th>조회수 &nbsp;<input type="hidden" value="${board.hit}"
										name="hit" id="hit">${board.hit}</th>


									<th>추천수 &nbsp;<input type="hidden"
										value="${board.recommend}" name="hit" id="hit">${board.recommend}</th>

									<%-- <tr>
										<td>file</td>
										<td class="post-prev-img" style="border-radius: 70%;">
										<a href="#" src="images/${board.photo}" id="photo"
											alt="이미지 미리보기"></a></td>
									</tr>  --%>
									<tr>

									<th>분류 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <c:if
											test="${board.boardTypeNo == 1}">공지사항</c:if> <c:if
											test="${board.boardTypeNo == 2}">자유게시판</c:if> <c:if
											test="${board.boardTypeNo == 3}">최신기술동향</c:if>
								
								</tr>
								<tr>


									<th>내용 &nbsp;<input type="hidden" value="${board.subject}"
										name="subject" id="subject">${board.subject}</th>

								</tr>
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
						<!-- 	<div class="container relative">
						<div class="mb-80 mb-xs-40"> --></form>
								
					<div align="center">
						<h4 class="blog-page-title"></h4>
						<c:if test="${board.boardTypeNo != 1}">
							<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
								<p class="btn btn-mod btn-round btn-border-w btn-small"
									id="recommenBtn">게시글추천</p>
								<div class="mb-60 mb-md-30"></div>
								<form action="commentPost.do" method="post">
									<textarea style="width: 50%" rows="2" cols="400"
										id="commentSub" name="commentSub" required="required"
										class="input-md square form-control"
										placeholder="Enter Comment... " maxlength="400"></textarea>
									<br>
									<button type="button"
										class="btn btn-mod btn-round btn-border-w btn-small"
										id="addComment">submit</button>
								</form>
							</sec:authorize>
					
					</div>
					<table id="tbl">
						<c:forEach items="${comments}" var="comment">
							<tr><td>${comment.writer}</td>
							<td>${comment.commentDate}</td></tr>
							<tr><th colspan="100">${comment.commentSubject}
							<h4 class="blog-page-title"></h4></th></tr>
						</c:forEach>
					</table>
					</c:if>
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
									
								<form action="commentPost.do" method="post">
									<textarea style="width: 100%" rows="1" cols="400"
										id="commentSub" name="commentSub" required="required"
										class="input-md square form-control"
										placeholder="Enter Comment... " maxlength="400"></textarea>
									<br>
								</form>
							</sec:authorize>
						</c:if>
						<div class="comment-author">
							${comment.writer}
							<button type="button"
								class="btn btn-mod btn-round btn-border-w btn-small"
								id="addComment">submit</button>
							<c:forEach items="${comments}" var="comment">
								<p>
									${comment.writer} ${comment.commentDate} <br> <br>
									${comment.commentSubject}
								</p>
								<c:if test="${user == comment.writer}">
									<!-- 추가사항: 첫번째 수정 클릭 시 textarea 생성 -> 이후 내용을 채우고 수정 버튼을 다시 클릭 시 commentUpdate() 실행되게끔 -->
									<input class="btn btn-mod btn-border-w btn-round" type="button"
										onclick="commentUpdate(${comment.commentNo})" value="수정">
									<input class="btn btn-mod btn-border-w btn-round" type="button"
										onclick="commentDelete(${comment.commentNo})" value="삭제">
									<h1 class="blog-page-title"></h1>
								</c:if>
							</c:forEach>
					<!-- <button class="btn btn-secondary"
					onclick="location.href='boardDetail.do'">목록으로</button> -->
							<!-- <button class="btn btn-secondary"
               onclick="location.href='boardDetail.do'">목록으로</button> -->
					<div align="right">
							<div align="right">
						<c:if test="${board.boardTypeNo == 1}">
							<a href="notice.do"
								class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
						</c:if>
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
				"boardNo" : $("#boardNo").val(),
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
            "boardNo" : $("#boardNo").val()
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