<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study/studyUpdateForm.jsp</title>
</head>
<body>
	<div align="center">
		<form action="editStudy.do" method="post">
			<h3>스터디 수정</h3>

			<!-- 스터디명 -->
			<input type="text" id="studyNm" name="studyNm"
				value="${study.studyNm }" size="50" placeholder="스터디명을 입력해주세요">
			<br>
			<br>

			<!-- 지역선택 -->
			<select class="input-md round form-control" id="location" name="location">
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
			</select><br>
			<br>

			<!-- 인원 설정 -->
			<select class="input-md round form-control" id="maxRcnt"
				name="maxRcnt">
				<option <c:if test="${study.maxRcnt==1}">selected </c:if>>1</option>
				<option <c:if test="${study.maxRcnt==2}">selected </c:if>>2</option>
				<option <c:if test="${study.maxRcnt==3}">selected </c:if>>3</option>
				<option <c:if test="${study.maxRcnt==4}">selected </c:if>>4</option>
				<option <c:if test="${study.maxRcnt==5}">selected </c:if>>5</option>
			</select><br>
			<br>

			<!-- 언어선택 -->
			<div id="langSelect"></div>
			
			<!-- 난이도선택 -->
			<label class="radio-inline"> <input type="radio"
				name="defficulty" id="lv1" value="상"
				<c:if test="${study.defficulty=='상'}">checked </c:if>> <span
				class="small">상</span>
			</label> <label class="radio-inline"> <input type="radio"
				name="defficulty" id="lv2" value="중"
				<c:if test="${study.defficulty=='중'}">checked </c:if>> <span
				class="small">중</span>
			</label> <label class="radio-inline"> <input type="radio"
				name="defficulty" id="lv3" value="하"
				<c:if test="${study.defficulty=='하'}">checked </c:if>> <span
				class="small">하</span>
			</label><br>
			<br>

			<!-- 시작일자 -->
			<input type="date" name="studySdt" id="studySdt"
				class="input-md round form-control" value="${study.studySdt }">

			<!--  종료일자 -->
			<input type="date" name="studyEdt" id="studyEdt"
				class="input-md round form-control" value="${study.studyEdt }">

			<!-- 내용 -->
			<textarea rows="20" cols="60" name="subject" id="subject"
				placeholder="내용을 입력하세요">${study.subject }</textarea>
			<br>

			<!-- 버튼 -->

			<!-- <input type="button" id="btnStdEdit" name="btnStdEdit" value="변경" onclick="StdEdit()"> -->
			<input type="submit" value="변경"> <input type="reset"
				value="취소"> <input type="hidden" name="studyNo"
				value="${study.studyNo }">
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
		
		
		<!-- 언어 체크박스Languages.js 언어 전체 불러오기 -->
		<script src="${resources}/js/common/Languages.js"></script>
		<script type="text/javascript">
		var lang1 = '${study.lang1}';
		var lang2 = '${study.lang2}';
		
		Language.forEach((item, index) => {
			console.log(item);
			var str =
					'<label class="checkbox-inline">'+
					'<input type="checkbox" name="ck_lang" onclick="count_ck(this);" id="lang"' + index + ' value="' + item;
					if(lang1 == item || lang2 == item){
						str += '" checked="checked">';
					}
				str += '<span class="small">' + item + '</span>'+
					'</label><br><br>';
			$("#langSelect").append(str);
		})
	</script>
</body>
</html>