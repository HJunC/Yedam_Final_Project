<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-03-25
  Time: 오전 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />

<html>
<body>
	<div align="center">
		<h3>스터디 등록</h3>

		<form id="frm">

		<input type="text" id="title" name="title" value="" size="50"
			placeholder="스터디명을 입력해주세요"> <br> <br>

		<!-- 지역선택 -->
		<select class="input-md round form-control" id="selArea"
			name="selArea">
			<option>One</option>
			<option>Two</option>
			<option>Three</option>
		</select><br>
		<br>
		</select><br><br>


		<!-- 인원 설정 -->
		<select class="input-md round form-control" id="selRcnt"
			name="selRcnt">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select><br>
		<br>

		<!-- 언어선택 -->
		<label class="checkbox-inline"> <input type="checkbox"
			name="ck_lang" id="lang1" value="C"> <span class="small">C</span>
		</label> <label class="checkbox-inline"> <input type="checkbox"
			name="ck_lang" id="lang2" value="C++"><span class="small">C++</span>
		</label> <label class="checkbox-inline"> <input type="checkbox"
			name="ck_lang" id="lang3" value="Java"><span class="small">Java</span>
		</label> <label class="checkbox-inline"> <input type="checkbox"
			name="ck_lang" id="lang4" value="JavaScript"><span
			class="small">JavaScript</span>

		</select><br><br>

	

		<!-- 난이도선택 -->
		<label class="radio-inline"> <input type="radio" name="lv"
			id="lv1" value="상"> <span class="small">상</span>
		</label> <label class="radio-inline"> <input type="radio" name="lv"
			id="lv2" value="중"> <span class="small">중</span>
		</label> <label class="radio-inline"> <input type="radio" name="lv"
			id="lv3" value="하"> <span class="small">하</span>
		</label> <br>

		<!-- 시작일자 -->
		<input type="date" name="dtSdt" id="dtSdt"
			class="input-md round form-control">

		<!--  종료일자 -->
		<input type="date" name="dtEdt" id="dtEdt"
			class="input-md round form-control">

		<textarea rows="20" cols="60" name="subject" id="subject"
			placeholder="내용을 입력하세요"></textarea>
		<br> <input type="button" id="btnStdAdd" name="btnStdAdd"
			value="등록" onclick="StdAdd()"> <input type="button"
			id="btnStdEdit" name="btnStdEdit" value="변경" onclick="StdEdit()">
		<input type="reset" value="취소">
</form>
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="${resources}/js/study/common.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			console.log("Study Start");
			
			$('#dtSdt').val(new Date().toISOString().substring(0, 10));
			
			var dt = new Date();
			dt.setDate(dt.getDate()+14);
			$('#dtEdt').val(dt.toISOString().substring(0, 10));
		});
		
		Date.prototype.getInterval = function (otherDate) {
		    var interval;
		 
		    if(this > otherDate)
		        interval = this.getTime() - otherDate.getTime();
		    else
		        interval = otherDate.getTime() - this.getTime();
		 
		    return Math.floor(interval / (1000*60*60*24));
		}
		
		function ExceptionStd() {
			// 등록 및 변경 시 필수값을 입력하였는지 예외처리
			
			if(Checked($("input:checkbox[name=ck_lang]:checked"))){
				console.log("체크박스");
			}
		}

		function StdAdd() {
			//ExceptionStd();
			console.log("Study Add Start");
			
			$.ajax({
				url : "insertStudy.do",
				type : "post",
				data : $("#frm").serialize(),
					/* {
					"studyNm" : $("#title").val(),
					"lang1" : $('input:checkbox[name="ck_lang"]').val(),
					"lang1" : $('input:checkbox[name="ck_lang"]').is(":checked").val(),
				data : {
					"studyNm" : $("#title").val(),
					"lang1" : $('input:checkbox[name="ck_lang"]').val(),
					"location" : $("select[name='selArea']").val(),	
					"subject" :  $("#subject").val(),
					"maxRcnt" : $("select[name='selRcnt']").val() ,
					"defficulty" : $('input:radio[name="lv"]').val() ,
					"defficulty" : $('#lv1').is(':checked').val(),
					"studySdt" : $("#dtSdt").val(),
					"studyEdt" : $("#dtEdt").val(),
					"lang2" : $('input:checkbox[name="ck_lang"]').val()
				} */
					"studySdt" : $("#dtSdt").val(),
					"studyEdt" : $("#dtEdt").val(),
					"lang2" : $('input:checkbox[name="ck_lang"]').val()
				},
				dataType : "text",
				success : function(result) {
					console.log("succ", result);
					if (result != "0") {
						alert("등록되었습니다.");
						location.href="studyMain.do";
					}
				},
				error : function(err) {
					console.log("err", err);
					location.href="studyMain.do";
				}
			});
		}

		function StdEdit() {
			$.ajax({
				url : "editStudy.do",
				type : "post",
				data : {
					"key" : $("#key").val(),
					"val" : $("#val").val()
				},
				dataType : "text",
				success : function(result) {
					if (result > 0) {
						console.log(result);
					}
				},
				error : function(err) {
					console.log(err);
				}
			});
		}
	</script>
</html>