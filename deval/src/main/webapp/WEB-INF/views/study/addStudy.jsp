<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />

<!-- Title -->
                <section class="small-section bg-dark-alfa-50" data-background="images/full-width-images/section-bg-19.jpg">
                    <div class="container relative">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                                    <h1 class="hs-line-7 mb-20 mb-xs-10">STUDY</h1>
                                </div>
                                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
                                         스터디 모집
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
        <!-- End Title -->

<style>
    .input-info {
        font-size: 14px;
        color: #c0c0c0;
    }
</style>

<!-- Section -->
<section class="page-section bg-dark light-content">
    <div class="container">

        <!-- Write Form -->
        <div class="row">
            <div>
                <form class="form contact-form" id="frm">
                    <sec:csrfInput />
                    <div class="clearfix">
                        <div class="form-group">
                            <label for="StudyName">스터디 명</label>
                            <input type="text" name="studyNm" id="studyNm" class="input-lg round form-control bg-dark-input" placeholder="스터디명을 입력해주세요" pattern=".{6,40}" required aria-required="true">
                        </div>
                        
                        <div class="form-group">
                            <label for="kakao">카카오톡</label>
                            <input type="text" name="kakao" id="kakao" class="input-lg round form-control bg-dark-input" placeholder="오픈톡 주소를 입력해주세요" pattern=".{6,40}" required aria-required="true">
                        </div>

                        <div class="form-group">
                            <label for="location">지역</label>
                            <p class="input-info">스터디 모집 지역을 선택해주십시오</p>
                            <select id="location" name="location" class="input-lg round form-control bg-dark-input" required aria-required="true">
								<option>서울특별시 </option>
								<option>인천광역시</option>
								<option>경기도</option>
								<option>강원도</option>
								<option>충청북도</option>
								<option>충청남도</option>
								<option>세종특별자치시</option>
								<option>대전광역시</option>
								<option>대구광역시</option>
								<option>경상북도</option>
								<option>경상남도</option>
								<option>부산광역시</option>
								<option>울산광역시</option>
								<option>전라북도</option>
								<option>광주광역시</option>
								<option>전라남도</option>
								<option>제주특별자치도</option>
							</select><br><br> 
                        </div>
                        
                         <div class="form-group">
                            <label for="maxRcnt">인원</label>
                            <p class="input-info">스터디의 인원은 최소 2명, 최대 5명 입니다</p>
                            <select id="maxRcnt" name="maxRcnt" class="input-lg round form-control bg-dark-input" required aria-required="true">
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select><br><br> 
                        </div>
                        
                        <div class="form-group">
                            <label for="lang">학습 언어<h6 id="viewLang"></h6></label>
                            <script src="${resources}/js/common/Languages.js"></script>

                           <!--  <div>
                                <div class="tags" id="languagesBox"><p class="input-info mb-1">언어</p></div>
                                <div class="tags" id="fplBox"><p class="input-info mb-1">프레임워크</p></div>
                                <div class="tags" id="versionControlBox"><p class="input-info mb-1">버전관리</p></div>
                                <div class="tags" id="databaseBox"><p class="input-info mb-1">DB</p></div>
                            </div> -->
                            <div>
                                <dl class="toggle">

                                    <dt>
                                        <a href="" role="button" aria-expanded="false">언어</a>
                                    </dt>
                                    <dd style="display: none;">
                                        <div class="tags" id="languagesBox"></div>
                                    </dd>

                                    <dt>
                                        <a href="" role="button" aria-expanded="false">프레임워크</a>
                                    </dt>
                                    <dd style="display: none;">
                                        <div class="tags" id="fplBox"></div>
                                    </dd>

                                    <dt>
                                        <a href="" role="button" aria-expanded="false">버전관리</a>
                                    </dt>
                                    <dd style="display: none;">
                                        <div class="tags" id="versionControlBox"></div>
                                    </dd>

                                    <dt>
                                        <a href="" role="button" aria-expanded="false">DB</a>
                                    </dt>
                                    <dd style="display: none;">
                                        <div class="tags" id="databaseBox"></div>
                                    </dd>
                                </dl>
                            </div>
                            <input type="hidden" name="lang" value="">

                            <script>
                              var checkBox = "";
                              Language.forEach(item => {
                                checkBox += '<input type="checkbox" class="btn-check" id="lang'+item+'" name="ck_lang" onclick="count_ck(this);" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="lang'+item+'">' + item + '</label>';
                              })
                              $("#languagesBox").append(checkBox);
                              checkBox = "";
                              FPL.forEach(item => {
                                checkBox += '<input type="checkbox" class="btn-check" id="lang'+item+'" name="ck_lang" onclick="count_ck(this);" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="lang'+item+'">' + item + '</label>';
                              })
                              $("#fplBox").append(checkBox);
                              checkBox = "";
                              versionControl.forEach(item => {
                                checkBox += '<input type="checkbox" class="btn-check" id="lang'+item+'" name="ck_lang" onclick="count_ck(this);" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="lang'+item+'">' + item + '</label>';
                              })
                              $("#versionControlBox").append(checkBox);
                              checkBox = "";
                              Database.forEach(item => {
                                checkBox += '<input type="checkbox" class="btn-check" id="lang'+item+'" name="ck_lang" onclick="count_ck(this);" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="lang'+item+'">' + item + '</label>';
                              })
                              $("#databaseBox").append(checkBox);
                              checkBox = "";
                            </script>

                        </div>
                        <div class="form-group">
                            <label>난이도</label>
                            <div class="row">
                                <div class="col input-group">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">상</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" id="lv1" value="상" name="defficulty" checked required>
                                    </div>
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">중</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" id="lv2" value="중" name="defficulty" required>
                                    </div>

                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">하</span>
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" id="lv3" value="하" name="defficulty" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label for="recruitEdt">학습기간</label>
                            <input type="date" name="studySdt" id="studySdt" class="input-lg round form-control bg-dark-input" required aria-required="true">
                            <input type="date" name="studyEdt" id="studyEdt" class="input-lg round form-control bg-dark-input" required aria-required="true">
                         </div>
                         
                        <div class="form-group">
                            <label for="subject">내용</label>
                            <input type="hidden" name="subject">
							<div id="editor"></div>
							<script src="${resources}/js/common/toastui-editor-all.min.js"></script>
				
							<div id="viewer"></div>
							<script src="${resources}/js/common/toastui-editor-all.min.js"></script>
                        </div>
                    </div>

                    <!-- Send Button -->
                    <div align="center">
					<input type="button" id="btnStdAdd" name="btnStdAdd" value="등록" onclick="StdAdd()" class="btn btn-mod btn-glass btn-round btn-small">
					<input type="reset" value="취소" class="btn btn-mod btn-glass btn-round btn-small">
					</div>
				</form>
            </div>
        </div>
        <!-- End Write Form -->

    </div>
