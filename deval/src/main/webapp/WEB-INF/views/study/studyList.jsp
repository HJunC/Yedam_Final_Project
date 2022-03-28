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
		<table style="width: 100%;">
			<thead>
				<tr class="row100 head">
					<th>스터디번호</th>
					<th>지역</th>
					<th>언어</th>
					<th>스터디명</th>
					<th>스터디장</th>
					<th>난이도</th>
					<th>인원</th>
					<th>학습기간</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${study}" var="study">
					<tr>
						<td>${study.studyNo }</td>
						<td>${study.location }</td>
						<td>${study.lang1 }
						<c:if test="${not empty study.lang2 }">
						/ ${study.lang2 }
						</c:if></td>
						<td>${study.studyNm }</td>
						<td>${study.leaderId }</td>
						<td>${study.defficulty }</td>
						<td>${study.maxRcnt }</td>
						<td>${study.studySdt }~${study.studyEdt }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<form id="selfrm" action="studySelect.do" method="post">
			<input type="hidden" id="studyNo" name="studyNo">
		</form>
	</div>
	<script type="text/javascript">
		function studySearch(n) {
			selfrm.studyNo.value = n;
			selfrm.submit();
		}
	</script>
	
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script src="${resources}/js/study/common.js"></script>
</body>


</html>