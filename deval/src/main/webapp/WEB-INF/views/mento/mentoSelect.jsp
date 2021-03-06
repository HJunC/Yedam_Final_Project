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
						<!-- ??????????????? ?????? -->
						<div class="mb-30">
							<form method="post" action="mentoServInsert.do" class="form"
								id="frm">
								<div class="mb-20 mb-md-10">
									<div>????????????</div>
									<div>
										<!-- ?????? ???????????? -->
										<select class="input-lg round form-control bg-dark-input me-3"
											style="width: 150px" onchange="selectTime(this)"
											id="serviceStt" name="startTm">
											<option>????????????</option>
											<c:forEach var="i" begin="${stT}" end="${edT-1}">
												<option value="${i}"><c:out value="${i}" />:00
												</option>
											</c:forEach>
										</select> <select class="input-lg round form-control bg-dark-input"
											style="width: 150px" onchange="totalTime()" id="serviceEdt"
											name="endTm">
											<option>????????????</option>
										</select>
									</div>
								</div>
								<hr class="mt-0 mb-30 white" />
								<div class="mb-20 mb-md-10">
									
									<div class="d-inline-block me-3">
										<div>????????????</div>
										<c:if test="${!empty mento.termDay }">
											<select class="input-lg round form-control bg-dark-input"
												style="width: 150px" name="serviceTerm" id="termTime">
												<c:if test="${lengthDay == 2}">
													<c:forEach var="i" begin="1" end="${fn:substring(day,0,1)}">
														<option value="${i}???">${i}???</option>
													</c:forEach>
												</c:if>
												<c:if test="${lengthDay == 3 }">
													<c:forEach var="i" begin="1" end="${fn:substring(day,0,2)}">
														<option value="${i}???">${i}???</option>
													</c:forEach>
												</c:if>
											</select>
										</c:if>
										<c:if test="${!empty mento.termWeek}">
											<select class="input-lg round form-control bg-dark-input"
												style="width: 150px" name="serviceTerm" id="termTime">
												<c:forEach var="i" begin="2" end="${fn:substring(week,0,1)}">
													<option value="${i}???">${i}???</option>
												</c:forEach>
											</select>
										</c:if>
										<c:if test="${!empty mento.termMonth}">
											<select class="input-lg round form-control bg-dark-input"
												style="width: 150px" name="serviceTerm" id="termTime">
												<c:forEach var="i" begin="2"
													end="${fn:substring(month,0,1)}">
													<option value="${i}???">${i}???</option>
												</c:forEach>
											</select>
										</c:if>
									</div>
									<div class="d-inline-block">
										<div>?????????????????????</div>
										<input type="date" name="startDate" id="startDate"
											class="input-lg round form-control bg-dark-input">
									</div>
								</div>
								<!-- ???????????????????????? -->
								<hr class="mt-0 mb-30 white" />
								<button type="button"
									class="btn btn-mod btn-border-w btn-round btn-medium"
									onclick="getPrice()">???????????????!</button>
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
									<h3>?????????</h3>
					
									<div class="pricing-title mb-1">???????????? ????????? ?????????????</div>
									
									<div class="">
										<ul class="">
											<li id="priceTime"></li>
											<li id="priceTerm"></li>
											<li>??????????????? : ${mento.price}</li>
										</ul>
									</div>
									
									<div style="text-align:end;">
										?????? ????????? :&nbsp;
										<i id='icon' class="fa fa-won-sign"></i> 
										<span id="nowPoint" style="font-size:26px;"></span>
									</div>
									
									<div style="text-align:end;">
										????????????????????? :&nbsp;
										<i id='icon' class="fa fa-won-sign"></i> 
										<span id="totalPrice" style="font-size:26px;"></span>
									</div>
									
									<div id="putPointBox" class="justify-content-end align-items-center" style="display: none;">
										????????????&nbsp;
										<input type="number" id="putPoint" class="form-control" style="width: 270px;" placeholder="??????????????? ???????????????">
									</div>

									<!-- Button ??????????????? -->
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
						<!-- ????????????????????? ??? -->
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
            data.addColumn('string', '?????????');
            data.addColumn('number', '???????????????');

            //Ajax ??????
            let chartData = [];
            $.ajax({
                    url: "mentoServChart.do",
                    dataType: "json",
                    data: {"id":"${mento.mentoId}"},
                    async: false
                })
                .done(function (item) {
                    chartData.push(["????????????",item.all]);
                    //???????????????
                    if(item.one == 0) {
                    	chartData.push(["????????????",5]);
                    }else {
                    chartData.push(["????????????",item.one]);
                    }
                });
           	data.addRows(chartData);
            
            
            // Set chart options
            var options = {
                'title': '?????????',
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
 
        // ????????? ?????? ?????? ??????
        function selectTime(target) {
        	var timeSelect = document.getElementById('serviceEdt');
        	$('#serviceEdt').empty()
        	
        	if($('#serviceStt').val() == '????????????') {
        		var option = document.createElement('option');
				option.innerText = '????????????';
        		timeSelect.appendChild(option);
            }
        	// ??????????????? ????????????
        	var startTime = parseInt(target.value);
        	
        	// ??? ???????????? ?????????.
        	var endTime = ${fn:substring(edT,0,2)};
        	
        	// select ????????? ???????????????
        	
       		for(var i=startTime+1; i<endTime+1; i++) {
		        var option = document.createElement('option');
				option.value = i;
				option.innerText = i + ':00';
       			timeSelect.appendChild(option);
       		}
        	totalTime();
        }
        
        function totalTime() {
        	
        	// ???????????? ????????????
        	var edTime = document.getElementById('serviceEdt').value;
        	var stTime = document.getElementById('serviceStt').value;
        	/* var edTime3 = parseInt(edTime.substr(0,2));
        	var stTime3 = parseInt(stTime.substr(0,2)); */
        	var priceTime = edTime - stTime;
        	$('#priceTime').html('?????? :  ' + priceTime + "??????");
        	return priceTime;
        	
        }
        
        //??????
        function totalTerm() {
        	var termTime = document.getElementById('termTime').value;
	    	var termValue = parseInt(termTime);
	    	if(termTime.slice(-1)== '???') {
	    		$('#priceTerm').html('?????? :  ' + termTime);
	    		return termValue;
	    	}else if(termTime.slice(-1)== '???') {
	    		$('#priceTerm').html('?????? :  ' + termTime);
	    		return termValue*7;
	    	}else if(termTime.slice(-1)== '???') {
	    		$('#priceTerm').html('?????? :  ' + termTime);
	    		return termValue*30;
	    	}
	       
        }
        
        //????????? ??????function
        function getPrice() {
        	checkTime();
        	var std = new Date($("#startDate").val());
      	  	var term = $('#termTime').val();
      	  	var numTerm = parseInt(term);
      	  	if(term.substr(-1) == '???') {
      	  		numTerm = numTerm * 7;
      	  	}else if(term.substr(-1) == '???') {
      	  		numTerm = numTerm * 30;
      	  	} 
      	    $('#endDate').val(moment(std.setDate(std.getDate() + numTerm)).format("YYYY-MM-DD"));
        }

        
        
        function checkTime() {
        	var edTime = document.getElementById('serviceEdt').value;
        	var stTime = document.getElementById('serviceStt').value;
        	$('#nowPoint').html($('#nowCash').text())
        	if(edTime == "????????????" || stTime == '????????????') {
        		alert('?????? ?????? ????????? ???????????????.');
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
    	        	// ???????????? ??????
    	        	if(totalPrice > $('#nowCash').text()) {
    	        		$('#putPointBox').css('display','none');
    	        		$("#putPointBox").css("display", "flex");
    	        		var chargeBtn = $('<input type="button" class="btn btn-mod btn-w btn-medium round" id="charge" onclick="chargePt()" value="????????????">');
    	        		$('#btnDiv').empty();
    	        		$('#btnDiv').append(chargeBtn);
    	        	}else if(totalPrice <= $('#nowCash').text()) {
    	        		$('#putPointBox').css('display','none');
    	        		var paymentBtn = $('<input type="button" class="btn btn-mod btn-w btn-medium round" id="payment" onclick="payment()" value="????????????">');
    	        		$('#btnDiv').empty();
    	        		$('#btnDiv').append(paymentBtn);
    	        	}
    	        $('#modalControl').trigger('click');
        	}
        	return totalPrice;
        	
        }
        
       //????????????
       function chargePt() {
    	   IMP.init("imp85822085");
    	   requestPay();
       }
    	   function requestPay() {
    		      // IMP.request_pay(param, callback) ????????? ??????
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
    		                // ????????? ?????? ?????? API ????????? ??????
    		                alert("????????? ??????????????????, ????????????????????????");
    		                $('#nowCash').load(window.location.href + " #nowCash")
    		                $('.mfp-close').trigger('click');
    		                
    		              })
    		          } else {
    		              // ?????? ?????? ??? ??????,
    		        	  alert("????????? ?????????????????????. ?????? ??????: " +  rsp.error_msg);
    		          }
    		          console.log(i);
    		      });
    	   };
    	   
    	  //????????????
    	  // ???????????? ????????? ????????????
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
	    				  //tradeLog price ?????????
	    		    	  var logPrice = document.getElementById('logPrice');
	    				  var mentoReqt = document.getElementById('mentoReqt');
	    				  mentoReqt.value = $('#startDate').val() + "~" + $('#endDate').val();
	    		    	  logPrice.value = parseInt($('#totalPrice').text());
	    		    	  
	    		    	  //insert submit
	    		    	  msg = {
							memberId : "${mento.mentoId}",
                    		subject : "${member.memberId}?????? ???????????? ??????????????????."
                    				}
                    		webSocket.send(JSON.stringify(msg));
	    		    	  
	    		    	  alert('???????????? ???????????? ?????????????????????.');
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