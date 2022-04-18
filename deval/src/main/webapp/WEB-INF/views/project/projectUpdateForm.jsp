<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />

<!-- Home Section -->
<section class="page-section bg-dark-alfa-50 bg-scroll" data-background="${resources}/images/full-width-images/section-bg-11.jpg" id="home">
    <div class="container relative">

        <div class="row">

            <div class="col-md-8">
                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                    <h1 class="hs-line-7 mb-20 mb-xs-10">
                        ✂<br>
                        프로젝트 수정
                    </h1>
                </div>
                <div class="wow fadeInUpShort" data-wow-delay=".2s"></div>
            </div>

        </div>

    </div>
</section>
<!-- End Home Section -->

<!-- Section -->
<section class="page-section bg-dark light-content">
    <div class="container">

        <!-- Login Form -->
        <div class="row">
            <div>

                <form class="form contact-form" id="updateForm">
                    <sec:csrfInput />
                    <input type="hidden" name="leaderId" value="<sec:authentication property="principal.username"/>">
                    <input type="hidden" id="totalRcnt" name="totalRcnt" value="0" min="0" max="15">
                    <input type="hidden" id="projectNo" name="projectNo" value="${userProject.projectNo}">
                    <div class="clearfix">

                        <div class="form-group">
                            <label for="projectName">프로젝트 명</label>
                            <p class="input-info">최소6자, 최대 40자, 공백, 특수문자 불가능</p>
                            <input type="text" name="projectName" id="projectName" class="input-lg round form-control bg-dark-input" placeholder="ex)개발자 커뮤니티 프로젝트" pattern=".{6,40}" required aria-required="true" value="${userProject.projectName}">
                        </div>

                        <div class="form-group">
                            <label for="projectTerm">프로젝트 기간</label>
                            <p class="input-info">최소3일, 최대 365일</p>
                            <input type="number" name="projectTerm" id="projectTerm" class="input-lg round form-control bg-dark-input" required aria-required="true" min="0" max="365" value="${userProject.projectTerm}">
                        </div>
                        <div class="form-group">
                            <label for="lang">사용 기술<h6 id="viewLang"></h6></label>
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
                              var checkBox = "";
                              Language.forEach(item => {
                                var checkId = 'btncheck' + (item.indexOf('.') !== -1) ? item.replace('.', '') : item;
                                checkBox += '<input type="checkbox" class="btn-check" id="'+checkId+'" name="langArray" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="'+checkId+'">' + item + '</label>';
                              })
                              $("#languagesBox").append(checkBox);
                              checkBox = "";
                              FPL.forEach(item => {
                                var checkId = 'btncheck' + (item.indexOf('.') !== -1) ? item.replace('.', '') : item;
                                checkBox += '<input type="checkbox" class="btn-check" id="'+checkId+'" name="langArray" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="'+checkId+'">' + item + '</label>';
                              })
                              $("#fplBox").append(checkBox);
                              checkBox = "";
                              versionControl.forEach(item => {
                                var checkId = 'btncheck' + (item.indexOf('.') !== -1) ? item.replace('.', '') : item;
                                checkBox += '<input type="checkbox" class="btn-check" id="'+checkId+'" name="langArray" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="'+checkId+'">' + item + '</label>';
                              })
                              $("#versionControlBox").append(checkBox);
                              checkBox = "";
                              Database.forEach(item => {
                                var checkId = 'btncheck' + (item.indexOf('.') !== -1) ? item.replace('.', '') : item;
                                checkBox += '<input type="checkbox" class="btn-check" id="'+checkId+'" name="langArray" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="'+checkId+'">' + item + '</label>';
                              })
                              $("#databaseBox").append(checkBox);
                              checkBox = "";
                            </script>
                            <script>
                              $("#viewLang").html('${userProject.lang }');
                              $("input[name=lang]").val('${userProject.lang }');
                              var langArr = '${userProject.lang }'.split(", ");
                              langArr.forEach(item => {
                                var checkId = 'btncheck' + (item.indexOf('.') !== -1) ? item.replace('.', '') : item;
                                $("#"+checkId).attr("checked", true);
                              })
                            </script>
                        </div>
                        <div class="form-group">
                            <label>진행방식</label>
                            <div class="row">
                                <div class="col input-group">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">온라인</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="ON" name="process" ${userProject.process eq 'ON' ? 'checked' : null} required>
                                    </div>
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">오프라인</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="OFF" name="process" ${userProject.process eq 'OFF' ? 'checked' : null} required>
                                    </div>

                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">온/오프라인</span>
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="ONOFF" name="process" ${userProject.process eq 'ONOFF' ? 'checked' : null} required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recruitEdt">프로젝트 모집 마감일</label>
                            <p class="input-info">최소 1일, 최대 15일</p>
                            <div class="form-group">
                                <input type="date" name="recruitEdt" id="recruitEdt" class="input-lg round form-control bg-dark-input" required aria-required="true" value="<fmt:formatDate value="${userProject.recruitEdt}" pattern="yyyy-MM-dd"/>">
                                <input type="time" id="recruitEdtTime" class="input-lg round form-control bg-dark-input" required aria-required="true" value="<fmt:formatDate value="${userProject.recruitEdt}" pattern="HH:mm:ss"/>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="subject">프로젝트 설명</label>

                            <div id="editor"></div>
                            <script src="${resources}/js/common/toastui-editor-all.min.js"></script>

                        </div>

                    </div>

                    <!-- Send Button -->
                    <div class="text-center pt-10">
                        <button type="button" class="submit_btn btn btn-mod btn-w btn-large btn-round" onclick="handleSubmit()">수정하기</button>
                    </div>

                </form>

            </div>
        </div>
        <!-- End Login Form -->

    </div>