</section>
<!-- End Section -->

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script src="${resources}/js/study/common.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			console.log("Study Start");
			
			$('#studySdt').val(new Date().toISOString().substring(0, 10));
			
			var dt = new Date();
			dt.setDate(dt.getDate()+14);
			$('#studyEdt').val(dt.toISOString().substring(0, 10));
		});
		
		Date.prototype.getInterval = function (otherDate) {
		    var interval;
		 
		    if(this > otherDate)
		        interval = this.getTime() - otherDate.getTime();
		    else
		        interval = otherDate.getTime() - this.getTime();
		 
		    return Math.floor(interval / (1000*60*60*24));
		}

		
		
		//언어 체크박스 - 2개만 체크되게 하기
		function count_ck(obj){
			var chkbox = document.getElementsByName("ck_lang");
			var chkCnt = 0;
			
			for(var i = 0; i < chkbox.length; i++){
				if(chkbox[i].checked){
					chkCnt++; 
				}
			}
			
			if(chkCnt > 2){
				alert("스터디 기술은 2개까지 선택가능합니다.");
				obj.checked = false;
				return false;
			}
		}
	</script>
	
	<script>
	  /**
	   * toast 에디터 적용
	   */
	  const { Editor } = toastui;
	
	  const editorObject = new Editor({
	    el: document.querySelector('#editor'),
	    previewStyle: 'vertical', 
	    initialValue: '스터디 모임 장소, 시간을 필수로 입력해주세요.',
	    height: '500px',
	    initialEditType: 'wysiwyg',
	    theme: 'dark'
	  });
	
	  editorObject.getMarkdown();
	  
	  /**
	  * 뷰어 적용
	  */
	  const viewer = new toastui.Editor.factory({
		    el: document.querySelector("#viewer"),
		    viewer: true,
		    initialValue: '${study.subject}',
		    theme: 'dark'
		});
	  
	// 스터디 등록
		function StdAdd() {
			//ExceptionStd();

			console.log("Study Add Start");
			$('#editor').prev().val(editorObject.getHTML());
			
			$.ajax({
				url : "insertStudy.do",
				type : "post",
				data : $("#frm").serialize(),
				dataType : "text",
				success : function(result) {
					console.log("succ", result);
					if (result != "0") {
						alert("스터디 등록이 되었습니다");
						location.href="studyMain.do";
					}
				},
				error : function(err) {
					console.log("err", err);
					alert('모든 정보를 입력해주세요');
				}
			});
		}
	</script>
