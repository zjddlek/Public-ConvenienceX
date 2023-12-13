<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<meta charset="UTF-8">
<title>매출현황 - JQUERY로 변경</title>

<%-- jquery --%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./style/profit.css" />

<style>
* {
	margin: 0;
	padding: 0
}

table {
	width: 100%;
	height: 500px;
	text-align: center !important;
}

.custom_calendar_table td {
	text-align: center;
}

.custom_calendar_table thead.cal_date th {
	font-size: 1.5rem;
}

.custom_calendar_table thead.cal_date th button {
	font-size: 1.5rem;
	background: none;
	border: none;
}

.custom_calendar_table thead.cal_week th {
	background-color: #288CFF;
	color: #fff;
}

.custom_calendar_table tbody td {
	cursor: pointer;
}

.custom_calendar_table tbody td:nth-child(1) {
	color: red;
}

.custom_calendar_table tbody td:nth-child(7) {
	color: #288CFF;
}

.custom_calendar_table tbody td.select_day {
	background-color: #288CFF;
	color: #fff;
}
</style>

<body>
	<jsp:include page="/main/nav.jsp"></jsp:include>
	<div class="container">
		<h3>매출현황</h3>

		<div id="calendarForm"></div>


	</div>
	<!-- container end -->
</body>
</html>

<script type="text/javascript">
	(function() {
		calendarMaker($("#calendarForm"), new Date());
	})();

	var nowDate = new Date();

	function calendarMaker(target, date) {

		if (date == null || date == undefined) {
			date = new Date();
		}

		nowDate = date;
		if ($(target).length > 0) {
			var year = nowDate.getFullYear();
			var month = nowDate.getMonth() + 1;
			$(target).empty().append(assembly(year, month));
		} else {
			console.error("custom_calendar Target is empty!!!");
			return;
		}

		var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
		var thisLastDay = new Date(nowDate.getFullYear(),
				nowDate.getMonth() + 1, 0);

		var tag = "<tr>";
		var cnt = 0;

		// 일자넣기에 ajax
		$.ajax({
					url : "ajax/profitAjaxMain.jsp",
					success : function(data) {

						let obj = JSON.parse(data.trim());
						
						
						var tag = "<tr>";
						
						//빈 공백 만들어주기
						for (i = 0; i < thisMonth.getDay(); i++) {
						    tag += "<td id='emp' style='border: 1px solid blue;'></td>";
						    cnt++;
						}
						
						var emptyColumn = cnt-1;
						
						//날짜 채우기
						var emptyrow = 0;
						var valueList = [];
						var pos = 0;
						
						for(var t=0; t<=emptyColumn; t++){
							valueList.push("");
						}
						
						$.each(obj, function(idx, e){
							valueList.push(e.calday);
						});
						
						console.log(valueList);
						
						for (i = 1; i <= thisLastDay.getDate(); i++) {
							
						    if ( cnt % 7 == 0) { 
						    	tag += "<tr>"; 
						    }
						    
						    tag += "<td id='days' style='border: 1px solid red;'>" + i + "</td>";
						    cnt++;
						    
						    if ( cnt % 7 == 0) {
						    	emptyrow++;
						        tag += "</tr>";
						        
						        // 한줄 끝나면 빈칸 한줄 추가하기 - 요기다 값 넣기!
							
						        tag += "<tr>";
							    // 빈칸 추가		
								for(var k = pos;k<(pos+7);k++){
										console.log(valueList[k]);
										tag += "<td>" + valueList[k] +"</td>";
										
								}
							    		pos = k ;
							    		tag += "</tr>";									
							}
						    
						    if(emptyrow == 5){
						    	tag += "<tr>";
						    	for(var k = pos; k<=thisLastDay.getDate() ;k++){
									console.log(valueList[k]);
									tag += "<td>" + valueList[k] +"</td>";
								}	
						    	tag += "</tr>";
						    }
						}	

						$(target).find("#custom_set_date").append(tag);
						calMoveEvtFn();
					}

				});

		/* var tag = "<tr>";
		var cnt = 0;
		//빈 공백 만들어주기
		for (i = 0; i < thisMonth.getDay(); i++) {
		    tag += "<td id='emp' style='border: 1px solid blue;'></td>";
		    cnt++;
		}
		
		//날짜 채우기
		var emptyrow = 1;
		for (i = 1; i <= thisLastDay.getDate(); i++) {
		    if ( cnt % 7 == 0) { 
		    		tag += "<tr>"; 
		    }
		    tag += "<td id='days' style='border: 1px solid red;'>" + i + "</td>";
		    cnt++;
		    if ( cnt % 7 == 0) {
		        tag += "</tr>";
		        // 한줄 끝나면 빈칸 한줄 추가하기 - 요기다 값 넣기!
		        tag += "<tr><td>     </td><td>    </td><td>    </td><td></td><td></td><td></td><td></td> </tr>"
		    }
		}	
		
		$(target).find("#custom_set_date").append(tag);
		calMoveEvtFn(); */

		function assembly(year, month) {
			var calendar_html_code = "<table class='custom_calendar_table'>"
					+ "	<colgroup>"
					+ "		<col style='width:81px'/>"
					+ "		<col style='width:81px'/>"
					+ "		<col style='width:81px'/>"
					+ "		<col style='width:81px'/>"
					+ "		<col style='width:81px'/>"
					+ "		<col style='width:81px'/>"
					+ "		<col style='width:81px'/>"
					+ "	</colgroup>"
					+ "	<thead class='cal_date'>"
					+ "		<th><button type='button' class='prev'><</button></th>"
					+ "		<th colspan='5'><p><span>"
					+ year
					+ "</span>년 <span>"
					+ month
					+ "</span>월</p></th>"
					+ "		<th><button type='button' class='next'>></button></th>"
					+ "	</thead>"
					+ "	<thead  class='cal_week'>"
					+ "		<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>"
					+ "	</thead>" + "	<tbody id='custom_set_date'>"
					+ "	</tbody>" + "</table>";
			return calendar_html_code;

		}// assembly end

		function calMoveEvtFn() {
			//전달 클릭
			$(".custom_calendar_table").on(
					"click",
					".prev",
					function() {
						nowDate = new Date(nowDate.getFullYear(), nowDate
								.getMonth() - 1, nowDate.getDate());
						calendarMaker($(target), nowDate);
					});

			//다음날 클릭
			$(".custom_calendar_table").on(
					"click",
					".next",
					function() {
						nowDate = new Date(nowDate.getFullYear(), nowDate
								.getMonth() + 1, nowDate.getDate());
						calendarMaker($(target), nowDate);
					});

			//일자 선택 클릭
			$(".custom_calendar_table").on(
					"click",
					"td",
					function() {
						$(".custom_calendar_table .select_day").removeClass(
								"select_day");
						$(this).removeClass("select_day")
								.addClass("select_day");
					});

		} // calMoveEvtFn end

	} //calendarMaker end
</script>