</section>
<!-- End Section -->

<script src="${resources}/js/moment.min.js"></script>
<script>
  /**
   * toast 에디터 적용
   */
  const { Editor } = toastui;

  const editorObject = new Editor({
    el: document.querySelector('#editor'),
    previewStyle: 'vertical',
    height: '500px',
    initialValue: '${userProject.subject}',
    initialEditType: 'wysiwyg',
    theme: 'dark'
  });

  editorObject.getMarkdown();

  var today = new Date();
  const recruitEdt = document.getElementById("recruitEdt");
  recruitEdt.setAttribute("min", moment(today).format("YYYY-MM-DD"));
  recruitEdt.setAttribute("max", moment(today.setDate(today.getDate() + 15)).format("YYYY-MM-DD")); // 프로젝트 모집 최대 마감일

  $("input[name=langArray]").on("change", handleLangCheckbox);

  /**
   * 기술 체크박스 관련
   */
  function handleLangCheckbox() {
    var lang = "";
    var list = $("input[name=langArray]:checked");
    for(var i = 0; i < list.length; i++) {
      if(i + 1 !== list.length) {
        lang += list[i].value + ", ";
      } else {
        lang += list[i].value;
      }
    }
    $("#viewLang").html(lang);
    $("input[name=lang]").val(lang);
  }


  document.getElementById("positionCountBox").addEventListener("change", handlePositionCount);

  /**
   * 프로젝트 생성 요청
   */
  function handleSubmit() {
    var data = $("#updateForm").serializeObject();
    var isDone = true;

    if (data.leaderId === "") {
      alert("error");
      isDone = false;
    }
    delete data.langArray;
    data.recruitEdt = data.recruitEdt + " " + $("#recruitEdtTime").val() + ":00";
    data.subject = editorObject.getHTML();

    if (isDone) {
        $.ajax({
          type: "POST",
          url: "../api/project/update",
          data: data,
          dataType: "json",
          success: function(res) {
              console.log(res);
              alert("수정완료되었습니다.");
              location.href = "projectDetail.do?no=${userProject.projectNo}";
          },
          error: function(res) {
            console.log(res);
            alert(res.message)
          }
        })
    }
  }
</script>
