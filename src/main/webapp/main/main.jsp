<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style type="text/css">
	.wrap_head{
		height: 260px;
	}
	.img{
		background-image: url('./images/ConvenienceXLogo2.png');
			background-repeat: no-repeat;
			background-size: contain;
			background-position: center;
			height: 250px;
			width: 313px;
	}
	.date{
		font-size: 13px;
		color: black;
	}
	.time{
		font-size: 12;
		font-weight: bold;
		color: black;
	}
	p{
		font-size: 12;
		font-weight: bold;
		color: black;
	}
	.weatherImg{
			background-repeat: no-repeat;
			background-size: contain;
			background-position: center;
			height: 100px;
			width: 100px;
	}
</style>
<script type="text/javascript">
	function setClock(){
		var dateInfo = new Date();
		var hour = modifyNumber(dateInfo.getHours());
		var min = modifyNumber(dateInfo.getMinutes());
		var sec = modifyNumber(dateInfo.getSeconds());
		var year = dateInfo.getFullYear();
		var month = dateInfo.getMonth()+1
		var date= dateInfo.getDate();
		
		document.getElementById("time").innerHTML=hour+":"+min+":"+sec;
		document.getElementById("date").innerHTML=year+"년 "+month+"월 "+date+"일";	
	}
	function modifyNumber(time){
	    if(parseInt(time)<10){
	        return "0"+ time;
	    }
	    else
	        return time;
	}
	 function weatherUpdate(){
		$.ajax({
			url:"https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=1626c5e09b129d3b2c2e04890813be83",
			dataType: "json",
            type: "GET",
            async: "false",
            success: function(resp) {
                console.log(resp);
                console.log("현재온도 : "+ (resp.main.temp- 273.15) );
                console.log("현재습도 : "+ resp.main.humidity);
                console.log("날씨 : "+ resp.weather[0].main );
                console.log("상세날씨설명 : "+ resp.weather[0].description );
                console.log("날씨 이미지 : "+ resp.weather[0].icon );
                console.log("바람   : "+ resp.wind.speed );
                console.log("나라   : "+ resp.sys.country );
                console.log("도시이름  : "+ resp.name );
                console.log("구름  : "+ (resp.clouds.all) +"%" );   
                console.log(resp.weather[0].id);
                console.dir($("#weatherImg"));
                
                if(resp.weather[0].id == 800){
                	$("#weatherImg").attr("src","./images/sun.png");
                	temp.textContent = (resp.main.temp- 273.15).toFixed(1)+"°C";
                }else if(resp.weather[0].id >= 200 && resp.weather[0].id <= 599){
                	$("#weatherImg").attr("src","./images/rain.png");
                	temp.textContent = (resp.main.temp- 273.15).toFixed(1)+"°C";
                }else if(resp.weather[0].id >= 700 && resp.weather[0].id <= 804){
                	$("#weatherImg").attr("src","./images/cloud.png");
                	temp.textContent = (resp.main.temp- 273.15).toFixed(1)+"°C";
                }else if(resp.weather[0].id >= 600 && resp.weather[0].id <= 699){
                	$("#weatherImg").attr("src","./images/snow.png");
                	temp.textContent = (resp.main.temp- 273.15).toFixed(1)+"°C";
                } 
            }
			
		});
	} 
	
	window.onload = function(){
	    setClock();
	    weatherUpdate();
	    setInterval(setClock,1000);
	    setInterval(weatherUpdate, 600000);
	 
	}
	
	
		
		
		
	
	
</script>
</head>

<body>
	<div class="container">
		<div class="d-flex wrap_head" >
			<div class="col-md-4  d-flex align-items-center">
				<div  class="col-md-6 " >
					<div class="h-50">
						<div id="date" class="date form-floating"></div>
						<div id="time" class="time form-floating"></div>
					</div>	
					<div class="h-50 mt-5">
						<p>${svo.sname }</p>
					</div>			
				</div>
				<div  class="col-md-6 ">
					<div class="h-50">
						<div class="form-floating mb-10">
							<img class="weatherImg" id="weatherImg"  />
						</div>
					</div>
					<div class="h-50">

						<div class="form-floating mb-15">
							<span id="temp" class="form-floating"></span>
						</div>
					</div>
				</div>
				
					
					
				
			</div>
			<div class="col-md-4">
				<div class="img"></div>
			</div>
			<div class="col-md-4  d-flex justify-content-end">
				<div class="w-50 bg-warning " >
				
				</div>		
			</div>
				
		</div>
		<div class="wrap_nav">
			<jsp:include page="/main/nav.jsp"></jsp:include>
			<%-- 요기아래서부터 작업하시면 됩니다. --%>
		</div>
		<div class="wrap_contents d-flex">
			<div class="col-md-4 bg-danger">a</div>
			<div class="col-md-4 bg-warning">b</div>
			<div class="col-md-4 bg-primary">c</div>
		</div>
		
	</div>
</body>
</html>