<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
        <!-- Title -->
               <section class="small-section bg-dark-alfa-50 bg-scroll light-content" data-background="${resources}/images/full-width-images/section-bg-19.jpg" id="home">
    			<div class="container relative pt-70">
                     <div class="row">
                        <div class="col-md-8">
                              <div class="wow fadeInUpShort" data-wow-delay=".1s">
                                  <h3 class="hs-line-7 mb-20 mb-xs-20" style="font-size: 52px;">${study.studyNm}</h3>
                              </div>
                            <div class="wow fadeInUpShort" data-wow-delay=".2s">
                               		<p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
                               			⌨ Modify STUDY
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
                <form class="form contact-form" id="frm" action="editStudy.do" method="post" onsubmit="inputSubject()">
                    <sec:csrfInput />
                    <div class="clearfix">
                        <div class="form-group">
                            <label for="StudyName">스터디 명</label>
                            <input type="text" name="studyNm" id="studyNm" value="${study.studyNm }" class="input-lg round form-control bg-dark-input" placeholder="스터디명을 입력해주세요" pattern=".{6,40}" required aria-required="true">
                        </div>
                        
                        <div class="form-group">
                            <label for="kakao">카카오톡</label>
                            <input type="text" name="kakao" id="kakao" value="${study.kakao }" class="input-lg round form-control bg-dark-input" placeholder="오픈톡 주소를 입력해주세요" pattern=".{6,40}" required aria-required="true">
                        </div>

                        <div class="form-group">
                            <label for="location">지역</label>
                            <p class="input-info">스터디 모집 지역을 선택해주십시오</p>
                            <select id="location" name="location" class="input-lg round form-control bg-dark-input" required aria-required="true">
								<option <c:if test="${study.location=='서울특별시'}">selected </c:if>>서울특별시</option>
								<option <c:if test="${study.location=='인천광역시'}">selected </c:if>>인천광역시</option>
								<option <c:if test="${study.location=='경기도'}">selected </c:if>>경기도</option>
								<option <c:if test="${study.location=='강원도'}">selected </c:if>>강원도</option>
								<option <c:if test="${study.location=='충청북도'}">selected </c:if>>충청북도</option>
								<option <c:if test="${study.location=='충청남도'}">selected </c:if>>충청남도</option>
								<option <c:if test="${study.location=='세종특별자치시'}">selected </c:if>>세종특별자치시</option>
								<option <c:if test="${study.location=='대전광역시'}">selected </c:if>>대전광역시</option>
								<option <c:if test="${study.location=='대구광역시'}">selected </c:if>>대구광역시</option>
								<option <c:if test="${study.location=='경상북도'}">selected </c:if>>경상북도</option>
								<option <c:if test="${study.location=='경상남도'}">selected </c:if>>경상남도</option>
								<option <c:if test="${study.location=='부산광역시'}">selected </c:if>>부산광역시</option>
								<option <c:if test="${study.location=='울산광역시'}">selected </c:if>>울산광역시</option>
								<option <c:if test="${study.location=='전라북도'}">selected </c:if>>전라북도</option>
								<option <c:if test="${study.location=='광주광역시'}">selected </c:if>>광주광역시</option>
								<option <c:if test="${study.location=='전라남도'}">selected </c:if>>전라남도</option>
								<option <c:if test="${study.location=='제주특별자치도'}">selected </c:if>>제주특별자치도</option>
							</select><br><br> 
                        </div>
                        
                         <div class="form-group">
                            <label for="maxRcnt">인원</label>
                            <p class="input-info">스터디의 인원은 최소 2명, 최대 5명 입니다</p>
                            <select id="maxRcnt" name="maxRcnt" class="input-lg round form-control bg-dark-input" required aria-required="true">
								<option <c:if test="${study.maxRcnt==2}">selected </c:if>>2</option>
								<option <c:if test="${study.maxRcnt==3}">selected </c:if>>3</option>
								<option <c:if test="${study.maxRcnt==4}">selected </c:if>>4</option>
								<option <c:if test="${study.maxRcnt==5}">selected </c:if>>5</option>
							</select><br><br> 
                        </div>
                        
                        <div class="form-group">
                            <label for="lang">학습 언어<h6 id="viewLang"></h6></label>
                            <script src="${resources}/js/common/Languages.js"></script>

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
                            var lang1 = "${study.lang1}"
                            var lang2 = "${study.lang2}"
                            
                              var checkBox = "";
                              Language.forEach(item => {
                            	var checkId = 'btncheck' + (item.indexOf('.') !== -1) ? item.replace('.', '') : item;
                                checkBox += '<input type="checkbox" class="btn-check" id="'+checkId+'" name="ck_lang" onclick="count_ck(this);" value="' + item + '"'
                                if(lang1 == item || lang2 == item){
                                	checkBox += "checked"
                                }
                                checkBox += '><label class="btn btn-outline-primary" for="'+checkId+'">' + item + '</label>';
                              })
                              $("#languagesBox").append(checkBox);
                              
                              
                              checkBox = "";
                              FPL.forEach(item => {
                            	var checkId = 'btncheck' + (item.indexOf('.') !== -1) ? item.replace('.', '') : item;  
                                checkBox += '<input type="checkbox" class="btn-check" id="'+checkId+'" name="ck_lang" onclick="count_ck(this);" value="' + item + '"'
                                if(lang1 == item || lang2 == item){
                                	checkBox += "checked"
                                }
                                checkBox += '><label class="btn btn-outline-primary" for="'+checkId+'">' + item + '</label>';
                              })
                              $("#fplBox").append(checkBox);
                              
                              
                              checkBox = "";
                              versionControl.forEach(item => {
                            	var checkId = 'btncheck' + (item.indexOf('.') !== -1) ? item.replace('.', '') : item;	  
                                checkBox += '<input type="checkbox" class="btn-check" id="'+checkId+'" name="ck_lang" onclick="count_ck(this);" value="' + item + '"'
                                if(lang1 == item || lang2 == item){
                                	checkBox += "checked"
                                }
                                checkBox += '><label class="btn btn-outline-primary" for="'+checkId+'">' + item + '</label>';
                              })
                              $("#versionControlBox").append(checkBox);
                              
                              
                              checkBox = "";
                              Database.forEach(item => {
                            	var checkId = 'btncheck' + (item.indexOf('.') !== -1) ? item.replace('.', '') : item;	  
                                checkBox += '<input type="checkbox" class="btn-check" id="'+checkId+'" name="ck_lang" onclick="count_ck(this);" value="' + item + '"'
                                if(lang1 == item || lang2 == item){
                                	checkBox += "checked"
                                }
                                checkBox += '><label class="btn btn-outline-primary" for="'+checkId+'">' + item + '</label>';
                              })
                              $("#databaseBox").append(checkBox);
                              checkBox = "";
                            </script>
                            <script>
                              $("input[name=lang]").val('${study.lang1 }');
                              var ck_lang = '${study.lang1 }'.split(", ");
                              ck_lang.forEach(item => {
                                var checkId = 'btncheck' + (item.indexOf('.') !== -1) ? item.replace('.', '') : item;
                                $("#"+checkId).attr("checked", true);
                              })
                            </script>

                        </div>
                        <div class="form-group">
                            <label>난이도</label>
                            <div class="row">
                                <div class="col input-group">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">상</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" id="lv1" value="상" name="defficulty" ${study.defficulty eq '상' ? 'checked' : null} required>
                                    </div>
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">중</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" id="lv2" value="중" name="defficulty" ${study.defficulty eq '중' ? 'checked' : null} required>
                                    </div>

                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">하</span>
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" id="lv3" value="하" name="defficulty" ${study.defficulty eq '하' ? 'checked' : null} required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label for="recruitEdt">학습기간</label>
                            <input type="date" name="studySdt" id="studySdt" value="${study.studySdt }" class="input-lg round form-control bg-dark-input" required aria-required="true">
                            <input type="date" name="studyEdt" id="studyEdt" value="${study.studyEdt }" class="input-lg round form-control bg-dark-input" required aria-required="true">
                         </div>
                         
                        <div class="form-group">
                            <label for="subject">내용</label>
                            <input type="hidden" name="subject">
							<div id="editor"></div>
							<script src="${resources}/js/common/toastui-editor-all.min.js"></script>
                        </div>
                    </div>

                    <!-- Send Button -->
                    <div align="center">
                    <input type="hidden" name="studyNo" value="${study.studyNo }">
					<input type="submit" value="변경" class="btn btn-mod btn-glass btn-round btn-small">
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
/* 			alert("스터디 기술은 2개까지 선택가능합니다."); */
			swal("주의!", "스터디 기술은 2개까지 선택가능합니다.", "warning");

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
	    initialValue: '${study.subject }',
	    height: '500px',
	    initialEditType: 'wysiwyg',
	    theme: 'dark'
	  });
	
	  editorObject.getMarkdown();
	  
	  function inputSubject() {
		  $('#editor').prev().val(editorObject.getHTML());
		  
	  }
	 
	</script>
