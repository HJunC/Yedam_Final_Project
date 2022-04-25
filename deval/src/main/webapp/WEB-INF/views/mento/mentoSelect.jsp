<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="resources"
	value="${pageContext.request.contextPath }/resources" />
<link rel="stylesheet"
	href="${resources}/css/custom/team-project-style.css">
</head>
<body>
	<c:set var="upload" value="/upload" />
	<c:set var="stT" value="${mento.serviceStt }" />
	<c:set var="edT" value="${mento.serviceEdt }" />
	<c:set var="day" value="${mento.termDay}" />
	<c:set var="lengthDay" value="${fn:length(day)}" />
	<c:set var="week" value="${mento.termWeek}" />
	<c:set var="month" value="${mento.termMonth}" />
	<section class="page-section bg-dark light-content">
		<div class="container relative">
			<c:if test="${!empty mento }">
				<!-- Product Content -->
				<div class="row mb-60 mb-xs-30">
					<c:if test="${!empty member}">
						<div id="nowCash" style="display: none">${member.cashPt}</div>
					</c:if>
					<!-- Product Images -->
					<div class="col-md-4 mb-md-30">
						<c:if test="${!empty mento.photo }">
							<div id="select-img">
								<img src="${upload}/${mento.photo}" alt=""
									style="border-radius: 70%; object-fit: cover;" />
							</div>
						</c:if>
						<c:if test="${empty mento.photo }">
							<div id="select-img">
								<img src="${resources}/images/mento/prev.bmp" alt=".."
									style="border-radius: 70%; object-fit: cover;" />
							</div>
						</c:if>

					</div>
					<!-- End Product Images -->

					<!-- Product Description -->
					<div class="col-sm-8 col-md-5 mb-xs-40">

						<h1 class="h3 mt-0">${mento.mentoId}</h1>

						<hr class="mt-0 mb-30 white" />

						<div class="row">
							<div class="col-6 lead mt-0 mb-20">
								<strong><i class="fa fa-won-sign"></i>${mento.price }</strong>
							</div>
							<div class="col-6 align-right gray">
								<i class="fa fa-hands-helping"></i> &nbsp;(${mento.people }
								menti)
							</div>
						</div>

						<div class="gray mb-30">${mento.info }</div>

						<hr class="mt-0 mb-30 white" />
						<!-- 기간정하는 구간 -->
						<div class="mb-30">
							<form method="post" action="mentoServInsert.do" class="form"
								id="frm">
								<div class="mb-20 mb-md-10">
									<div>시간설정</div>
									<div>
										<!-- 시간 가져오기 -->
										<select class="input-lg round form-control bg-dark-input me-3"
											style="width: 150px" onchange="selectTime(this)"
											id="serviceStt" name="startTm">
											<option>시작시간</option>
											<c:forEach var="i" begin="${stT}" end="${edT-1}">
												<option value="${i}"><c:out value="${i}" />:00
												</option>
											</c:forEach>
										</select> <select class="input-lg round form-control bg-dark-input"
											style="width: 150px" onchange="totalTime()" id="serviceEdt"
											name="endTm">
											<option>종료시간</option>
										</select>
									</div>
								</div>
								<hr class="mt-0 mb-30 white" />
								<div class="mb-20 mb-md-10">
									
									<div class="d-inline-block me-3">
										<div>기간설정</div>
										<c:if test="${!empty mento.termDay }">
											<select class="input-lg round form-control bg-dark-input"
												style="width: 150px" name="serviceTerm" id="termTime">
												<c:if test="${lengthDay == 2}">
													<c:forEach var="i" begin="1" end="${fn:substring(day,0,1)}">
														<option value="${i}일">${i}일</option>
													</c:forEach>
												</c:if>
												<c:if test="${lengthDay == 3 }">
													<c:forEach var="i" begin="1" end="${fn:substring(day,0,2)}">
														<option value="${i}일">${i}일</option>
													</c:forEach>
												</c:if>
											</select>
										</c:if>
										<c:if test="${!empty mento.termWeek}">
											<select class="input-lg round form-control bg-dark-input"
												style="width: 150px" name="serviceTerm" id="termTime">
												<c:forEach var="i" begin="2" end="${fn:substring(week,0,1)}">
													<option value="${i}주">${i}주</option>
												</c:forEach>
											</select>
										</c:if>
										<c:if test="${!empty mento.termMonth}">
											<select class="input-lg round form-control bg-dark-input"
												style="width: 150px" name="serviceTerm" id="termTime">
												<c:forEach var="i" begin="2"
													end="${fn:substring(month,0,1)}">
													<option value="${i}달">${i}달</option>
												</c:forEach>
											</select>
										</c:if>
									</div>
									<div class="d-inline-block">
										<div>서비스시작날짜</div>
										<input type="date" name="startDate" id="startDate"
											class="input-lg round form-control bg-dark-input">
									</div>
								</div>
								<!-- 서비스신청모달창 -->
								<hr class="mt-0 mb-30 white" />
								<button type="button"
									class="btn btn-mod btn-border-w btn-round btn-medium"
									onclick="getPrice()">서비스신청!</button>
								<a href="#test-modal" id="modalControl"
									class="lightbox-gallery-5 mfp-inline" style="display: none;">modal</a>
									
									
								<style>
									.mfp-content {
										background-color: #424242 !important;
	    								color: white !important;
									}
									.mfp-close { color: white !important;}
									
								</style>
								<div id="test-modal" class="mfp-hide">
									<h3>결제창</h3>
					
									<div class="pricing-title mb-1">선택하신 상품이 맞습니까?</div>
									
									<div class="">
										<ul class="">
											<li id="priceTime"></li>
											<li id="priceTerm"></li>
											<li>시간당가격 : ${mento.price}</li>
										</ul>
									</div>
									
									<div style="text-align:end;">
										현재 포인트 :&nbsp;
										<i id='icon' class="fa fa-won-sign"></i> 
										<span id="nowPoint" style="font-size:26px;"></span>
									</div>
									
									<div style="text-align:end;">
										서비스전체가격 :&nbsp;
										<i id='icon' class="fa fa-won-sign"></i> 
										<span id="totalPrice" style="font-size:26px;"></span>
									</div>
									
									<div id="putPointBox" class="justify-content-end align-items-center" style="display: none;">
										충전금액&nbsp;
										<input type="number" id="putPoint" class="form-control" style="width: 270px;" placeholder="충전금액을 적어주세요">
									</div>

									<!-- Button 들어가는곳 -->
									<div class="pr-button" id="btnDiv" style="text-align: center;"></div>

								</div>
				
								<div>
									<input type="hidden" name="mentiId" value="${member.memberId}">
									<input type="hidden" name="mentoId" value="${mento.mentoId}">
									<input type="hidden" name="endDate" id="endDate"> <input
										type="hidden" name="price" id="logPrice"> <input
										type="hidden" name="mentoReqt" id="mentoReqt">
								</div>
							</form>
						</div>
						<!-- 기간정하는구간 끝 -->
						<hr class="mt-0 mb-30" />
					</div>
					<!-- End Product Description -->

					<!-- Features -->
					<div class="col-sm-4 col-md-3 mb-xs-40">
						<!-- chart div -->
						<div id="chart"></div>
					</div>
					<!-- End Features -->
					<hr class="mt-0 mb-30 white" />
				</div>
				<!-- End Product Content -->
			</c:if>
		</div>
	</section>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="${resources}/js/moment.min.js"></script>
	<script type="text/javascript">
	
	setTimeout(() => {
        $(".mfp-inline").magnificPopup({
          closeOnBgClick: false
        });
      }, 1000);

        // Load the Visualization API and the corechart package.
        google.charts.load('current', {
            'packages': ['corechart']
        });

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        
        function drawChart() {

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', '부서명');
            data.addColumn('number', '평균만족도');

            //Ajax 호출
            let chartData = [];
            $.ajax({
                    url: "mentoServChart.do",
                    dataType: "json",
                    data: {"id":"${mento.mentoId}"},
                    async: false
                })
                .done(function (item) {
                    chartData.push(["전체평균",item.all]);
                    //수정된부분
                    if(item.one == 0) {
                    	chartData.push(["평점없음",5]);
                    }else {
                    chartData.push(["멘토평균",item.one]);
                    }
                });
           	data.addRows(chartData);
            
            
            // Set chart options
            var options = {
                'title': '만족도',
                'width': 500,
                'height': 600,
                'titleTextStyle': {
                    color: "white",               // color 'red' or '#cc00cc'
                    fontName: "Courier New",    // 'Times New Roman'
                    fontSize: 25,               // 12, 18
                    bold: true,                 // true or false
                    italic: true                // true of false
                },
                'backgroundColor' : {
                	fill: 'black'
                },
                'chartArea' : {
                    backgroundColor: {
                      fill: '#FFFAF0',
                      fillOpacity: 0.8
                    },
                },
                'vAxis' : {
                    minValue: 0,
                    max: 5,
                    tisks : [0,1,2,3,4,5],
                    textStyle : {
                    	color : 'white'
                    }
                  },
                  'hAxis' : {
                	  textStyle : {
                		  color : 'white'
                	  }
                  }
            };

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.ColumnChart(document.getElementById('chart'));
            chart.draw(data, options);

        } // end of function drawChart()
 
        // 기간과 시간 계산 펑션
        function selectTime(target) {
        	var timeSelect = document.getElementById('serviceEdt');
        	$('#serviceEdt').empty()
        	
        	if($('#serviceStt').val() == '시작시간') {
        		var option = document.createElement('option');
				option.innerText = '죵료시간';
        		timeSelect.appendChild(option);
            }
        	// 시작시간값 가져오기
        	var startTime = parseInt(target.value);
        	
        	// 몇 시간인지 구하기.
        	var endTime = ${fn:substring(edT,0,2)};
        	
        	// select 찾아서 값넣어주기
        	
       		for(var i=startTime+1; i<endTime+1; i++) {
		        var option = document.createElement('option');
				option.value = i;
				option.innerText = i + ':00';
       			timeSelect.appendChild(option);
       		}
        	totalTime();
        }
        
        function totalTime() {
        	
        	// 토탈가격 시간측정
        	var edTime = document.getElementById('serviceEdt').value;
        	var stTime = document.getElementById('serviceStt').value;
        	/* var edTime3 = parseInt(edTime.substr(0,2));
        	var stTime3 = parseInt(stTime.substr(0,2)); */
        	var priceTime = edTime - stTime;
        	$('#priceTime').html('시간 :  ' + priceTime + "시간");
        	return priceTime;
        	
        }
        
        //기간
        function totalTerm() {
        	var termTime = document.getElementById('termTime').value;
	    	var termValue = parseInt(termTime);
	    	if(termTime.slice(-1)== '일') {
	    		$('#priceTerm').html('기간 :  ' + termTime);
	    		return termValue;
	    	}else if(termTime.slice(-1)== '주') {
	    		$('#priceTerm').html('기간 :  ' + termTime);
	    		return termValue*7;
	    	}else if(termTime.slice(-1)== '달') {
	    		$('#priceTerm').html('기간 :  ' + termTime);
	    		return termValue*30;
	    	}
	       
        }
        
        //클릭시 호출function
        function getPrice() {
        	checkTime();
        	var std = new Date($("#startDate").val());
      	  	var term = $('#termTime').val();
      	  	var numTerm = parseInt(term);
      	  	if(term.substr(-1) == '주') {
      	  		numTerm = numTerm * 7;
      	  	}else if(term.substr(-1) == '달') {
      	  		numTerm = numTerm * 30;
      	  	} 
      	    $('#endDate').val(moment(std.setDate(std.getDate() + numTerm)).format("YYYY-MM-DD"));
        }

        
        
        function checkTime() {
        	var edTime = document.getElementById('serviceEdt').value;
        	var stTime = document.getElementById('serviceStt').value;
        	$('#nowPoint').html($('#nowCash').text())
        	if(edTime == "종료시간" || stTime == '시작시간') {
        		alert('기간 또는 시간을 정해주세요.');
        	}else {
        		totalTerm();
            	totalTime();
    			var term = totalTerm();
    			var time = totalTime();
    			var total = document.getElementById('totalPrice');
    			var putPoint = document.getElementById('putPoint');
    	        	var totalPrice = term * time * ${mento.price};
    	        	$('#totalPrice').empty();
    	        	$('#totalPrice').append(totalPrice);
    	        	// 충전버튼 생성
    	        	if(totalPrice > $('#nowCash').text()) {
    	        		$('#putPointBox').css('display','none');
    	        		$("#putPointBox").css("display", "flex");
    	        		var chargeBtn = $('<input type="button" class="btn btn-mod btn-w btn-medium round" id="charge" onclick="chargePt()" value="충전하기">');
    	        		$('#btnDiv').empty();
    	        		$('#btnDiv').append(chargeBtn);
    	        	}else if(totalPrice <= $('#nowCash').text()) {
    	        		$('#putPointBox').css('display','none');
    	        		var paymentBtn = $('<input type="button" class="btn btn-mod btn-w btn-medium round" id="payment" onclick="payment()" value="결제하기">');
    	        		$('#btnDiv').empty();
    	        		$('#btnDiv').append(paymentBtn);
    	        	}
    	        $('#modalControl').trigger('click');
        	}
        	return totalPrice;
        	
        }
        
       //충전하기
       function chargePt() {
    	   IMP.init("imp85822085");
    	   requestPay();
       }
    	   function requestPay() {
    		      // IMP.request_pay(param, callback) 결제창 호출
    		      IMP.request_pay({ // param
    		          pg: "kakao",
    		          pay_method: "card",
    		          merchant_uid: "merchantId_" + new Date().getTime(),
    		          amount: $('#putPoint').val(),
    		          buyer_name: '${member.memberId}',
    		          name : 'hong',
    		      }, function (rsp) { // callback
    		    	  console.log(rsp);
    		          if (rsp.success) {
    		        	  	$.ajax({
    		                  url: "../updatePoint.do",
    		                  type: "POST",
    		                  data: {
    		                      cashPt : rsp.paid_amount,
    		                      memberId : rsp.buyer_name
    		                  }
    		              }).done(function (data) {
    		                // 가맹점 서버 결제 API 성공시 로직
    		                alert("결제에 성공했습니다, 다시신청해주세요");
    		                $('#nowCash').load(window.location.href + " #nowCash")
    		                $('.mfp-close').trigger('click');
    		                
    		              })
    		          } else {
    		              // 결제 실패 시 로직,
    		        	  alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
    		          }
    		          console.log(i);
    		      });
    	   };
    	   
    	  //결제하기
    	  // 결제되는 포인트 변수선언
    	  function payment() {
	    	  var totalPrice = $('#totalPrice').text();
	    	  var price = parseInt(totalPrice);
    		  $.ajax({
    			  url : "mentoPayment.do",
    			  type : "POST",
    			  async : false,
    			  data : {
    				 memberId : '${member.memberId}',
    				 cashPt : price
    			  },
    			  success : function(data) {
    				  if(data == 'success') {
	    				  //tradeLog price 값선언
	    		    	  var logPrice = document.getElementById('logPrice');
	    				  var mentoReqt = document.getElementById('mentoReqt');
	    				  mentoReqt.value = $('#startDate').val() + "~" + $('#endDate').val();
	    		    	  logPrice.value = parseInt($('#totalPrice').text());
	    		    	  
	    		    	  //insert submit
	    		    	  alert('서비스가 성공적을 신청되었습니다.');
	    				  frm.submit();
    				  }
    			  }
    		  });
    	  }
    	  var today = new Date();
    	  var startDate = document.getElementById('startDate');
    	  startDate.setAttribute("value", moment(today.setDate(today.getDate() + 3)).format("YYYY-MM-DD"));
    	  startDate.setAttribute("min", moment(today.setDate(today.getDate() + 3)).format("YYYY-MM-DD"));
    	  startDate.setAttribute("max", moment(today.setDate(today.getDate() + 30)).format("YYYY-MM-DD"));
    	 

    </script>
</body>
</html>