<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="./style/nav.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<style type="text/css">
.wrap_head {
	height: 260px;
}

.img {
	background-image: url('./images/ConvenienceXLogo2.png');
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center;
	height: 250px;
	width: 313px;
}

.date {
	font-size: 13px;
	color: black;
}

.time {
	font-size: 12;
	font-weight: bold;
	color: black;
}

p {
	font-size: 12;
	font-weight: bold;
	color: black;
}

.weatherImg {
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center;
	height: 100px;
	width: 100px;
}

#temp {
	font-size: 12;
	font-weight: bold;
	color: black;
}
</style>
<script type="text/javascript">
	function setClock() {
		var dateInfo = new Date();
		var hour = modifyNumber(dateInfo.getHours());
		var min = modifyNumber(dateInfo.getMinutes());
		var sec = modifyNumber(dateInfo.getSeconds());
		var year = dateInfo.getFullYear();
		var month = dateInfo.getMonth() + 1
		var date = dateInfo.getDate();

		document.getElementById("time").innerHTML = hour + ":" + min + ":"
				+ sec;
		document.getElementById("date").innerHTML = year + "년 " + month + "월 "
				+ date + "일";
	}
	function modifyNumber(time) {
		if (parseInt(time) < 10) {
			return "0" + time;
		} else
			return time;
	}
	function weatherUpdate() {
		$.ajax({
					url : "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=1626c5e09b129d3b2c2e04890813be83",
					dataType : "json",
					type : "GET",
					async : "false",
					success : function(resp) {
						/* console.log(resp);
						console.log("현재온도 : " + (resp.main.temp - 273.15));
						console.log("현재습도 : " + resp.main.humidity);
						console.log("날씨 : " + resp.weather[0].main);
						console.log("상세날씨설명 : " + resp.weather[0].description);
						console.log("날씨 이미지 : " + resp.weather[0].icon);
						console.log("바람   : " + resp.wind.speed);
						console.log("나라   : " + resp.sys.country);
						console.log("도시이름  : " + resp.name);
						console.log("구름  : " + (resp.clouds.all) + "%");
						console.log(resp.weather[0].id);
						console.dir($("#weatherImg")); */

						if (resp.weather[0].id == 800) {
							$("#weatherImg").attr("src", "./images/sun.png");
							temp.textContent = (resp.main.temp - 273.15)
									.toFixed(1)
									+ "°C";
						} else if (resp.weather[0].id >= 200
								&& resp.weather[0].id <= 599) {
							$("#weatherImg").attr("src", "./images/rain.png");
							temp.textContent = (resp.main.temp - 273.15)
									.toFixed(1)
									+ "°C";
						} else if (resp.weather[0].id >= 700
								&& resp.weather[0].id <= 804) {
							$("#weatherImg").attr("src", "./images/cloud.png");
							temp.textContent = (resp.main.temp - 273.15)
									.toFixed(1)
									+ "°C";
						} else if (resp.weather[0].id >= 600
								&& resp.weather[0].id <= 699) {
							$("#weatherImg").attr("src", "./images/snow.png");
							temp.textContent = (resp.main.temp - 273.15)
									.toFixed(1)
									+ "°C";
						}
					}

				});
	}

	window.onload = function() {
		setClock();
		weatherUpdate();
		setInterval(setClock, 1000);
		setInterval(weatherUpdate, 600000);

	}
	
</script>
</head>

