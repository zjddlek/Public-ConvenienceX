<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html> 
<head> 
</head>
<meta charset="UTF-8">
<title>재고현황</title>

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
		<!-- 실제 화면을 담을 영역 -->
	    <div id="Wrapper" style="display: flex;">
	        <div id='calendar'></div>
	        <div>
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
        const calendarEl = document.querySelector('#calendar');
        const mySchStart = document.querySelector("#schStart");
        const mySchEnd = document.querySelector("#schEnd");
        const mySchTitle = document.querySelector("#schTitle");
        const mySchAllday = document.querySelector("#allDay");
        const mySchBColor = document.querySelector("#schBColor");
        const mySchFColor = document.querySelector("#schFColor");

        //캘린더 헤더 옵션
        const headerToolbar = {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,timeGridDay'
        }

        // 캘린더 생성 옵션(참공)
        const calendarOption = {
            height: '700px', // calendar 높이 설정
            expandRows: true, // 화면에 맞게 높이 재설정
            slotMinTime: '09:00', // Day 캘린더 시작 시간
            slotMaxTime: '18:00', // Day 캘린더 종료 시간
            // 맨 위 헤더 지정
            headerToolbar: headerToolbar,
            initialView: 'dayGridMonth',  // default: dayGridMonth 'dayGridWeek', 'timeGridDay', 'listWeek'
            locale: 'kr',        // 언어 설정
            selectable: true,    // 영역 선택
            selectMirror: true,  // 오직 TimeGrid view에만 적용됨, default false
            navLinks: true,      // 날짜,WeekNumber 클릭 여부, default false
            weekNumbers: true,   // WeekNumber 출력여부, default false
            editable: true,      // event(일정) 
            /* 시작일 및 기간 수정가능여부
            eventStartEditable: false,
            eventDurationEditable: true,
            */
            dayMaxEventRows: true,  // Row 높이보다 많으면 +숫자 more 링크 보임!
            /*
            views: {
                dayGridMonth: {
                    dayMaxEventRows: 3
                }
            },
            */
            nowIndicator: true,
            //events:[],
            eventSources: [
                './commonEvents.json',  // Ajax 요청 URL임에 유의!
                './KYREvents.json',
                './SYREvents.json'
            ]
        }

        // 캘린더 생성
        const calendar = new FullCalendar.Calendar(calendarEl, calendarOption);

        // 캘린더 그리깅
        calendar.render();

        // 캘린더 이벤트 등록
        calendar.on("eventAdd", info => console.log("Add:", info));
        calendar.on("eventChange", info => console.log("Change:", info));
        calendar.on("eventRemove", info => console.log("Remove:", info));
        calendar.on("eventClick", info => {
            console.log("eClick:", info);
            console.log('Event: ', info.event.extendedProps);
            console.log('Coordinates: ', info.jsEvent);
            console.log('View: ', info.view);
            // 재미로 그냥 보더색 바꾸깅
            info.el.style.borderColor = 'red';
        });
        calendar.on("eventMouseEnter", info => console.log("eEnter:", info));
        calendar.on("eventMouseLeave", info => console.log("eLeave:", info));
        calendar.on("dateClick", info => console.log("dateClick:", info));
        calendar.on("select", info => {

            mySchStart.value = info.startStr;
            mySchEnd.value = info.endStr;

            YrModal.style.display = "block";
        });

        // 일정(이벤트) 추가하깅
        function fCalAdd() {
            if (!mySchTitle.value) {
                alert("제모게 머라도 써주삼")
                mySchTitle.focus();
                return;
            }
            let bColor = mySchBColor.value;
            let fColor = mySchFColor.value;
            if (fColor == bColor) {
                bColor = "black";
                fColor = "yellow";
            }

            let event = {
                start: mySchStart.value,
                end: mySchEnd.value,
                title: mySchTitle.value,
                allDay: mySchAllday.checked,
                backgroundColor: bColor,
                textColor: fColor
            };

            calendar.addEvent(event);
            fMClose();
        }

        // 모달 닫기
        function fMClose() {
            YrModal.style.display = "none";
        }
        
      //이벤트 업데이트!, 이벤트소스 다시 가져와서 다시 그리깅
       function fCalUpdate() {
           console.log("흥치치");
           calendar.refetchEvents();
       }
    </script>
</body>

</html>