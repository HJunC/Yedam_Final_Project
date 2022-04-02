<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudySelect.jsp</title>
</head>
<body>
<!-- Title -->
                <section class="small-section bg-dark-alfa-50" data-background="images/full-width-images/section-bg-19.jpg">
                    <div class="container relative">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                                    <h1 class="hs-line-7 mb-20 mb-xs-10">STUDY</h1>
                                </div>
                                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
                                         스터디 상세글
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- End Title -->
<div align="center">
      <div>
         <h1>게시글 상세내용</h1>
      </div>
      <sec:csrfInput/>
      <c:choose>
         <c:when test="${empty study.studyNo}">
            <h1>선택한 게시글이 존재하지 않습니다.</h1>
         </c:when>
         <c:otherwise>
            <div>
               <table border="1">
                  <tbody>
                     <tr>
                        <th>스터디장</th>
                        <td>${study.leaderId }</td>
                        <th>등록일자</th>
                        <td>${study.uploadDate }</td>
                     </tr>
                     <tr>
                     	<th>스터디명</th>
                        <td colspan="9">${study.studyNm }</td>
                     </tr>
                     <tr>
                        <th>내용</th>
                        <td colspan="10">${study.subject}</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </c:otherwise>
      </c:choose><br><br>
      <div>
      신청모달
      <input type="text" name="내용폼" value="${info.내용}">
      
      
      	 <form action="studyUpdateForm.do" method="post">
      	 <sec:csrfInput/>
	         <button type="button" onclick="location.href='studyList.do'">목록</button>
	       	 <button type="button" onclick="">신청</button>
	         <button type="button" onclick="">문의</button>
	         <button type="submit">수정</button>
	         
	         <input type="hidden" name="studyNo" value="${study.studyNo }">
         </form>
      </div>
   </div>
</body>
</html>