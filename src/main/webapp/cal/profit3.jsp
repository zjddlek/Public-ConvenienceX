<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>매출현황</title>

<link href='fullcalendar/core/main.css' rel='stylesheet' />
<link href='fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='fullcalendar/timegrid/main.min.css' rel='stylesheet' />
<script src='fullcalendar/core/main.js'></script>
<script src='fullcalendar/daygrid/main.js'></script>
<script src="fullcalendar/interaction/main.min.js"></script>
<script src="fullcalendar/timegrid/main.min.js"></script>
<script src='fullcalendar/core/locales/ko.js'></script>

<%-- jquery --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%-- 부트스트랩 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<style>  
html, body {
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
}
#external-events {
  position: fixed;
  z-index: 2;
  top: 20px;
  left: 20px;
  width: 150px;
  padding: 0 10px;
  border: 1px solid #ccc;
  background: #eee;
}
.demo-topbar + #external-events { /* will get stripped out */
  top: 60px;
}
#external-events .fc-event {
  margin: 1em 0;
  cursor: move;
}
#calendar-container {
  position: relative;
  z-index: 1;
  margin-left: 200px;
}
#calendar {
  max-width: 900px;
  margin: 20px auto;
}

</style>

</head>

<body>
<div id="external-events">
    <p>
    	<strong>Draggable Events</strong>
    </p>
    
    <div class="fc-event">My Event 1</div>
    <div class="fc-event">My Event 2</div>
    <div class="fc-event">My Event 3</div>
    <div class="fc-event">My Event 4</div>
    <div class="fc-event">My Event 5</div>
    
    <p>
    	<input type="checkbox" id="drop-remove">
      	<label for="drop-remove">remove after drop</label>
    </p>
</div>
<div id='calendar'></div>

</body>

</html>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendarInteraction.Draggable;
 
    var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');
    var checkbox = document.getElementById('drop-remove');
 
    // initialize the external events
    // -----------------------------------------------------------------
 
    new Draggable(containerEl, {
      itemSelector: '.fc-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText
        };
      }
    });
 
    // initialize the calendar
    // -----------------------------------------------------------------
 
    var calendar = new Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar
      drop: function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      }
    });
 
    calendar.render();
  });
  
  var calendar = new Calendar(calendarEl, {
	  plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	  header: {
	    left: 'prev,next today',
	    center: 'title',
	    right: 'dayGridMonth,timeGridWeek,timeGridDay'
	  },
	  editable: true,
	  droppable: true, // this allows things to be dropped onto the calendar
	  drop: function(info) {
	    // is the "remove after drop" checkbox checked?
	    if (checkbox.checked) {
	      // if so, remove the element from the "Draggable Events" list
	      info.draggedEl.parentNode.removeChild(info.draggedEl);
	    }
	  },
	  locale: 'ko'
	});

	
</script>
