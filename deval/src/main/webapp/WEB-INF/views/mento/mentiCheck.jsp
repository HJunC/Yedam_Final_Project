<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="resources" value="${pageContext.request.contextPath }/resources"/>
</head>
<body>


	 <main id="main">    
            
                <!-- Home Section -->
                <section class="page-section bg-dark light-content" id="home">
                    <div class="container relative text-center">
                        <div class="row">
                            <div class="col-lg-10 offset-lg-1">
                                <h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">멘토링서비스 신청목록</h2>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- End Home Section -->
                
                
                <!-- Section -->
                <section class="page-section bg-dark light-content pt-0">
                    <div class="container relative">
                        
                        <div class="row">
                            <div class="col-lg-8 offset-lg-2">
                                
                                <div class="table-responsive">
                                    <table class="table shopping-cart-table">
                                        <tr>
                                        	<th>
                                        		
                                        	</th>
                                            <th>
                                                멘티
                                            </th>
                                            <th>
                                            	아이디
                                            </th>
                                            <th class="shopping-cart-table-title">
                                                시간
                                            </th>
                                            <th>
                                                TERM
                                            </th>
                                            <th>
                                                Total
                                            </th>
                                            <th>시작시간</th>
                                            <th>
                                            </th>
                                            <th></th>
                                        </tr>
                                        <tr>
                                        	<td>
                                        		<input type="checkbox">
                                        	</td>
                                            <td>
                                            <div>
                                                <img src="${resources}/images/mento/prev.bmp" alt="" width="100" />
                                            </div>
                                            </td>
                                            <td>
                                            	회원아이디exam
                                            </td>
                                            <td class="shopping-cart-table-title">
                                                시간1
                                            </td>
                                            <td>
                                                1주일
                                            </td>
                                            <td>
                                                100원
                                            </td>
                                            
                                            <td>
                                            </td>
                                            <td class="text-end text-nowrap">
                                                <a href="#" onclick="serviceDelete()" title="Remove item"><i class="fa fa-trash-alt"></i></a>
                                            </td>
                                        </tr>
                                        <c:forEach var="menti" items="${mentis}">
                                        	
                                        	<tr>
                                        	<td>
                                        		<input type="checkbox" name="checkBox">
                                        	</td>
                                            <td>
                                            <div>
                                            	<!-- member(proFileImg) 경로 땡겨와서 수정! -->
                                                <img src="${resources}/images/mento/prev.bmp" alt="" width="100" />
                                            </div>
                                            </td>
                                            <td>
                                            	${menti.mentiId }
                                            </td>
                                            <td class="shopping-cart-table-title">
                                                ${menti.startTm } - ${menti.endTm }
                                            </td>
                                            <td>
                                               ${menti.serviceTerm}
                                            </td>
                                            <td>
                                            	<fmt:formatNumber value="${menti.price}" pattern="#,###"/>원
                                            </td>
                                            <td>
                                            	<fmt:formatDate value="${menti.startDate}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>
                                            </td>
                                            <td class="text-end text-nowrap">
                                                <a href="#" onclick="serviceDelete()" title="Remove item"><i class="fa fa-trash-alt"></i><span class="sr-only">Remove item</span></a>
                                            </td>
	                                        <td>
	                                        	<input type="hidden" name="mentoServiceNo" id="mentoServiceNo" value="${menti.mentoServiceNo}"/>
	                                        </td>
	                                        <td>
	                                        	<input type="hidden" id="startDate" value="<fmt:formatDate value="${menti.startDate}" pattern="yyyy-MM-dd"/>">
	                                        </td>
	                                        <td>
	                                        	<input type="hidden" id="endDate" value="<fmt:formatDate value="${menti.endDate}" pattern="yyyy-MM-dd"/>">
	                                        </td>
	                                        <td>
	                                        	<input type="hidden" id="startTm" value="${menti.startTm }">
	                                        </td>
	                                        <td>
									            <input type="hidden" id="endTm" value="${menti.endTm}">                            
	                                        </td>
	                                        <td>
	                                        	<input type="hidden" id="mentiId" value="${menti.mentiId }">
	                                        </td>
	                                        <td>
	                                        	<input type="hidden" id="mentiPrice" value="${menti.price }">
	                                        </td>
	                                        <td>
	                                        	<input type="hidden" id="tradeLogNo" value="${menti.tradeLogNo}">
	                                        </td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                
                                <hr class="white" />
                                
                                <div class="row">
                                    <div class="col-md-4 text text-md-end order-first order-md-last mb-sm-10">
                                        <input type="button" onclick="serviceAccept()" class="btn btn-mod btn-border-w btn-round btn-small" value="서비스수락">
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        
                    </div>
                </section>
                <!-- End Section -->                
                
            </main>
            <script type="text/javascript">
            	
            	
            	function serviceDelete() {
            		var tag = $(event.target).parent().parent().parent();
            		
            		var no = document.getElementById('mentoServiceNo').value;
            		var serviceNo = parseInt(no);
            		
            		$.ajax({
            			url : "serviceRefuse.do",
            			type : "POST",
            			data : {
            				mentoServiceNo : serviceNo,
            				memberId : $('#mentiId').val(),
            				cashPt : $('#mentiPrice').val(),
            				tradeLogNo : $('#tradeLogNo').val()
            			} 
            		}).done(function(data) {
        				console.log(data);
        				tag.remove();
        				
        			});
            	}
            	
            	function serviceAccept() {
            		let list = [];
            		$("[name='checkBox']:checked").each(function(i,checkbox) {
            			console.log(checkbox);
            			var tr = $(checkbox).parent().parent();
        				var td = $(tr).children();
            			var obj = {};
            			var serviceNo = td.eq(9).find('input').val();
            			var startDate = td.eq(10).find('input').val();
            			var endDate = td.eq(11).find('input').val();
            			var startTm = td.eq(12).find('input').val();
            			var endTm = td.eq(13).find('input').val();
            			var mentiId = $('#mentiId').val();
            			obj["mentoServiceNo"] = serviceNo;
            			obj["startDate"] = startDate;
            			obj["endDate"] = endDate;
            			obj["startTm"] = startTm;
            			obj["endTm"] = endTm;
            			obj["mentoId"] = '${mentis[0].mentoId}';
            			obj["mentiId"] = mentiId;
            			list.push(obj);
            		});
            		if(list.length != 0){
            			$.ajax({
            				url : "serviceAccept.do",
            				type : "POST",
            				dataType: 'text',
            				data : JSON.stringify(list),
            				contentType : 'application/json',
            				success : function(data) {
            					as.send
            				}
            			});
            			
            		}
            	}
            </script>
</body>
</html>