<body>
	<div class="container">
		<div class="d-flex wrap_head">
			<div class="col-md-4  d-flex align-items-center">
				<div class="col-md-6 ">
					<div class="h-50">
						<div id="date" class="date form-floating"></div>
						<div id="time" class="time form-floating"></div>
					</div>
					<div class="h-50 mt-5">
						<p>${svo.sname }</p>
					</div>
				</div>
				<div class="col-md-6 ">
					<div class="h-50">
						<div class="form-floating mb-10">
							<img class="weatherImg" id="weatherImg" /> <span id="temp"
								class="form-floating"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="img"></div>
			</div>
			<div class="col-md-4  d-flex justify-content-end align-items-center">
				<div class="w-75 ">
					<div class="form-control ">
						<textarea name="alert" class="form-control" id="" cols="10"
							rows="5" readonly>알림창입니다.</textarea>
					</div>
				</div>
			</div>

		</div>
		<div class="wrap_nav">
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav" style="justify-content: center">
						<img src="./images/conveni.PNG" alt="" />
						<ul class="navbar-nav">
							<li class="nav-item">
								<a class="nav-link" href="mc?type=main">메인 페이지</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="mc?type=sales&sno=${svo.sno }">판매 관리</a></li>
							<li class="nav-item">
								<a class="nav-link" href="mc?type=orders&sno=${svo.sno }">발주</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="mc?type=stock&sno=${svo.sno }">재고관리</a>
							</li>
							<li class="nav-item dropdown">
				          		<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="">정산</a>
				          		<div class="dropdown-menu" >
				          			<a href="mc?type=calList&sno=${svo.sno }" class="dropdown-item">중간/마감 이력</a>
				          			<div class="dropdown-divider"></div>
		                            <a href="mc?type=profit&sno=${svo.sno }" class="dropdown-item">매출 현황</a>
			          			</div>
		        			</li>
							<li class="nav-item">
								<a class="nav-link" href="mc?type=dispose&sno=${svo.sno }">폐기</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="mc?type=emp&sno=${svo.sno }&jobno=${vo.jobno }">인사관리</a>
							</li>
							<li class="nav-item">
								<a class="nav-link"href="mc?type=workmain&sno=${svo.sno }">출퇴근</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="mc?type=etc">부대비용관리 - 작업x</a>
							</li>

						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="wrap_contents d-flex align-items-center">
			<div class="col-md-4">
				<div class="h-50">
					<table class="table table-hover table-sm">
						<tr>
							<th colspan=3>본사 공지</th>
						</tr>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일자</th>
						</tr>
						<tr>
							<td>1</td>
							<td>신규오픈</td>
							<td>2023-12-12</td>
						</tr>
						<tr>
							<td>2</td>
							<td>신규오픈</td>
							<td>2023-12-12</td>
						</tr>
						<tr>
							<td>3</td>
							<td>신규오픈</td>
							<td>2023-12-12</td>
						</tr>
						<tr>
							<td>4</td>
							<td>신규오픈</td>
							<td>2023-12-12</td>
						</tr>
						<tr>
							<td>5</td>
							<td>신규오픈</td>
							<td>2023-12-12</td>
						</tr>
					</table>
				</div>
				<div class="h-50 mt-3">
					<table class="table table-hover table-sm">
						<tr>
							<th colspan=3>점포 공지</th>
						</tr>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일자</th>
						</tr>
						<tr>
							<td>1</td>
							<td>정산처리 꼼꼼히!</td>
							<td>2023-12-12</td>
						</tr>
						<tr>
							<td>2</td>
							<td>특이사항 적어놓기!</td>
							<td>2023-12-12</td>
						</tr>
						<tr>
							<td>3</td>
							<td>특이사항 적어놓기!</td>
							<td>2023-12-12</td>
						</tr>
						<tr>
							<td>4</td>
							<td>특이사항 적어놓기!</td>
							<td>2023-12-12</td>
						</tr>
						<tr>
							<td>5</td>
							<td>신규오픈</td>
							<td>2023-12-12</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-4">
				<canvas id="pie-chart" width="300" height="300"></canvas>
			</div>
			<div class="col-md-4 ">
				<canvas id="line-chart" width="450" height="450"></canvas>
			</div>
		</div>

	</div>
	
	<div id="first" style="display:none;">
		<c:forEach var="vo" items="${firstList }">
		<span>${vo.saleamount }</span>
		</c:forEach>
	</div>
	<div id="second" style="display:none;">
		<c:forEach var="vo" items="${secondList }">
		<span>${vo.saleamount }</span>
		</c:forEach>
	</div>
	
	
</body>
<script>
	//서브카테고리 매출액 탑5 이름,값
 	let sc_TOP1 = "${SCSlist[0].scname}";
	let sc_TOP2 = "${SCSlist[1].scname}";
	let sc_TOP3 = "${SCSlist[2].scname}";
	let sc_TOP4 = "${SCSlist[3].scname}";
	let sc_TOP5 = "${SCSlist[4].scname}";
	
	
	let sc_TOP1_Sales=${SCSlist[0].sum};
	let sc_TOP2_Sales=${SCSlist[1].sum};
	let sc_TOP3_Sales=${SCSlist[2].sum};
	let sc_TOP4_Sales=${SCSlist[3].sum};
	let sc_TOP5_Sales=${SCSlist[4].sum}; 
	
	//지난 2주간 요일별 매출액
	var lastweek = new Array();
	$("#first span").each((idx, el) => {
		let saleamount = $(el).text();
		lastweek.push(saleamount);
	});
	var thisweek = new Array();
	$("#second span").each((idx, el) => {
		let saleamount = $(el).text();
		thisweek.push(saleamount);
	});
	


	//파이 그래프
	new Chart(document.getElementById("pie-chart"), {
	    type: 'pie',
	    data: {
	      labels: [sc_TOP1,sc_TOP2,sc_TOP3,sc_TOP4,sc_TOP5],
	      datasets: [{
	        label: "Population (millions)",
	        backgroundColor: ["#3678F1", "#9591D9","#F19292","#FFE155","#EB731C"],
	        
	        data: [sc_TOP1_Sales,sc_TOP2_Sales,sc_TOP3_Sales,sc_TOP4_Sales,sc_TOP5_Sales]
	      }]
	    },
	    options: {
		      title: {
		        display: true,	        
		        text: '월간 매출 품목 TOP5'
		      }
	    }
	});
	
	
	//라인 차트
	new Chart(document.getElementById("line-chart"), {
	  type: 'line',
	  data: {
	    labels: ['일','월','화','수','목','금','토'],
	    datasets: [{ 
	        data: thisweek,
	        label: "이번주",
	        borderColor: "#98E294",
	        fill: false
	        
	      }, { 
	        data: lastweek,
	        label: "지난주",
	        borderColor: "#3DDAEE",
	        fill: false
	      }
	    ]
	  },
	  options: {
	    title: {
	    	display: true,
	    	text: '일별 매출액 비교'
	    }
	  }
	});
	
</script>
</html>