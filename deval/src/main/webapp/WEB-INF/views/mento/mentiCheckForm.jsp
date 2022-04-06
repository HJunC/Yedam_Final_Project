<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                        		<input type="checkbox">전체
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
                                            <th>
                                            </th>
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
                                                <a href="#" title="Remove item"><i class="fa fa-trash-alt"></i><span class="sr-only">Remove item</span></a>
                                            </td>
                                        </tr>
                                        <c:forEach var="menti" items="${mentis}">
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
                                            	${menti.menti_id }
                                            </td>
                                            <td class="shopping-cart-table-title">
                                                ${menti.startTm } - ${menti.endTm }
                                            </td>
                                            <td>
                                               ${menti.startDate } = ${menti.endDate }
                                            </td>
                                            <td>
                                                endDate-startDate x endTm-startTm x price
                                            </td>
                                            <td>
                                            </td>
                                            <td class="text-end text-nowrap">
                                                <a href="#" title="Remove item"><i class="fa fa-trash-alt"></i><span class="sr-only">Remove item</span></a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                
                                <hr class="white" />
                                
                                <div class="row">
                                    <div class="col-md-4 text text-md-end order-first order-md-last mb-sm-10">
                                        <a href="" class="btn btn-mod btn-border-w btn-round btn-small">Update Cart</a>
                                    </div>
                                    <div class="col-md-8">
                                        <form action="#" class="form text-nowrap">
                                            <label for="coupon-code" class="sr-only">Coupon-code</label>
                                            <input type="text" name="coupon-code" id="coupon-code" class="input-sm round" placeholder="Coupon code" style="width: 200px;" pattern=".{3,100}" required />
                                            &nbsp;<button type="submit" class="btn btn-mod btn-round btn-border-w btn-small">Apply Coupon</button>
                                        </form>
                                    </div>                                    
                                </div>
                                
                            </div>
                        </div>
                        
                    </div>
                </section>
                <!-- End Section -->                
                
            </main>
            <script type="text/javascript">
            	/*
            	전체체크 처리부분
            	function checkAll() {
            		let check = document.querySelectorAll('check');
            		let idAll = document.getElementById('all');
            		idAll.checked == check.checked
            	} */
            	
            </script>
</body>
</html>