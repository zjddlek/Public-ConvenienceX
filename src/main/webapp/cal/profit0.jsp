<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html> 
<head> 
</head>
<meta charset="UTF-8">
<title>매출현황</title>

<%-- jquery --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>


<style>
    #calendar {
        width: 80vw;
        height: 80vh;
    }

    #yrModal {
        position: fixed;
        width: 100%;
        height: 100%;
        background-color: rgba(50, 150, 150, 0.7);
        display: none;
        z-index: 1000;
    }

    #cont {
        margin: 50px auto;
        width: 50%;
        height: 70%;
        background-color: darkblue;
        color: yellow;
    }
    
    
    table{
    	border:1px solid red;
    }
    
    tr{
    	border:1px solid red;
    }
</style>

<body>
	<div class="container">
		<jsp:include page="/main/nav.jsp"></jsp:include>
		<!-- 실제 화면을 담을 영역 -->
	    <div id="Wrapper" style="display: flex;">
	        <div id='calendar'></div>
	        <div style="margin-top: 65px;">
	        	<table>
	        		<tr>
	        			<th>주간 매출</th>
	        		</tr>
	        		<tr>
	        			<td>11111</td>
	        		</tr>
	        		<tr>
	        			<td>11111</td>
	        		</tr>
	        		<tr>
	        			<td>11111</td>
	        		</tr>
	        		<tr>
	        			<td>11111</td>
	        		</tr>
	        		<tr>
	        			<th>월간 매출</th>
	        		</tr>
	        		<tr>
	        			<td>111111</td>
	        		</tr>
	        	</table>
	        </div>
	    </div>
	</div>
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,dayGridDay'
          },
          initialDate: '2023-01-12',
          navLinks: true, // can click day/week names to navigate views
          editable: true,
          dayMaxEvents: true, // allow "more" link when too many events
          events: [
            {
              title: 'All Day Event',
              start: '2023-01-01'
            },
            {
              title: 'Long Event',
              start: '2023-01-07',
              end: '2023-01-10'
            },
            {
              groupId: 999,
              title: 'Repeating Event',
              start: '2023-01-09T16:00:00'
            },
            {
              groupId: 999,
              title: 'Repeating Event',
              start: '2023-01-16T16:00:00'
            },
            {
              title: 'Conference',
              start: '2023-01-11',
              end: '2023-01-13'
            },
            {
              title: 'Meeting',
              start: '2023-01-12T10:30:00',
              end: '2023-01-12T12:30:00'
            },
            {
              title: 'Lunch',
              start: '2023-01-12T12:00:00'
            },
            {
              title: 'Meeting',
              start: '2023-01-12T14:30:00'
            },
            {
              title: 'Happy Hour',
              start: '2023-01-12T17:30:00'
            },
            {
              title: 'Dinner',
              start: '2023-01-12T20:00:00'
            },
            {
              title: 'Birthday Party',
              start: '2023-01-13T07:00:00'
            },
            {
              title: 'Click for Google',
              url: 'http://google.com/',
              start: '2023-01-28'
            }
          ]
        });

        calendar.render();
      });
    </script>
</body>

</html>