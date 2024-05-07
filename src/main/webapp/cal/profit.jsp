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

<body>
	<jsp:include page="/main/nav.jsp"></jsp:include>
	<div class="container" style="height: 800px;">
		<h3>매출현황</h3>
		<div id="calendarForm"></div>
	</div>
	<!-- container end -->
</body>
</html>

<script type="text/javascript">

	let sno = "${sno}";

	(function() {
		calendarMaker($("#calendarForm"), new Date());
	})();

	var nowDate = new Date();
	
	function calendarMaker(target, date) {

		if (date == null || date == undefined) {
			date = new Date();
		}

		let year = '';
		let month = '';
		nowDate = date;
		
		if ($(target).length > 0) {
			year = nowDate.getFullYear();
			month = nowDate.getMonth() + 1;
			
			$(target).empty().append(assembly(year, month));
			
		} else {
			console.error("custom_calendar Target is empty!!!");
			return;
		}

		// 현재의 달, 일자
		var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
		var thisLastDay = new Date(nowDate.getFullYear(),nowDate.getMonth()+1, 0);

		var tag = "<tr>";
		var cnt = 0;
		
		// 일자넣기에 ajax
		$.ajax({
			url : "ajax/profitAjaxMain.jsp",
			data : {
				"sno" : sno,
				"yyyymm" : year+"-"+month
			},
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
				
				for(var t = 0; t <= emptyColumn; t++){
					valueList.push("");
				}
				
				$.each(obj, function(idx, e){
					valueList.push(e.calday);
				});
				
				// 칸에 맞춰서 값에 공백추가 ---> 값이 0부터 시작됨
				/* if ( valueList.length >= 31 && valueList.length <= 34 ){
		    		for(var t = valueList.length; t <= 34; t++){
		    			valueList.push("");
					}
		    	} */
				
				for (i = 1; i <= thisLastDay.getDate(); i++) {
					
					if ( cnt % 7 == 0 ) { 
				    	tag += "<tr>"; 
				    }
				    
				    tag += "<td id='days' style='border: 1px solid red;'>" + i + "</td>";
				    cnt++;
				    
				    if ( cnt % 7 == 0) {
				    	emptyrow++;
				        tag += "</tr>";
				        
				        // 한줄 끝나면 빈칸 한줄 추가하기
				        tag += "<tr>";
					    	
						for(var k = pos; k < (pos+7); k++){
							tag += "<td id='td_"+k+"'>" + nvl(valueList[k]) +"</td>";
								
						}
				    	pos = k ;
				    	tag += "</tr>";
					}
				    
				    if(emptyrow == 5){
				    	tag += "<tr>";
				    	for(var k = pos; k <= thisLastDay.getDate(); k++){
							tag += "<td id='td_"+k+"'>" + nvl(valueList[k]) +"</td>";
						}	
				    	tag += "</tr>";
				    }
				}	
				
				// 줄이 4줄이면서 cnt가 30~35 사이인 경우 값추가
				if(emptyrow == 4 && ( cnt >= 30 && cnt <= 35 ) ){
			    	
			    	tag += "<tr>";
			    	
					for(var l = pos; l <= valueList.length-1; l++){			
						tag += "<td id='td_"+l+"'>" + nvl(valueList[l]) +"</td>";		
					}
					
				    tag += "</tr>";
			    }
				// 줄이 5줄이면서 cnt가 36~42 사이인 경우 값추가
				else if( emptyrow == 5 && ( cnt >= 36 && cnt <= 42 ) ){
					tag += "<tr>";
			    	
					for(var l = pos; l <= valueList.length-1; l++){			
						tag += "<td id='td_"+l+"'>" + nvl(valueList[l]) +"</td>";		
					}
					
				    tag += "</tr>";
				}

				$(target).find("#custom_set_date").append(tag);
				calMoveEvtFn();
			}
		});

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
			$(".custom_calendar_table").on("click",".prev",function() {
				nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
				calendarMaker($(target), nowDate);
			});

			//다음날 클릭
			$(".custom_calendar_table").on("click",".next",function() {
				nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
				calendarMaker($(target), nowDate);
			});

			//일자 선택 클릭
			$(".custom_calendar_table").on("click","td",function() {
				$(".custom_calendar_table .select_day").removeClass(
						"select_day");
				$(this).removeClass("select_day").addClass("select_day");
			});

		} // calMoveEvtFn end

	} //calendarMaker end
	
	function nvl(expr1) {
		if (expr1 === undefined || expr1 == null || expr1 == "" || expr1 == 0) {
			expr1 = "&nbsp;";
		}
		return expr1;
	}

</script>
