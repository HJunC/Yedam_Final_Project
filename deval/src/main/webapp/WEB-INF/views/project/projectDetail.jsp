<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>

프로젝트 상세화면
${project.projectNo} / 리더 아이디 : ${project.leaderId}



(모집중)
- 프로젝트 신청
- 프로젝트 삭제 (작성자)

(진행중)
- 프로젝트 마감일 수정
- 프로젝트 삭제 (프로젝트 마감일 < 오늘날짜)

(완료)
- 프로젝트 공유하기 (공유X)