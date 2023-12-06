<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sales</title>

<%-- jquery --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<%-- 부트스트랩 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%-- datepicker --%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style>
	.container{
		padding-top: 30px;	
	}
	
	h2{
		text-align: center;
		font-weight:bold;
		margin-bottom: 15px;
	}
	
	.picker{
		padding-bottom: 15px;
	}
	
	h3{
		text-decoration: underline;
	}
	
	.ui-datepicker-trigger{
		padding-left: 15px;
	}
	
	#date{
		cursor : pointer;
	}
	
</style>
</head>
<body>
	<div class="container">
		<h2>판매내역</h3>
		<div>
			<div class="picker">
				<div class="ui-block-a">
					<input type="text" id="datepicker" readonly="readonly">
		        </div>
			</div>
			
			<div class="row">
				<div class="col-md-2" style="border:1px solid black;">
					<h3>거래날짜</h3>
					<div id="dateList">
						<%-- <c:forEach var="vo" items="${list }" varStatus="index">
							<div id="date_list_${index.index}" style="cursor : pointer;">
								${vo.salesdate }
							</div>
						</c:forEach> --%>
					
					<%-- 
						<c:forEach var="vo" items="${list }">
							<div id="date_list">
								<a style="text-decoration: none;" href="mc?type=sales_list&no=${vo.saleno }&date=${vo.salesdate}"> ${vo.salesdate } </a>
							</div>
						</c:forEach> --%>
					</div>
				</div>
				
				<div class="col-md-6" style="border:1px solid black;">
					<h3>판매일자</h3>
					<div>${salesdate}</div>
					<div id="sales_list">
						<c:forEach var="vo" items="${s_list }" varStatus="count">
							<div>
								<a href="mc?type=sales_detail&no=${vo.saleno }&date=${vo.salesdate}"> ${vo.salesdate } </a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-md-4" style="border:1px solid black;">
					<h3>상세내역</h3>
					<div id="detail"></div>
				</div>
			</div>
			
			<%-- 페이징 --%>
			<%-- <div>
				<nav aria-label="Page navigation example">
					<ul class="pagination">	
						<li class="page-item">
							<a class="page-link" href="#">Previous</a>
						</li>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li class="page-item">
								<a class="page-link" href="mc?type=sales&cp=${i}">${i}</a>
							</li>
						</c:forEach>		
										        
						<li class="page-item">
							<a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav>					
			</div> --%>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	
	// 전역변수
	let salesNo = '';
	let salesDate = '';
	
	const d = new Date();
	
	//오늘의 년, 월, 일 데이터
	const day = d.getDate();
	const month = d.getMonth();
	const year = d.getFullYear();
	
	$(function(){
	    //모든 datepicker에 대한 공통 옵션 설정
	    $.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd' //Input Display Format 변경
	        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	        ,changeYear: true //콤보박스에서 년 선택 가능
	        ,changeMonth: true //콤보박스에서 월 선택 가능                
	        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	        //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	        ,buttonImage: "./images/datepicker_img.PNG" //버튼 이미지 경로
	        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	        ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	        ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
	    });
	  	//input을 datepicker로 선언
	    $("#datepicker").datepicker();                    
	    $("#datepicker2").datepicker();
	    
	    //From의 초기값을 오늘 날짜로 설정
	    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	    //To의 초기값을 내일로 설정
	    $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	    
	    datepicker_init();
	
	}); //ready end

	//일주일 전 구하기
	//var week_ago = new Date(new Date().setDate(day - 7)).toLocaleDateString();
	
	function datepicker_init(){
		
		$.ajax({
			url : "ajax/salesAjaxDate.jsp",
			success:function(data){
				
				let dateList = data.trim().split(",");
				
				$.each(dateList, function(index, element){
					salesDate = element.substr(0,12);
					salesNo = element.substr(11);
					
					console.log("salesDate : " + salesDate);
					
//					$("#dateList").append("<div id='date' onclick='goList("+salesNo+");'>" + salesDate + "</div>");
					$("#dateList").append("<div id='date' onclick='goList("+salesDate+");'>" + salesDate + "</div>");
				});
				
				
			}// success end
			
		});// ajax end
		
	} // datepicker_init end

	
	function goList(salesDate){
		
		console.log("salesDate> " + salesDate);
		
		
		$.ajax({
			url : "ajax/salesAjaxList.jsp",
			data : {
				"salesDate" : salesDate
			},
			success:function(data){
				console.log("data: "+data)
				
				/* let dateList = data.trim().split(",");
				
				$.each(dateList, function(index, element){
					$("#dateList").append("<div id='date' onclick='goList("+index+','+element+");'>" + element + "</div>");
				}); */
				
				
			}// success end
			
		});// ajax end
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* $("#datepicker").change(function(){
		var date = $("#datepicker").val();
		
		$.ajax({
			url : "./mc",
			data : {
					type : "sales"
			},
			success:function(data){
				
				//console.log(data);
				
			}
			
		});// ajax end
		
	}); */

	
</script>