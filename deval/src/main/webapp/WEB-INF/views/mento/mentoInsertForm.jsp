<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mentoInsertForm</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${resources }/css/custom/team-project-style.css">
<body>
	<section class="page-section bg-dark light-content">
        <div class="container relative">
            <!-- 멘토등록 글-->
            <div class="text-center mb-80 mb-sm-50">
                <h2 class="section-title">멘토등록!!</h2>
            </div>
            <!-- 값이 들어가는 곳-->
            <!-- mentoInsert Form tag-->
            <form action="mentoInsert.do" id="frm" method="post" enctype="multipart/form-data">
            <sec:csrfInput/>
                <div class="row">
                    <!-- 사진 미리보기 div-->
                    <div id="image_container">
                        <img id="prev" src="${resources }/images/mento/prev.bmp">
                    </div>
                    <!-- 사진 파일등록-->
                    <div class="mb-20 mb-md-10">
                        <label for="exampleInputFile">
                            사진을 등록해주세요.
                        </label>
                        <div>
                        <input type="file" id="photo" name="file"
                            onchange="setThumbnail(event)"  accept="image/*">
                       </div>
                    </div>
                    <!-- 자기소개글-->
                    <div class="mb-20 mb-md-10">
                        <textarea name="text" id="info" name="info" class="input-md round form-control" rows="6" placeholder="자기소개글을 써주세요." maxlength="400" style="width: 400px"></textarea>
                    </div>
                </div>
                
                <div class="row">
                <div class="col-sm-4 mb-40">
                    프로그래밍언어를 골라주세요.
                    <select class="input-md round form-control" style="width: 170px;" id="lang" name="lang">
                        <option value="C">C</option>
                        <option value="C++">C++</option>
                        <option value="Java">Java</option>
                        <option value="Python">Python</option>
                        <option value="C#">C#</option>
                        <option value="Visual Basic">Visual Basic</option>
                        <option value="JavaScript">JavaScript</option>
                        <option value="PHP">"PHP"</option>
                        <option value="SQL">SQL</option>
                        <option value="R">R</option>
                        <option value="Ruby">Ruby</option>
                        <option value="Assembly language">Assembly language</option>
                        <option value="Go">Go</option>
                    </select>
                </div>
                <div class="col-sm-4 mb-40">
                    경력이 어떻게 되십니까
                    <select class="input-md round form-control" style="width: 170px;" id="history" name="history">
                        <option value="2년이상">2년이상</option>
                        <option value="3년이상">3년이상</option>
                        <option value="5년이상">5년이상</option>
                        <option value="7년이상">7년이상</option>
                        <option value="10년이상">10년이상</option>
                    </select>
                </div>
                <div class="col-sm-4 mb-40">
                    기간설정<br>
                    <input type="radio" name="choiceRadio" class="radio-value" id="dayDate">
                    일별로 정하기
                    <select class="input-md round form-control" style="width: 170px;" id="termDay" name="termDay">
                        <c:forEach var="i" begin="1" end="13">
	                        <option value="${i}일">${i}일</option>
                        </c:forEach>
                    </select>
                    <input type="radio" name="choiceRadio" class="radio-value" id="dayWeek">
                    주별로 정하기
                    <select class="input-md round form-control" style="width: 170px;" id="termWeek" name="termWeek">
                        <c:forEach var="i" begin="2" end="7">
	                        <option value="${i}주">${i}주</option>
                        </c:forEach>
                    </select>
                   	<input type="radio" name="choiceRadio" class="radio-value" id="dayMonth">
                   	달별로 정하기
                   	<select class="input-md round form-control" style="width: 170px;" id="termMonth" name="termMonth">
                        <c:forEach var="i" begin="2" end="6">
	                        <option value="${i}달">${i}달</option>
                        </c:forEach>
                    </select>
                    <!-- 모달창 띄우기 -->
                       	<!-- <a href="#test-modal" class="btn btn-mod btn-w btn-medium round mt-10 lightbox-gallery-5 mfp-inline" onclick="insertButton()">기간정하기</a>
                                <div id="test-modal" class="mfp-hide">
                                    <p>
                                        선택하신 기간이 확실합니까?
                                    </p>
                                    <div class="col-sm-6 col-md-3 col-lg-3 mb-40">
                                    <div class="mb-10">
				                        <button type="button" class="btn btn-mod btn-w btn-round btn-small"  onclick="changeTerm()" id="modalSelect">예</button>
				                        <button type="button" class="btn btn-mod btn-w btn-round btn-small" style="color:red" onclick="closeModal()">취소</button>
                                	</div>
                                	</div>
                                </div> -->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 mb-40">
                    1시간이용금액
                    <!-- Name -->
                    <input type="number" name="price" id="price" class="input-md round form-control" placeholder="숫자만 입력해주세요" maxlength="100" style="width: 250px;">
                </div>
                <div class="col-sm-4 mb-40">
                    시작시간
                    <select class="input-md round form-control" style="width: 170px;" id="serviceStt" name="serviceStt" onchange="endTime(this)">
                    	<c:forEach var="i" begin="0" end="9">
                        <option value="${i}">0${i}:00</option>
                        </c:forEach>
                        <c:forEach var="i" begin="10" end="23">
                        <option value="${i}">${i}:00</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-4 mb-40">
                    종료시간
                    <select class="input-md round form-control" style="width: 170px;" id="serviceEdt" name="serviceEdt">
                        <option value="01:00">01:00</option>
                    </select>
                </div>
            </div>
            <input type="button" id="btn" class="btn btn-mod btn-w btn-round btn-large" value="등록" onclick="mentoInsert()">
                
            </form>

        </div>
        
    </section>
    <script>
        function setThumbnail(event){
		//파일체크 부분
        var pathPoint = photo.value.lastIndexOf('.');
		var filePoint = photo.value.substring(pathPoint+1,event.length);
		var type = filePoint.toLowerCase();
		if(type=='jpg' || type=='jpg' || type=='bmp' || type=='png' || type=="jpeg") {
			// 썸네일 부분
			var reader = new FileReader();
			
			reader.onload = function(event){
				var img = document.getElementById("prev");
				img.setAttribute("src", event.target.result);
	            img.style.cssText += 'border-radius : 70%;object-fit : cover';
				document.querySelector("div#image_container").appendChild(img);
			};
			
			reader.readAsDataURL(event.target.files[0]);
		}else {
			alert('이미지 파일만 선택할 수 있습니다.');
			var parent = photo.parentNode;
			photo.value = "";
			photo.select();
			var node = parent.replaceChild(photo.cloneNode(true),photo);
			return false;
		}
		
	}
        // --- 값 컨트롤러로 넘겨주기
        function mentoInsert() {
        	var lang = $('#lang').val();
         	<c:forEach items="${mentos}" var="mento">
         	if(lang == '${mento.lang}') {
        		alert('이미 등록된 언어입니다.');
        		return
        	}
        	</c:forEach>
        	var start = frm.serviceStt.value;
        	var end = frm.serviceEdt.value;
        	var photo = $('#photo').val();
        	var price = $('#price').val();
        /* 	var day = $('#dayDate').val();
        	var week = $('#dayWeek').val();
        	var month = $('#dayMont').val(); */
        	if(photo == '') {
        		photo = '${resources}/images/mento/prev.bmp';
        	} 
        	if(price == '') {
        		alert('가격을 정해주세요!!');
        		return;
        	}
        	if(check == false) {
        		alert('기간을 정해주세요!');
        		return;
        	}
        	//시작시관 종료시간 막아주기
        	if(start == end) {
        		alert('시작시간과 종료시간이 같습니다')
        		frm.serviceStt.focus();
        		return;
        	}
        	frm.submit();
        }
        // 종료시간 미니멈 set
        function endTime(target) {
        	// 클릭한 값들고오기
        	var targetTime = target.value;
        	
        	var sTime = targetTime.substr(0,2);
        	var startTime = parseInt(sTime);
        	var timeGap = 24 - startTime;
        	var selectId = document.getElementById('serviceEdt');
        	// 시작시간 다시 클릭했을떄 새로 만들기
        	$('#serviceEdt').empty();
        	//종료시간 만들기
        	for(var i = startTime+1; i<=24; i++) {
	        	var option = document.createElement('option');
        		if(i < 10) {
        			option.value = i;
        			option.innerText = '0' + i + ':00';
        		}else if(i > 9) {
        			option.value = i;
        			option.innerText = i + ':00';
        		}
	        		selectId.appendChild(option);
        	}
        }
        //radio button 이용 term 값 변경하기
        var check = $('input:radio[name=choiceRadio]').is(':checked');
       function changeTerm() {
        	var dayDate = document.getElementById('dayDate');
        	var dayWeek = document.getElementById('dayWeek');
        	var dayMonth = document.getElementById('dayMonth');
        	
        	var termDay = document.getElementById('termDay');
        	var termWeek = document.getElementById('termWeek');
        	var termMonth = document.getElementById('termMonth');
        	if(check == true) {
	        	if(dayDate.checked) {
	        		termWeek.disabled = 'true';	
	        		termMonth.disabled = 'true';
	        	}else if(dayWeek.checked) {
	        		termMonth.disabled = 'true';
	        		termDay.disabled = 'true';
	        	}else if(dayMonth.checked) {
	        		termDay.disabled = 'true';	
	        		termWeek.disabled = 'true';
	        	}
	        	closeModal();
        }	
        else {
        	alert('기간체크를 해주세요!');
        	}
        }
        function closeModal() {
        	$.magnificPopup.close();
        }
        /* 기간정하기시 등록버튼생성 */
        function insertButton() {
        	var btn = document.getElementById('btn');
        	btn.type = 'button';
        }
        
    </script>
</body>
</html>