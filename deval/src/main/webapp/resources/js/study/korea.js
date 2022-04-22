window.onload = function() {
    drawMap('#container');
};

//지도 그리기
function drawMap(target) {
    var width = 700; //지도의 넓이
    var height = 700; //지도의 높이
    var initialScale = 5500; //확대시킬 값
    var initialX = -11900; //초기 위치값 X
    var initialY = 4050; //초기 위치값 Y
    var labels;

    var projection = d3.geo
        .mercator()
        .scale(initialScale)
        .translate([initialX, initialY]);
    var path = d3.geo.path().projection(projection);
    var zoom = d3.behavior
        .zoom()
        .translate(projection.translate())
        .scale(projection.scale())
        .scaleExtent([height, 800 * height])
        .on('zoom', zoom);

    var svg = d3
        .select(target)
        .append('svg')
        .attr('width', width + 'px')
        .attr('height', height + 'px')
        .attr('id', 'map')
        .attr('class', 'map')
        .on("click", function(){
            var id = event.target.id;
            var sp = id.indexOf('-')+1;
            var loc = id.substr(sp,id.length);
            console.log(loc)
            if(loc == 'Gangwon-do'){
                console.log('강원도')
            }
        });

    var states = svg
        .append('g')
        .attr('id', 'states')
        .call(zoom);

    states
        .append('rect')
        .attr('class', 'background')
        .attr('width', width + 'px')
        .attr('height', height + 'px');

    //geoJson데이터를 파싱하여 지도그리기
    d3.json('../resources/js/json/korea.json', function(json) {
        states
            .selectAll('path') //지역 설정
            .data(json.features)
            .enter()
            .append('path')
            .attr('d', path)
            .attr('id', function(d) {
                return 'path-' + d.properties.name_eng;
            });

        labels = states
            .selectAll('text')
            .data(json.features) //라벨표시
            .enter()
            .append('text')
            .attr('transform', translateTolabel)
            .attr('id', function(d) {
                return 'label-' + d.properties.name_eng;
            })
            .attr('text-anchor', 'middle')
            .attr('dy', '.35em')
            .text(function(d) {
                return d.properties.name;
            });
    });

    //텍스트 위치 조절 - 하드코딩으로 위치 조절을 했습니다.
    function translateTolabel(d) {
        var arr = path.centroid(d);
        if (d.properties.code == 31) {
            //서울 경기도 이름 겹쳐서 경기도 내리기
            arr[1] +=
                d3.event && d3.event.scale
                    ? d3.event.scale / height + 20
                    : initialScale / height + 20;
        } else if (d.properties.code == 34) {
            //충남은 조금 더 내리기
            arr[1] +=
                d3.event && d3.event.scale
                    ? d3.event.scale / height + 10
                    : initialScale / height + 10;
        }
        return 'translate(' + arr + ')';
    }

    function zoom() {
        projection.translate(d3.event.translate).scale(d3.event.scale);
        states.selectAll('path').attr('d', path);
        labels.attr('transform', translateTolabel);
    }
}


