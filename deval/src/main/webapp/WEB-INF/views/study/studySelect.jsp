<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudySelect.jsp</title>
</head>
<body>
<div align="center">
      <div>
         <h1>게시글 상세내용</h1>
      </div>
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
                        <td colspan="3">${study.studyNm }</td>
                     </tr>
                     <tr>
                        <th>내용</th>
                        <td colspan="3">${study.subject}</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </c:otherwise>
      </c:choose>
      <div>
         <button type="button" onclick="">문의</button>
         <button type="button" onclick="location.href='studyMain.do'">목록</button>
       	 <button type="button" onclick="">신청</button>
      </div>
   </div>

</body>
</html>