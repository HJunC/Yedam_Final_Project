<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />

<!-- Home Section -->
<section class="page-section bg-dark-alfa-50 bg-scroll" data-background="${resources}/images/project/brands-people-Ax8IA8GAjVg-unsplash.jpg" id="home">
    <div class="container relative">

        <div class="row">

            <div class="col-md-8">
                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                    <h1 class="hs-line-7 mb-20 mb-xs-10">
                        π<br>
                        νλ‘μ νΈ μμ±νκΈ°
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
                            <label for="projectName">νλ‘μ νΈ λͺ</label>
                            <p class="input-info">μ΅μ6μ, μ΅λ 40μ, κ³΅λ°±, νΉμλ¬Έμ λΆκ°λ₯</p>
                            <input type="text" name="projectName" id="projectName" class="input-lg round form-control bg-dark-input" placeholder="ex)κ°λ°μ μ»€λ?€λν° νλ‘μ νΈ" pattern=".{6,40}" required aria-required="true">
                        </div>

                        <div class="form-group">
                            <label>ν¬μ§μ μΈμ / μ΄ <span id="totalCount"></span>λͺ</label>
                            <p class="input-info">λ³ΈμΈμ ν¬μ§μμ μ²΄ν¬ ν λ³ΈμΈμ ν¬ν¨ν μΈμμλ₯Ό λ£μ΄μ£ΌμΈμ. μ΅λ 15λͺ</p>

                            <div class="row" id="positionCountBox">
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">νλ‘ νΈ</span>
                                    <input type="number" id="frontRcnt" name="frontRcnt" class="input-lg round form-control bg-dark-input" min="0" max="7" value="0" >
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="FE" name="leaderPosition" checked required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">λ°±μλ</span>
                                    <input type="number" id="backRcnt" name="backRcnt" class="input-lg round form-control bg-dark-input" min="0" max="7" value="0" >
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="BE" name="leaderPosition" required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">νμ€ν</span>
                                    <input type="number" id="fullRcnt" name="fullRcnt" class="input-lg round form-control bg-dark-input" min="0" max="7" value="0" >
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="FS" name="leaderPosition" required>
                                    </div>
                                </div>
                                <div class="col input-group me-3">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">λμμΈ</span>
                                    <input type="number" id="designRcnt" name="designRcnt" class="input-lg round form-control bg-dark-input" min="0" max="7" value="0" >
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="DE" name="leaderPosition" required>
                                    </div>
                                </div>
                                <div class="col input-group">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">κΈ°ν</span>
                                    <input type="number" id="plannerRcnt" name="plannerRcnt" class="input-lg round form-control bg-dark-input" min="0" max="7" value="0" >
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="PL" name="leaderPosition" required>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="projectTerm">νλ‘μ νΈ κΈ°κ°</label>
                            <p class="input-info">μ΅μ3μΌ, μ΅λ 365μΌ</p>
                            <input type="number" name="projectTerm" id="projectTerm" class="input-lg round form-control bg-dark-input" required aria-required="true" min="0" max="365" value="3">
                        </div>
                        <div class="form-group">
                            <label for="lang">μ¬μ© κΈ°μ <h6 id="viewLang"></h6></label>
                            <script src="${resources}/js/common/Languages.js"></script>

                            <div>
                                <dl class="toggle">

                                    <dt>
                                        <a href="" role="button" aria-expanded="false">μΈμ΄</a>
                                    </dt>
                                    <dd style="display: none;">
                                        <div class="tags" id="languagesBox"></div>
                                    </dd>

                                    <dt>
                                        <a href="" role="button" aria-expanded="false">νλ μμν¬</a>
                                    </dt>
                                    <dd style="display: none;">
                                        <div class="tags" id="fplBox"></div>
                                    </dd>

                                    <dt>
                                        <a href="" role="button" aria-expanded="false">λ²μ κ΄λ¦¬</a>
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
                            <label>μ§νλ°©μ</label>
                            <div class="row">
                                <div class="col input-group">
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">μ¨λΌμΈ</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="ON" name="process" checked required>
                                    </div>
                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">μ€νλΌμΈ</span>
                                    <div class="input-group-text bg-dark me-1" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="OFF" name="process" required>
                                    </div>

                                    <span class="input-group-text bg-dark" style="border-color: #5e646a;">μ¨/μ€νλΌμΈ</span>
                                    <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                        <input class="form-check-input mt-0" type="radio" value="ONOFF" name="process" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recruitEdt">νλ‘μ νΈ λͺ¨μ§ λ§κ°μΌ</label>
                            <p class="input-info">μ΅μ 1μΌ, μ΅λ 15μΌ</p>
                            <div class="form-group">
                                <input type="datetime-local" name="recruitEdt" id="recruitEdt" class="input-lg round form-control bg-dark-input" required aria-required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="subject">νλ‘μ νΈ μ€λͺ</label>

                            <div id="editor"></div>
                            <script src="${resources}/js/common/toastui-editor-all.min.js"></script>

                        </div>

                    </div>

                    <!-- Send Button -->
                    <div class="text-center pt-10">
                        <button type="button" class="submit_btn btn btn-mod btn-w btn-large btn-round" onclick="handleSubmit()">μμ±νκΈ°</button>
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
   * toast μλν° μ μ©
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
  recruitEdt.setAttribute("value", moment(today).format("YYYY-MM-DDTHH:MM"));
  recruitEdt.setAttribute("min", moment(today).format("YYYY-MM-DD") + "T00:00");
  recruitEdt.setAttribute("max", moment(today.setDate(today.getDate() + 14)).format("YYYY-MM-DD") + "T00:00"); // νλ‘μ νΈ λͺ¨μ§ μ΅λ λ§κ°μΌ

  $("input[name=langArray]").on("change", handleLangCheckbox);

  /**
   * κΈ°μ  μ²΄ν¬λ°μ€ κ΄λ ¨
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
   * μΈμμ μ²΄ν¬
   */
  function handlePositionCount(e) {
    var f = parseInt($("#frontRcnt").val());
    var b = parseInt($("#backRcnt").val());
    var u = parseInt($("#fullRcnt").val());
    var d = parseInt($("#designRcnt").val());
    var p = parseInt($("#plannerRcnt").val());
    var total = f+b+u+d+p;
    /*if (total > 15) {
      alert("μ΅λ μΈμμλ 15λͺμλλ€.");
      return;
    }*/
    $("#totalCount").html(total);
    $("#totalRcnt").val(total);
  }

  /**
   * νλ‘μ νΈ μμ± μμ²­
   */
  function handleSubmit() {
    var data = $("#insertForm").serializeObject();

    if (data.leaderId === "") {
      alert("error");
      return;
    }

    var regExp = /[!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\"\'\,\.\/\`\β©]/g;
    if (data.projectName === '') {
      alert("νλ‘μ νΈλͺμ μλ ₯ν΄μ£ΌμΈμ.");
      return;
    } else if (regExp.test(data.projectName)) {
      alert("νΉμλ¬Έμλ μλ ₯μ΄ λΆκ°λ₯ν©λλ€.");
      return;
    }

    if (data.totalRcnt == 0) {
      alert("μΈμμλ₯Ό μλ ₯ν΄μ£ΌμΈμ.");
      return;
    } else if (data.totalRcnt < 2) {
      alert("μ΅μ μΈμμλ 2λͺμλλ€.");
      return;
    } else if (data.totalRcnt > 15) {
      alert("μ΅λ μΈμμλ 15λͺμλλ€.");
      return;
    } else if (
      (data.leaderPosition === 'FE' && data.frontRcnt == 0)
      || (data.leaderPosition === 'BE' && data.backRcnt == 0)
      || (data.leaderPosition === 'FS' && data.fullRcnt == 0)
      || (data.leaderPosition === 'DE' && data.designRcnt == 0)
      || (data.leaderPosition === 'PL' && data.plannerRcnt == 0)
    ) {
      alert("μ νν ν¬μ§μμ +1μ ν΄μ£ΌμΈμ");
      return;
    }

    if (data.lang === '') {
      alert("μΈμ΄λ₯Ό μ νν΄μ£ΌμΈμ.");
      return;
    }

    if (data.projectTerm === '') {
      alert("κΈ°κ°μ μ νν΄μ£ΌμΈμ.");
      return;
    } else if (data.projectTerm < 3) {
      alert("μ΅μ κΈ°κ°μ 3μΌμλλ€.");
      return;
    } else if (data.projectTerm > 365) {
      alert("μ΅λ κΈ°κ°μ 365μΌμλλ€.");
      return;
    }

    delete data.langArray;
    data.recruitEdt = data.recruitEdt.replace("T", " ") + ":00";
    data.subject = editorObject.getHTML();

    if (data.subject === '<p><br></p>') {
      alert("λ΄μ©μ μλ ₯ν΄μ£ΌμΈμ.");
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
          alert("λ±λ‘μλ£νμμ΅λλ€.");
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
