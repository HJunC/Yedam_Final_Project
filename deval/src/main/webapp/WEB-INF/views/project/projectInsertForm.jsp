<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
                        👀<br>
                        팀 프로젝트 생성하기
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

                <form class="form contact-form" id="insertForm">
                    <sec:csrfInput />
                    <input type="hidden" name="leaderId" value="<sec:authentication property="principal.username"/>">
                    <input type="hidden" id="totalRcnt" name="totalRcnt" value="0" min="0" max="15">
                    <div class="clearfix">

                        <div class="form-group">
                            <label for="projectName">프로젝트 명</label>
                            <p class="input-info">최소6자, 최대 40자, 공백, 특수문자 불가능</p>
                            <input type="text" name="projectName" id="projectName" class="input-lg round form-control bg-dark-input" placeholder="ex)개발자 커뮤니티 프로젝트" pattern=".{6,40}" required aria-required="true">
                        </div>

                        <div class="form-group">
                            <label>포지션 인원 / 총 <span id="totalCount"></span>명</label>
                            <p class="input-info">본인의 포지션을 체크 후 본인을 포함한 인원수를 넣어주세요. 최대 15명</p>

                            <div class="row" id="positionCountBox">
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">프론트</span>
                                    <input type="number" id="frontRcnt" name="frontRcnt" class="input-lg round form-control bg-dark-input" min="0" max="7" value="0" >
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="FE" name="leaderPosition" checked required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">백엔드</span>
                                    <input type="number" id="backRcnt" name="backRcnt" class="input-lg round form-control bg-dark-input" min="0" max="7" value="0" >
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="BE" name="leaderPosition" required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">풀스택</span>
                                    <input type="number" id="fullRcnt" name="fullRcnt" class="input-lg round form-control bg-dark-input" min="0" max="7" value="0" >
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="FS" name="leaderPosition" required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">디자인</span>
                                    <input type="number" id="designRcnt" name="designRcnt" class="input-lg round form-control bg-dark-input" min="0" max="7" value="0" >
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="DE" name="leaderPosition" required>
                                    </div>
                                </div>
                                <div class="col input-group">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">기획</span>
                                    <input type="number" id="plannerRcnt" name="plannerRcnt" class="input-lg round form-control bg-dark-input" min="0" max="7" value="0" >
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="PL" name="leaderPosition" required>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="projectTerm">프로젝트 기간</label>
                            <p class="input-info">최소3일, 최대 365일</p>
                            <input type="number" name="projectTerm" id="projectTerm" class="input-lg round form-control bg-dark-input" required aria-required="true" min="0" max="365" value="3">
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
                                checkBox += '<input type="checkbox" class="btn-check" id="btncheck'+item+'" name="langArray" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="btncheck'+item+'">' + item + '</label>';
                              })
                              $("#languagesBox").append(checkBox);
                              checkBox = "";
                              FPL.forEach(item => {
                                checkBox += '<input type="checkbox" class="btn-check" id="btncheck'+item+'" name="langArray" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="btncheck'+item+'">' + item + '</label>';
                              })
                              $("#fplBox").append(checkBox);
                              checkBox = "";
                              versionControl.forEach(item => {
                                checkBox += '<input type="checkbox" class="btn-check" id="btncheck'+item+'" name="langArray" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="btncheck'+item+'">' + item + '</label>';
                              })
                              $("#versionControlBox").append(checkBox);
                              checkBox = "";
                              Database.forEach(item => {
                                checkBox += '<input type="checkbox" class="btn-check" id="btncheck'+item+'" name="langArray" value="' + item + '">';
                                checkBox += '<label class="btn btn-outline-primary" for="btncheck'+item+'">' + item + '</label>';
                              })
                              $("#databaseBox").append(checkBox);
                              checkBox = "";
                            </script>

                        </div>
                        <div class="form-group">
                            <label>진행방식</label>
                            <div class="row">
                                <div class="col input-group">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">온라인</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="ON" name="process" checked required>
                                    </div>
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">오프라인</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="OFF" name="process" required>
                                    </div>

                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">온/오프라인</span>
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="ONOFF" name="process" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recruitEdt">프로젝트 모집 마감일</label>
                            <p class="input-info">최소 1일, 최대 15일</p>
                            <div class="form-group">
                                <input type="datetime-local" name="recruitEdt" id="recruitEdt" class="input-lg round form-control bg-dark-input" required aria-required="true">
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
                        <button type="button" class="submit_btn btn btn-mod btn-w btn-large btn-round" onclick="handleSubmit()">생성하기</button>
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
    initialEditType: 'wysiwyg',
    theme: 'dark'
  });

  editorObject.getMarkdown();

  var today = new Date();
  today.setDate(today.getDate() + 1);
  const recruitEdt = document.getElementById("recruitEdt");
  recruitEdt.setAttribute("value", moment(today).format("YYYY-MM-DD") + "");
  recruitEdt.setAttribute("min", moment(today).format("YYYY-MM-DD"));
  recruitEdt.setAttribute("max", moment(today.setDate(today.getDate() + 14)).format("YYYY-MM-DD")); // 프로젝트 모집 최대 마감일

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
   * 인원수 체크
   */
  function handlePositionCount(e) {
    var f = parseInt($("#frontRcnt").val());
    var b = parseInt($("#backRcnt").val());
    var u = parseInt($("#fullRcnt").val());
    var d = parseInt($("#designRcnt").val());
    var p = parseInt($("#plannerRcnt").val());
    var total = f+b+u+d+p;
    /*if (total > 15) {
      alert("최대 인원수는 15명입니다.");
      return;
    }*/
    $("#totalCount").html(total);
    $("#totalRcnt").val(total);
  }

  /**
   * 프로젝트 생성 요청
   */
  function handleSubmit() {
    var data = $("#insertForm").serializeObject();

    if (data.leaderId === "") {
      alert("error");
      return;
    }

    var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
    if (data.projectName === '') {
      alert("프로젝트명을 입력해주세요.");
      return;
    } else if (regExp.test(data.projectName)) {
      alert("특수문자는 입력이 불가능합니다.");
      return;
    }

    if (data.totalRcnt == 0) {
      alert("인원수를 입력해주세요.");
      return;
    } else if (data.totalRcnt < 2) {
      alert("최소 인원수는 2명입니다.");
      return;
    } else if (data.totalRcnt > 15) {
      alert("최대 인원수는 15명입니다.");
      return;
    } else if (
      (data.leaderPosition === 'FE' && data.frontRcnt == 0)
      || (data.leaderPosition === 'BE' && data.backRcnt == 0)
      || (data.leaderPosition === 'FS' && data.fullRcnt == 0)
      || (data.leaderPosition === 'DE' && data.designRcnt == 0)
      || (data.leaderPosition === 'PL' && data.plannerRcnt == 0)
    ) {
      alert("선택한 포지션에 +1을 해주세요");
      return;
    }

    if (data.lang === '') {
      alert("언어를 선택해주세요.");
      return;
    }

    if (data.projectTerm === '') {
      alert("기간을 선택해주세요.");
      return;
    } else if (data.projectTerm < 3) {
      alert("최소 기간은 3일입니다.");
      return;
    } else if (data.projectTerm > 365) {
      alert("최대 기간은 365일입니다.");
      return;
    }

    delete data.langArray;
    data.recruitEdt = data.recruitEdt.replace("T", " ") + ":00";
    data.subject = editorObject.getHTML();

    if (data.subject === '<p><br></p>') {
      alert("내용을 입력해주세요.");
      return;
    }

    $.ajax({
      type: "POST",
      url: "../api/project/insert",
      data: data,
      dataType: "json",
      success: function(res) {
        if (res.result === "success") {
          console.log(res);
          alert("등록완료하였습니다.");
          location.href = "main.do";
        } else {
          console.log(res);
          alert(res.message);
        }
      },
      error: function(res) {
        console.log(res);
        alert(res.message)
      }
    })

  }
</script>