/*document.addEventListener("DOMContentLoaded", function() {
	drawMap('#container');
});

//지도 그리기
function drawMap(target) {
	var width = 700; //지도의 넓이
	var height = 700; //지도의 높이
	var initialScale = 5500; //확대시킬 값
	var initialX = -11900; //초기 위치값 X
	var initialY = 4050; //초기 위치값 Y
	var labels;

	var projection = d3.geo
		.mercator()
		.scale(initialScale)
		.translate([initialX, initialY]);
	var path = d3.geo.path().projection(projection);
	var zoom = d3.behavior
		.zoom()
		.translate(projection.translate())
		.scale(projection.scale())
		.scaleExtent([height, 800 * height])
		.on('zoom', zoom);

	var svg = d3
		.select(target)
		.append('svg')
		.attr('width', width + 'px')
		.attr('height', height + 'px')
		.attr('id', 'map')
		.attr('class', 'map')
		.on("click", function() {
			var id = event.target.id;
			var sp = id.indexOf('-') + 1;
			var loc = id.substr(sp, id.length);
			var location;
			console.log(id);
			
			$(".active").removeClass();
			$("#"+id).addClass("active");
			
			if (loc == 'Seoul') {
				location = '서울특별시';
				
			} else if (loc == 'Gyeonggi-do') {
				location = '경기도';

			} else if (loc == 'Incheon') {
				location = '인천광역시';

			} else if (loc == 'Gangwon-do') {
				location = '강원도';

			} else if (loc == 'Chungcheongbuk-do') {
				location = '충청북도';

			} else if (loc == 'Chungcheongnam-do') {
				location = '충청남도';

			} else if (loc == 'Sejong') {
				location = '세종특별자치시';

			} else if (loc == 'Daejeon') {
				location = '대전광역시';

			} else if (loc == 'Gyeongsangbuk-do') {
				location = '경상북도';

			} else if (loc == 'Gyeongsangnam-do') {
				location = '경상남도';

			} else if (loc == 'Daegu') {
				location = '대구광역시';

			} else if (loc == 'Ulsan') {
				location = '울산광역시';

			} else if (loc == 'Busan') {
				location = '부산광역시';

			} else if (loc == 'Jeollabuk-do') {
				location = '전라북도';

			} else if (loc == 'Jeollanam-do') {
				location = '전라남도';

			} else if (loc == 'Gwangju') {
				location = '광주광역시';

			} else {
				location = '제주특별자치도';
			}
			
			console.log(location);
			// 아작스에서 필요한 정보
			// return 검색 값, 페이징처리
			$("input[name=location]").val(location);

		});
	var states = svg
		.append('g')
		.attr('id', 'states')
		.call(zoom);

	states
		.append('rect')
		.attr('class', 'background')
		.attr('width', width + 'px')
		.attr('height', height + 'px');

	//geoJson데이터를 파싱하여 지도그리기
	d3.json('../resources/js/json/korea.json', function(json) {
		states
			.selectAll('path') //지역 설정
			.data(json.features)
			.enter()
			.append('path')
			.attr('d', path)
			.attr('id', function(d) {
				return 'path-' + d.properties.name_eng;
			});

		labels = states
			.selectAll('text')
			.data(json.features) //라벨표시
			.enter()
			.append('text')
			.attr('transform', translateTolabel)
			.attr('id', function(d) {
				return 'label-' + d.properties.name_eng;
			})
			.attr('text-anchor', 'middle')
			.attr('dy', '.35em')
			.text(function(d) {
				return d.properties.name;
			});
	});

	//텍스트 위치 조절 - 하드코딩으로 위치 조절을 했습니다.
	function translateTolabel(d) {
		var arr = path.centroid(d);
		if (d.properties.code == 31) {
			//서울 경기도 이름 겹쳐서 경기도 내리기
			arr[1] +=
				d3.event && d3.event.scale
					? d3.event.scale / height + 20
					: initialScale / height + 20;
		} else if (d.properties.code == 34) {
			//충남은 조금 더 내리기
			arr[1] +=
				d3.event && d3.event.scale
					? d3.event.scale / height + 10
					: initialScale / height + 10;
		}
		return 'translate(' + arr + ')';
	}

	function zoom() {
		projection.translate(d3.event.translate).scale(d3.event.scale);
		states.selectAll('path').attr('d', path);
		labels.attr('transform', translateTolabel);
	}
}

function locSearch(idx) {
	let tr = $("<tr>").attr('onclick', "studySearch(" + idx.studyNo + ")")

	var td1 = $("<td>").text(idx.studyNo)
	var td2 = $("<td>").text(idx.location)
	if (idx.lang2 == '') {
		var td3 = $("<td>").text(idx.lang1)
	} else {
		var td3 = $("<td>").text(idx.lang1 + " / " + idx.lang2)
	}
	var td4 = $("<td>").text(idx.studyNm)
	var td5 = $("<td>").text(idx.leaderId)
	var td6 = $("<td>").text(idx.defficulty)
	var td7 = $("<td>").text(idx.maxRcnt)
	var td8 = $("<td>").text(idx.studySdt + "~" + idx.studyEdt)
	if(idx.state == 2){
		var td9 = $("<td>").html('<p class="badge bg-warning text-dark">모집완료</p>')
	} else if(idx.state == 0) {
		var td9 = $("<td>").html('<p class="badge bg-success">모집중</p>')
	}

	tr.append(td1, td2, td3, td4, td5, td6, td7, td8, td9);
	return tr;
}*/