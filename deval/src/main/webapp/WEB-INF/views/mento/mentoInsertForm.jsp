<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="resources"
	value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mentoInsertForm</title>
</head>
<body>
	<section class="page-section bg-dark light-content">
        <div class="container relative">
            <!-- 멘토등록 글-->
            <div class="text-center mb-80 mb-sm-50">
                <h2 class="section-title">멘토등록!!</h2>
            </div>
            <!-- 값이 들어가는 곳-->
            <!-- mentoInsert Form tag-->
            <form action="mentoInsert.do" id="frm" type="post">
                <div class="row">
                    <!-- 사진 미리보기 div-->
                    <div id="image_container">
                        <img>
                    </div>
                    <!-- 사진 파일등록-->
                    <div class="mb-20 mb-md-10">
                        <label for="exampleInputFile">
                            사진을 등록해주세요.
                        </label>
                        <input type="file" id="exampleInputFile" name="exampleInputFile" multiple="multiple"
                            onchange="setThumbnail(event)">
                        <p class="help-block">
                            파일첨부 후 사진 미리보기로 확인하세요
                        </p>
                    </div>
                    <!-- 자기소개글-->
                    <div class="mb-20 mb-md-10">
                        <textarea name="text" id="text" class="input-md round form-control" rows="6" placeholder="자기소개글을 써주세요." maxlength="400" style="width: 400px"></textarea>
                    </div>
                </div>
                
                <div class="row">
                <div class="col-sm-4 mb-40">
                    프로그래밍언어를 골라주세요.
                    <select class="input-md round form-control" style="width: 170px;">
                        <option>언어1</option>
                        <option>언어2</option>
                        <option>언어3</option>
                    </select>
                </div>
                <div class="col-sm-4 mb-40">
                    경력이 어떻게 되십니까
                    <select class="input-md round form-control" style="width: 170px;">
                        <option>2년이상</option>
                        <option>3년이상</option>
                        <option>5년이상</option>
                        <option>7년이상</option>
                        <option>10년이상</option>
                    </select>
                </div>
                <div class="col-sm-4 mb-40">
                    기간설정
                    <select class="input-md round form-control" style="width: 170px;">
                        <option>1일</option>
                        <option>3일</option>
                        <option>1주일</option>
                        <option>1달</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 mb-40">
                    1시간이용금액
                    <!-- Name -->
                    <input type="text" name="name" id="name" class="input-md round form-control" placeholder="숫자만 입력해주세요" maxlength="100" style="width: 250px;">
                </div>
                <div class="col-sm-4 mb-40">
                    시작시간
                    <select class="input-md round form-control" style="width: 170px;">
                        <option>13:00</option>
                        <option>14:00</option>
                        <option>15:00</option>
                        <option>16:00</option>
                    </select>
                </div>
                <div class="col-sm-4 mb-40">
                    종료시간
                    <select class="input-md round form-control" style="width: 170px;">
                        <option>13:00</option>
                        <option>14:00</option>
                        <option>15:00</option>
                        <option>16:00</option>
                    </select>
                </div>
            </div>
            <input type="submit" class="btn btn-mod btn-w btn-round btn-large" value="등록">
                
            </form>

        </div>
        
    </section>
    <script>
        function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
            img.style.cssText  = 'width:400px;height:400px;';
            img.style.cssText += 'border-radius : 70%;object-fit : cover';
			document.querySelector("div#image_container").appendChild(img);
		};
		
		reader.readAsDataURL(event.target.files[0]);
	}
    </script>
</body>
</html>