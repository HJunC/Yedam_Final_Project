<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="upload" value="/upload"/>
<c:set var="resources" value="${pageContext.request.contextPath }/resources"/>
<c:set var="stT" value="${mento.serviceStt }"/>
<c:set var="edT" value="${mento.serviceEdt }"/>
<link rel="stylesheet" href="${resources}/css/custom/team-project-style.css">
<body>
 <section class="page-section bg-dark light-content">
                    <div class="container relative">
                    <c:if test="${!empty mento }">
                        <!-- Product Content -->
                        <div class="row mb-60 mb-xs-30">
                            <div><h1>${stT } : ${edT } : ${fn:substring(stT,0,2)} : ${mento.serviceEdt }</h1></div>
                            <!-- Product Images -->
                            <div class="col-md-4 mb-md-30">
                                
                                <div id="select-img">
                                    <img src="${upload}/${mento.photo}" alt="" style="border-radius: 70%;object-fit : cover;"/>
                                </div>
                                
                            </div>
                            <!-- End Product Images -->
                            
                            <!-- Product Description -->
                            <div class="col-sm-8 col-md-5 mb-xs-40">
                                
                                <h1 class="h3 mt-0">${mento.mentoId }</h1>
                                
                                <hr class="mt-0 mb-30 white" />
                                
                                <div class="row">
                                    <div class="col-6 lead mt-0 mb-20">
                                        <strong><i class="fa fa-won-sign"></i>${mento.price }</strong>
                                    </div>
                                    <div class="col-6 align-right gray">
                                        <i class="fa fa-hands-helping"></i>
                                        &nbsp;(${mento.people } menti)
                                    </div>
                                </div>
                                
                                <div class="gray mb-30" >
                                    ${mento.info }
                                </div>
                                
                                <hr class="mt-0 mb-30 white" /> 
                                <!-- 기간정하는 구간 -->
                                <div class="mb-30">
                                    <form method="post" action="mentoServInsert.do" class="form" id="frm">
                                    <div class="mb-20 mb-md-10">
                                    	<div>원하는 시간대를 정해주세요</div>
                                    	<div>
                                    	<!-- 시간 가져오기 -->
                                        <select class="form-control input-sm round" style="width: 150px" onchange="selectTime(this)" id="serviceStt" name="serviceStt">
                                        	<option>시작시간</option>
                                    	<c:forEach var="i" begin="${fn:substring(stT,0,2)}" end="${fn:substring(edT,0,2)-1}">
                                            <option value="${i}"><c:out value="${i}"/>:00</option>
                                        </c:forEach>
                                        </select>
                                        <select class="form-control input-sm round" style="width: 150px" id="serviceEdt" name="serviceEdt">
                                        	<option>종료시간</option>
                                        </select>
                                        </div>
                                    </div>
                                    <hr class="mt-0 mb-30 white" /> 
                                       <div class="mb-20 mb-md-10">
                                    	<div>원하는 기간를 정해주세요</div>
                                    	<div>
                                        <select class="form-control input-sm round" style="width: 150px" name="maxTerm">
                                            <option>${mento.maxTerm }</option>
                                            <c:if test="${!empty mento.maxTerm2 }">
                                            <option>${mento.maxTerm2 }</option>
                                            </c:if>
                                            <option>${mento.maxTerm3 }</option>
                                        </select>
                                        </div>
                                    </div>
                                    <hr class="mt-0 mb-30 white" />
                                        <button type="button" onclick="mentiCheck()"class="btn btn-mod btn-w btn-large btn-round">서비스신청</button> 
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
                
     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
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
                    chartData.push(["멘토평균",item.one]);
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
        	// 몇 시간인지 구하기.
        	var endTime = ${fn:substring(edT,0,2)};
        	// 시작시간값 가져오기
        	var startTime = parseInt(target.value);
        	// select 찾아서 값넣어주기
        	var timeSelect = document.getElementById('endTime');
        	$('#endTime').empty()
       		for(var i=startTime+1; i<endTime+1; i++) {
		        var option = document.createElement('option');
				option.value = i + ':00';
				option.innerText = i + ':00';
       			timeSelect.appendChild(option);
       		}
        }
        
        //신청정보 보내기
        function mentiCheck() {
        	
        }
    </script>
</body>
</html>