<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폐기리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style type="text/css">
	#resultTable {
		width: 800px;
		margin: 0;
		padding-top: 100px;
	}

	.total {
	      display: flex;
	      flex-wrap: wrap;
	      gap: 5px;
	      flex-direction: row;
	   }
	
	#despose_search{
		float: right;
	}
	
	form{
		margin-bottom: 20px;
	}
	
	h3{
		text-align:center;
		margin-bottom: 20px !important;
	}
</style>

</head>
<body>
	<div class="container">
		<jsp:include page="/main/nav.jsp"></jsp:include> 
		
		<h3>폐기 검색 </h3>
	
		<form action="mc">
			<input type="hidden" name="type" value="disposeSearch"/>
			<span>날짜</span>
			<input type="text" name="date" id="date" placeholder="ex) 2023/11/01"/> 
			
			<span>점포 번호</span>
			<input type="text" name="shopNo" id="shopNo" placeholder="ex) 03485"/>
			<input type="submit" value="검색"/>
			
			<a href="/mc?type=expiredItems"><input type="button" id="despose_search" value="유통기한이 지난 상품 조회" /></a>
		</form>
		
		<div class="total">
			<div id="myBarChart" class="border">
			</div>
			<div class="container-sm" id="resultTable">
				<table class="table table-striped" ></table>
			</div>
		</div>
	</div>	
<script>
	if(${param.date} != null){
  		  google.charts.load('current', {packages: ['corechart']});
   		  google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      // Define the chart to be drawn.
      var data = new google.visualization.arrayToDataTable([
    	['날짜', '합계 금액'],
    	${chartdate}
      ]);
      
      var options = {
    		  'title': '일별 폐기 금액',
    		  'width': 680,
    		  'height': 750, 
    		  'vAxis' : {title: '날짜'},
    		  'hAxis' : {title: '폐기 금액'}
      };

      var chart = new google.visualization.BarChart(document.getElementById('myBarChart'));
      
      function selectHandler(){
      	var selection = chart.getSelection()[0];
      	var totalsum = data.getValue(selection.row, 1);
      	var selecteValue = data.getValue(selection.row, 0);
      	//console.log(selecteValue);
      	
      	 	 $.ajax({
      			url:"ajax/discardAjaxDayList.jsp",
      			type: "GET",
      			data: {
      					date: selecteValue,
      					sno: $("#shopNo").val()
      					}, 
      			success: function (data){
      				 let obj = JSON.parse(data); 
      				
      					$("table").empty();
      					
      					$("table").append(
				      						"<tr><th>폐기 번호</th>"
				      						+"<th>재고 번호</th>"
				      						+"<th>제품명</th>"
				      						+"<th>개수</th>"
				      						+"<th>제품가격</th>"
				      						+"<th>합계</th>"
				      						+"<th>제조회사명</th></tr>");
      					
      					var currentDate= null;
      					
      				$.each(obj, function(index, dispose){
      					currentDate=dispose.discardDate;
      					
      					$("table").append(
     										"<tr><td>"+dispose.discardNo+"</td>"
     										+"<td>"+dispose.stockNO+"</td>"
     										+"<td>"+dispose.pName+"</td>"
     										+"<td>"+dispose.discardCount+"</td>"
     										+"<td>"+dispose.priceServer+"</td>"
     										+"<td>"+dispose.sum+"</td>"
     										+"<td>"+dispose.accName+"</td></tr>");
      					});
      				
      					$("table").append("<caption align='top'>"+currentDate+"</catption>")
      					$("table").append(
      										"<tr><td colspan='5'>총합</td>"
      										+"<td colspan='2'>"+totalsum
      										+"</td></tr>");
      				}//success end
      			});//ajax end
      	 
   		   }//handler end
      
   		 google.visualization.events.addListener(chart, 'select', selectHandler);
   	     chart.draw(data, options);
    	}//drawChart() end
      
	}
</script>
</body>
</html>