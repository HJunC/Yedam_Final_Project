<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<link rel="stylesheet" type="text/css" href="${resources }/css/custom/team-project-style.css">
<script src="${resources}/js/common/Languages.js"></script>
	<section class="page-section bg-dark light-content">
        <div class="container relative">
            <!-- 멘토등록 글-->
            <div class="text-center mb-80 mb-sm-50">
                <h2 class="section-title">멘토등록!!</h2>
            </div>
            <!-- 값이 들어가는 곳-->
            <!-- mentoInsert Form tag-->
            <form action="mentoInsert.do" id="frm" method="post" enctype="multipart/form-data" class="contact-form form">
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
                        <input type="file" id="photo" name="file" onchange="setThumbnail(event)"  accept="image/*">
                       </div>
                    </div>
                    <!-- 자기소개글-->
                    <div class="mb-20 mb-md-10" >
                        <textarea name="text" id="info" name="info" class="input-md round form-control bg-dark-input" rows="4" placeholder="자기소개글을 써주세요." maxlength="400"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="projectTerm">프로그래밍 언어</label>
                    <p class="input-info">보기중에 언어 한개를 선택해주세요.</p>
	                 <div id="languagesBox" class="tags">
	                    	
	                  </div>
                </div>
                <div class="form-group">
                    <label for="projectTerm">경력</label>
                    <p class="input-info">멘토님의 프로그래밍 경력을 적어주세요.</p>
                    <select class="input-md round form-control bg-dark-input" id="history" name="history">
                        <option value="2년이상">2년이상</option>
                        <option value="3년이상">3년이상</option>
                        <option value="5년이상">5년이상</option>
                        <option value="7년이상">7년이상</option>
                        <option value="10년이상">10년이상</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>기간설정</label>
                    <p class="input-info">일별, 주별, 월별 중 하나를 선택해주세요  최대값을 정해주세요</p>
                    <div class="row">
                    	<div class="col input-group me-3">
                             <span class="input-group-text bg-dark" style="border-color: #5e646a;">일별</span>
                             <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                 <input class="form-check-input mt-0" type="radio" name="choiceRadio" id="dayDate" required="">
                             </div>
                             <select class="input-lg round form-control bg-dark-input" id="termDay" name="termDay">
		                        <c:forEach var="i" begin="1" end="13">
			                        <option value="${i}일">${i}일</option>
		                        </c:forEach>
		                    </select>
                         </div>
                         <div class="col input-group me-3">
                             <span class="input-group-text bg-dark" style="border-color: #5e646a;">주별</span>
                             <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                 <input class="form-check-input mt-0" type="radio" name="choiceRadio" id="dayWeek" required="">
                             </div>
                             <select class="input-lg round form-control bg-dark-input" id="termWeek" name="termWeek">
		                        <c:forEach var="i" begin="2" end="7">
			                        <option value="${i}주">${i}주</option>
		                        </c:forEach>
		                    </select>
                         </div>
                         <div class="col input-group me-3">
                             <span class="input-group-text bg-dark" style="border-color: #5e646a;">달별</span>
                             <div class="input-group-text bg-dark" style="border-color: #5e646a;">
                                 <input class="form-check-input mt-0" type="radio" name="choiceRadio" id="dayMonth" required="">
                             </div>
                             <select class="input-lg round form-control bg-dark-input" id="termMonth" name="termMonth">
		                        <c:forEach var="i" begin="2" end="6">
			                        <option value="${i}달">${i}달</option>
		                        </c:forEach>
		                    </select>
                         </div>
                    </div>
                </div>
                <!-- 금액설정 -->
                <div class="form-group">
                    <label for="projectTerm">금액설정</label>
                    <p class="input-info">시간당 금액을 설정해주세요.</p>
                     <input type="number" name="price" id="price" class="input-md round form-control bg-dark-input" placeholder="숫자만 입력해주세요" maxlength="100"">
                </div>
                <!-- 금액설정 끝 -->
                <div class="row">
					<div class="col input-group me-3">
						<span class="input-group-text bg-dark" style="border-color: #5e646a;">시작시간</span> 
							<select class="input-lg round form-control bg-dark-input" id="serviceStt" name="serviceStt" onchange="endTime(this)">
							<c:forEach var="i" begin="0" end="9">
								<option value="${i}">0${i}:00</option>
							</c:forEach>
							<c:forEach var="i" begin="10" end="23">
								<option value="${i}">${i}:00</option>
							</c:forEach>
						</select>
					</div>
					<div class="col input-group me-3">
	                             <span class="input-group-text bg-dark" style="border-color: #5e646a;">종료시간</span>
	                             <select class="input-lg round form-control bg-dark-input" id="serviceEdt" name="serviceEdt">
	                        			<option value="1">01:00</option>
	                    		</select>
	                </div>
                 </div>
                 <hr class="mt-0 mb-30 white" />
                 <div class="col input-group me-3" style="justify-content:center">
            		<input type="button" id="btn" class="btn btn-mod btn-w btn-round btn-large" value="등록" onclick="mentoInsert()">
            	</div>
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
	        var check = $('input:radio[name=choiceRadio]').is(':checked');
        	var lang = $('input:radio[name=lang]:checked').val();
        	var photo = $('#photo').val();
        	if(typeof lang == "undefined") {
         		alert('언어를 정해주세요');
         		return;
         	}
         	<c:forEach items="${mentos}" var="mento">
         	if(lang == '${mento.lang}') {
        		alert('이미 등록된 언어입니다.');
        		return
        	}
        	</c:forEach>
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
       		}	
        	var start = frm.serviceStt.value;
        	var end = frm.serviceEdt.value;
        	var price = $('#price').val();
         	if(photo == '') {
         		photo = null; 
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
        	if($('#photo').val() == ''){
        		alert('사진을 등록해주세요');
        		return;
        	}
        	frm.submit();
        }
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
        
        var checkBox = "";
        Language.forEach((item, index) => {
          checkBox += '<input type="radio" class="btn-check" id="btncheck'+item+'" name="lang"  value="' + item + '">';
          checkBox += '<label class="btn btn-outline-primary" for="btncheck'+item+'">' + item + '</label>';
        })
        $("#languagesBox").append(checkBox);
        
    </script>