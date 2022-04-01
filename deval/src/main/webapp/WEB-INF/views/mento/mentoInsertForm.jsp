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
                        <option value="java">Java</option>
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
                    최대날자
                    <select class="input-md round form-control" style="width: 170px;" id="maxTerm" name="maxTerm">
                        <c:forEach var="i" begin="1" end="13">
	                        <option value="${i}일">${i}일</option>
                        </c:forEach>
                    </select>
                    최대 주
                    <select class="input-md round form-control" style="width: 170px;" id="maxTerm" name="maxTerm">
                        <c:forEach var="i" begin="2" end="7">
	                        <option value="${i}주">${i}주</option>
                        </c:forEach>
                    </select>
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
                        <option value="0${i}:00">0${i}:00</option>
                        </c:forEach>
                        <c:forEach var="i" begin="10" end="23">
                        <option value="${i}:00">${i}:00</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-4 mb-40">
                    종료시간
                    <select class="input-md round form-control" style="width: 170px;" id="serviceEdt" name="serviceEdt">
                        <option value="13:00">13:00</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                    </select>
                </div>
            </div>
            <input type="button" class="btn btn-mod btn-w btn-round btn-large" value="등록" onclick="mentoInsert()">
                
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
        
        function mentoInsert() {
        	var start = frm.serviceStt.value;
        	var end = frm.serviceEdt.value;
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
        	var targetTime = target.value;
        	var sTime = targetTime.substr(0,2);
        	console.log(sTime);
        	var startTime = parseInt(sTime);
        	console.log(startTime+1);
        	var timeGap = 24 - startTime;
        	console.log(timeGap);
        	var selectId = document.getElementById('serviceEdt');
        	for(var i = startTime; i<24; i++) {
        		console.log(i);
        		if(i < 10) {
        			var option = document.createElement('option');
        			option.value = '0' + i + ':00';
        			option.innerText = '0' + i + ':00';
        		}else {
        			option.value = i + ':00';
        			option.innerText = i + ':00';
        		}
	        		selectId.appendChild(option);
        	}
        }
    </script>
</body>
</html>