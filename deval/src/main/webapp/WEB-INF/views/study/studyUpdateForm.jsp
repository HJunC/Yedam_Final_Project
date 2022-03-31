<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study/studyUpdateForm.jsp</title>
</head>
<body>
<div align="center">
		<h3>스터디 수정</h3>

		<form id="frm">
		<sec:csrfInput/>
			<!-- 스터디명 -->
			<input type="text" id="studyNm" name="studyNm" value="${study.stduyNm }" size="50" placeholder="스터디명을 입력해주세요">
			<br><br>

			<!-- 지역선택 -->
			<select class="input-md round form-control" id="location" name="location" value="${study.location }">
				<option <c:if test="${study.location=='One'}">selected </c:if>>One</option>
				<option <c:if test="${study.location=='Two'}">selected </c:if>>Two</option>
				<option <c:if test="${study.location=='Three'}">selected </c:if>>Three</option>
			</select><br><br>

			<!-- 인원 설정 -->
			<select class="input-md round form-control" id="maxRcnt" name="maxRcnt">
				<option <c:if test="${study.maxRcnt==1}">selected </c:if>>1</option>
				<option <c:if test="${study.maxRcnt==2}">selected </c:if>>2</option>
				<option <c:if test="${study.maxRcnt==3}">selected </c:if>>3</option>
				<option <c:if test="${study.maxRcnt==4}">selected </c:if>>4</option>
				<option <c:if test="${study.maxRcnt==5}">selected </c:if>>5</option>
			</select><br><br>

			<!-- 언어선택 -->
			<label class="checkbox-inline">
				<input type="checkbox" name="ck_lang" onclick="count_ck(this);" id="lang1" value="C" <c:if test="${study.lang1=='C' or study.lang2=='C'}">checked</c:if>>
				<span class="small">C</span>
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name="ck_lang" onclick="count_ck(this);" id="lang2" value="C++" <c:if test="${study.lang1=='C++' or study.lang2=='C++'}">checked</c:if>>
				<span class="small">C++</span>
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name="ck_lang" onclick="count_ck(this);" id="lang3" value="Java" <c:if test="${study.lang1=='Java' or study.lang2=='Java'}">checked</c:if>>
				<span class="small">Java</span>
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name="ck_lang" onclick="count_ck(this);" id="lang4" value="JavaScript" <c:if test="${study.lang1=='JavaScript' or study.lang2=='JavaScript'}">checked</c:if>>
				<span class="small">JavaScript</span>
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name="ck_lang" onclick="count_ck(this);" id="lang4" value="Python" <c:if test="${study.lang1=='Python' or study.lang2=='Python'}">checked</c:if>>
				<span class="small">Python</span>
			</label><br><br>

			<!-- 난이도선택 -->
			<label class="radio-inline">
				<input type="radio" name="defficulty" id="lv1" value="상" <c:if test="${study.defficulty=='상'}">checked </c:if>>
				<span class="small">상</span>
			</label>
			<label class="radio-inline">
				<input type="radio" name="defficulty" id="lv2" value="중" <c:if test="${study.defficulty=='중'}">checked </c:if>>
				<span class="small">중</span>
			</label>
			<label class="radio-inline">
				<input type="radio" name="defficulty" id="lv3" value="하" <c:if test="${study.defficulty=='하'}">checked </c:if>>
				<span class="small">하</span>
			</label><br><br>

			<!-- 시작일자 -->
			<input type="date" name="studySdt" id="studySdt" class="input-md round form-control" value="${study.studySdt }">

			<!--  종료일자 -->
			<input type="date" name="studyEdt" id="studyEdt" class="input-md round form-control" value="${study.studyEdt }">

			<!-- 내용 -->
			<textarea rows="20" cols="60" name="subject" id="subject" placeholder="내용을 입력하세요" value="${study.subject }"></textarea>
			<br>
			
			<!-- 버튼 -->
			<input type="button" id="btnStdAdd" name="btnStdAdd" value="등록" onclick="StdAdd()">
			<!-- <input type="button" id="btnStdEdit" name="btnStdEdit" value="변경" onclick="StdEdit()"> -->
			<input type="reset" value="취소">
		</form>
	</div>

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
		
	/* 	function ExceptionStd() {
			// 등록 및 변경 시 필수값을 입력하였는지 예외처리
			if(Checked($("input:checkbox[name=ck_lang]:checked"))){
				console.log("체크박스");
			}
		} */

		// 스터디 등록
		function StdAdd() {
			//ExceptionStd();
			console.log("Study Add Start");
			
			$.ajax({
				url : "insertStudy.do",
				type : "post",
				data : $("#frm").serialize(),
					/* 
				data : {
					"studyNm" : $("#title").val(),
					"lang1" : $('input:checkbox[name="ck_lang"]').val(),
					"location" : $("select[name='location']").val(),	
					"subject" :  $("#subject").val(),
					"maxRcnt" : $("select[name='selRcnt']").val() ,
					"defficulty" : $('input:radio[name="lv"]').val() ,
					"defficulty" : $('#lv1').is(':checked').val(),
					"studySdt" : $("#dtSdt").val(),
					"studyEdt" : $("#dtEdt").val(),
					"lang2" : $('input:checkbox[name="ck_lang"]').val()
				},*/
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
					//location.href="studyMain.do";
				}
			});
		}
		
		//스터디 수정
	/* 	function StdEdit() {
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
		} */
		
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
				alert("언어는 2개까지 선택가능합니다");
				obj.checked = false;
				return false;
			}
		}
		</script>
</body>
</html>