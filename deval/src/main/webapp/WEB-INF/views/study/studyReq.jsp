<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studyReq.jsp</title>
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
                                         스터디 신청자
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- End Title -->
                <!-- Study Req Member -->
                <div align="center">
		<table style="width: 100%;">
			<thead>
				<tr class="row100 head">
					<th>스터디팀번호</th>
					<th>신청자</th>
					<th>학력</th>
					<th>경력</th>
					<th>자격증</th>
					<th>소개</th>
					<th>승인여부</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${study}" var="std">
					<tr> <%-- tr 안에 onclick="studySearch('${std.studyNo }')" --%>
						<td>${std.studyNo }</td>
						<td>${std.memberId }</td>
						<td>${std.college }</td>
						<td>${std.career }</td>
						<td>${std.license }</td>
						<td>${std.present }</td>
						<td>${std.state }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
</body>
</html>