<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>

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

<style>
    .input-info {
        font-size: 14px;
        color: #c0c0c0;
    }
</style>
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
                            <p class="input-info">본인을 포함한 인원수를 넣어주세요. 최대 15명</p>

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
                                <div class="tags" id="languagesBox"><p class="input-info mb-1">언어</p></div>
                                <div class="tags" id="fplBox"><p class="input-info mb-1">프레임워크</p></div>
                                <div class="tags" id="versionControlBox"><p class="input-info mb-1">버전관리</p></div>
                                <div class="tags" id="databaseBox"><p class="input-info mb-1">DB</p></div>
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
                            <p class="input-info">1일 ~ 15일</p>
                            <input type="date" name="recruitEdt" id="recruitEdt" class="input-lg round form-control bg-dark-input" required aria-required="true">
                            <input type="time" id="recruitEdtTime" class="input-lg round form-control bg-dark-input" value="00:00" required aria-required="true">
                        </div>
                        <div class="form-group">
                            <label for="subject">프로젝트 설명</label>
                            <textarea name="subject" id="subject" class="input-lg round form-control bg-dark-input" required aria-required="true"></textarea>
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
  var today = new Date();
  const recruitEdt = document.getElementById("recruitEdt");
  recruitEdt.setAttribute("value", moment(today).format("YYYY-MM-DD"));
  recruitEdt.setAttribute("min", moment(today).format("YYYY-MM-DD"));
  recruitEdt.setAttribute("max", moment(today.setDate(today.getDate() + 15)).format("YYYY-MM-DD")); // 프로젝트 모집 최대 마감일

  $("input[name=langArray]").on("change", handleLangCheckbox);

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

  function handleSubmit() {
    var data = $("#insertForm").serializeObject();
    var isDone = true;

    if (data.leaderId === "") {
      alert("error");
      isDone = false;
    }

    if (data.totalRcnt === 0) {
      alert("인원수를 입력해주세요");
      isDone = false;
    }
    delete data.langArray;
    data.recruitEdt = data.recruitEdt + " " + $("#recruitEdtTime").val() + ":00";

    if (isDone) {
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
  }

</script>