<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폐기리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style type="text/css">
	#resultTable {
		margin: 0;
		padding-top: 20px;
	}

	#myColumnChart{
		textaling: center;
		padding-left: 50px;
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
<script type="text/javascript">
	$(()=>{
		$("#next").click(function(){
			if($("#datepicker").val()==""){
				alert("날짜를 선택해 주세요");
				return false;
			}
			$("#nextForm").submit();
		});
	
	})
</script>
</head>
<body>
	<jsp:include page="/main/nav.jsp"></jsp:include> 
	<div class="container">
		
		<h3>폐기 검색 </h3>
	
		<form id ="nextForm" action="mc">
			<input type="hidden" name="type" value="disposeSearch"/>
			<span>날짜</span>
			<input type="date" name="date" id="datepicker" />
			<!-- <input type="text" name="date" id="date" placeholder="ex) 2023-11-01"/>  -->
			<input type="hidden" name="sno" value="${svo.sno }"/>
			<input id="next" type="button" value="검색"/>
			
			<a href="mc?type=expiredItems&sno=${svo.sno }"><input type="button" id="despose_search" value="유통기한 지난 상품 조회" /></a>
		</form>
		
		
			<div id="myColumnChart" ></div>
			<div id="resultTable">
				<table class="table table-striped table-sm" ></table>
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
    		  title: '일별 폐기 금액',
    		  width: 1280,
    		  height: 400, 
    		  vAxis : {title: '날짜'},
    		  hAxis : {title: '폐기 금액'},
    		  legend:'none'
      };

      var chart = new google.visualization.ColumnChart(document.getElementById('myColumnChart'));
      
      function selectHandler(){
      	var selection = chart.getSelection()[0];
      	var totalsum = data.getValue(selection.row, 1);
      	var selecteValue = data.getValue(selection.row, 0);
      	
      	//console.log(${svo.sno });
      	
      	 	 $.ajax({
      			url:"ajax/discardAjaxDayList.jsp",
      			type: "GET",
      			data: {
      					date: selecteValue,
      					sno: ${svo.sno }
      					}, 
      			success: function (data){
      				 let obj = JSON.parse(data); 
      					
      					$("table").empty();
      					
      					$("table").append(
				      						"<tbody>"
				      						+"<tr><th>폐기 번호</th>"
				      						+"<th>재고 번호</th>"
				      						+"<th>제품명</th>"
				      						+"<th>개수</th>"
				      						+"<th>제품가격</th>"
				      						+"<th>합계</th>"
				      						+"<th>제조사</th></tr>");
      					
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
      										+"<td colspan='2'>"+totalsum+"원"
      										+"</td></tr></tbody>");
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