<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html> 
<head> 
</head>
<meta charset="UTF-8">
<title>매출현황 - JQUERY로 변경</title>

<%-- jquery --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- fullcalendar CDN -->  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>  
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.css' rel='stylesheet' />

<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<link rel="stylesheet" href="./style/profit.css" />

<body>
	<div class="container">
		<jsp:include page="/main/nav.jsp"></jsp:include>
		<h3>매출현황</h3>
		
	    <div id='calendar-container'>    
	    	<div id='calendar'></div>
	    </div>

	</div>
</body>
</html>

<script type="text/javascript">
(function(){
	$(function(){
		// calendar element 취득
		var calendarEl = $('#calendar')[0];
		  
		var calendar = new FullCalendar.Calendar(calendarEl, {
			height: '700px',
			expandRows: true,
			slotMinTime : '08:00',
			slotMaxTime : '20:00',
			headerToolbar : {
				left : 'prevYear, prev, next, nextYear today',
				center : 'title',
				right : '' // 미사용
			},
			initialView : 'dayGridMonth',
			//initialDate : '2021-07-15',
			//navLinks : true,
			
			editable : true,
			selectable : true,
			nowIndicator : true,
			dayMaxEvents : true,
			locale: 'ko',
			
			//이벤트 추가시 발생되는 이벤트
			eventAdd: function(obj){ 
				
			},
			
			// 이벤트가 수정되면 발생하는 이벤트          
			eventChange: function(obj) {
				console.log(obj);        
			},
			
			// 이벤트가 삭제되면 발생하는 이벤트
			eventRemove: function(obj){
				console.log(obj);        
			},
			
			// 드래그로 이벤트 생성
			select: function(arg) {
				var title = prompt('Event Title: ');
				if( title ){
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
				}
				calendar.unselect()
			},
			
			//이벤트
			events : [{
				title : 'All Day Event',
				start: '2023-12-01'
			},{
				groupId: 999,
				title: 'Repeating Event',
				start: '2023-12-03T16:00:00'
			},{
				groupId: 999,
				title: 'Repeating Event',
				start: '2023-12-04T16:00:00'
			},{
				title: 'Conference',
				start: '2023-12-06',
				end: '2023-12-08'
			},{
				title: 'Click for Google',
				url: 'http://google.com/', // 클릭시 해당 url로 이동
				start: '2023-12-10'
			}]
		});	
		// 캘린더 랜더링
		calendar.render();
	});
})();
</script>	