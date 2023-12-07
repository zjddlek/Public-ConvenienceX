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
	
	#select_date{
		padding-bottom: 20px;
		font-weight: bold;
	}
	
	.ui-datepicker-trigger{
		padding-left: 15px;
	}
	
	#date, #saleNo{
		cursor : pointer;
	}
	
	.index{
		border : 1px solid black;
		margin-right: 10px;
		height : 400px;
	}
	
	#history{
		overflow-y : scroll;
		overflow-x : hidden; 
		height : 247px;
	}
	
	#listHead{
		padding-bottom: 10px; 
		font-family:Gulim; 
		font-weight: bold;
		font-size: 15px; 
	}
	
	#salesDate{
		width : 200px;
	}
	
	.sale_list{
		margin-left: 10px;
	}
	
</style>
</head>
<body>
	<div class="container min-vw-75 justify-content-center" style="border:1px solid red; margin-top:30px; padding-bottom: 20px;">
		<h2>판매내역</h3>
		<div>
			<div class="picker">
				<div class="ui-block-a">
					<input type="text" id="datepicker" readonly="readonly">
		        </div>
			</div>
			
			<div style="display: flex;">
			
				<div class="index" style="width:140px;">
					<div class="sale_list">
						<h3 style="width:150px;">거래일자</h3>
						<div id="dateList" style="margin-left:10px;"></div>
					</div>
				</div>
				
				<div class="index" style=" width:50%">
					<div class="sale_list">
						<h3>판매일자</h3>
						<div id="select_date"></div>
						<div id="sales_list" style="display: none;"></div>
					</div>
				</div>
				
				<div class="index" style="width:50%">
					<div class="sale_list">
						<h3 id="select_no" style="font-weight: bold; margin-bottom: 15px;"></h3>
						<div id="detail_list" style="display: none;"></div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	
	$(function(){
		
	    // datepicker에 대한 공통 옵션 설정
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
	        ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	        ,maxDate: "0" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)      
	    });
	  	//input을 datepicker로 선언
	    $("#datepicker").datepicker();                    
	    
	    //초기값을 오늘 날짜로 설정
	    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	    
	    datepicker_init();
	
	}); //ready end

	
	// 날짜리스트 
	function datepicker_init(){
		var date = $("#datepicker").val();
		
		$.ajax({
			url : "ajax/salesAjaxDate.jsp",
			data : {
				"salesdate" : date
			},
			success:function(data){
				
				let obj = JSON.parse(data);
				
				$.each(obj, function(i, e){
					
					let msg = "<div class='date' id='date' onclick=goList(this,'" + e.sdate + "')>" + e.sdate + "</div>";				
					
					$("#dateList").append(msg);
				});
			}// success end
		});// ajax end
	} // function end
	
	
	// 날짜변경시 거래날짜 변경
	$("#datepicker").change(function(){
		var date = $("#datepicker").val();
		
		$.ajax({
			url : "ajax/salesAjaxDate.jsp",
			data : {
					"salesdate" : date
			},
			success:function(data){
					
				// #dateList 초기화
				$("#dateList *").remove();
				
				let obj = JSON.parse(data);
				
				$.each(obj, function(i, e){
					
					let msg = "<div class='date' id='date' onclick=goList(this,'" + e.sdate + "')>" + e.sdate + "</div>";
					$("#dateList").append(msg);
				});
			}
		});// ajax end
	}); // change 이벤트 end
	
	
	// 일자별 리스트
	function goList(obj, salesDate){
		
		// 선택안된 거래일자 굵기 기본
		$(".date").css("font-weight","normal");

		// 선택된 거래일자 굵기 변경
		$(obj).css("font-weight", "bold");
		
		// 판매리스트 보여주기
		$("#sales_list").show();
		
		$.ajax({
			url : "ajax/salesAjaxList.jsp",
			data : {
				"salesDate" : salesDate
			},
			success:function(data){
				console.log("data: "+data)
				
				$("#select_date").text(salesDate);
				
				let obj = JSON.parse(data);
				
				// 판매리스트 초기화
				$("#sales_list *").remove();
				
				let div = "";
				
				div += "<div class='row' id='listHead'>";
				div += "	<div class='col-sm-2'>거래번호</div>";
				div += "	<div class='col-sm-3'>거래날짜</div>";
				div += "	<div class='col-sm-2' style='margin-left:75px;'>가격</div>";
				div += "	<div class='col-sm-2'>결제수단</div>";
				div += "</div>";
				div += "<div id='history'>"; 
				$.each(obj, function(i, e){

					div += "<div class='row' id='listBody'>";
					div += " 		<div class='col-sm-2' id='saleNo' onclick=goDetail(this,'" + salesDate +"/" +e.saleno + "')>"+e.saleno+"</div>";
					div += "		<div class='col-sm-2' id='salesDate' >"+e.date+"</div>";
					div += "		<div class='col-sm-2' id='saleCost' style='margin-left: 20px;'>"+e.cost+"</div>";
					
					if(e.dealno == 1){
						div += "	<div class='col-sm-2' id='deal'style='margin-left: 20px;'>카드</div>";	
					}
					else if(e.dealno == 2){
						div += "	<div class='col-sm-2' id='deal'style='margin-left: 20px;'>현금</div>";
					}
					else{
						div += "	<div class='col-sm-2' id='deal' style='margin-left: 20px;'>상품권</div>";
					}
					
					div += "</div>";
				});				
				div += "</ div>";
				
				$('#sales_list').append(div);
			}// success end
		});// ajax end
	}
	
	// 상세
	function goDetail(e, saleno){
		
		console.log("saleno : " + saleno);
		
		let sdate = saleno.substr(0,10);
		let num = saleno.substr(11);
		
		// 선택안된 거래번호 굵기 기본
		$("#saleNo").css("font-weight","normal");

		// 선택된 거래번호 굵기 변경
		$(e).css("font-weight", "bold");
		
		// 판매리스트 보여주기
		$("#detail_list").show();
		
		$.ajax({
			url : "ajax/salesAjaxDetail.jsp",
			data : {
				"salesno" : num
			},
			success:function(data){
				console.log("detail data: "+data)
				
				$("#select_no").text(num);
				
				let obj = JSON.parse(data);
				
				// 판매리스트 초기화
				$("#detail_list *").remove();
				
				let div = "";
				
				div += "<div class='row'>";
				div += "	<div>거래날짜</div>";
				div += "	<div id='salesDate' styel='margin-bottom : 10px;'>"+sdate+"</div>";
				div += "</div>";
				
				div += "<br/>"
				
				div += "<div class='row'>";
				div += "	<div class='col-sm-3'>상품명</div>";
				div += "	<div class='col-sm-2' style='margin-left: 75px;'>판매수량</div>";
				div += "	<div class='col-sm-2'>가격</div>";
				div += "</div>";
				
				div += "<div calss='row'>";
				div += "	<div class='col-sm-2'>결제수단</div>";
				div += "</div>";
				
				//div += "<div id='history'>"; 
				$.each(obj, function(i, e){
					
					div += "<div class='row'>";
					div += "	<div class='col-sm-2' id='saleCost' style='margin-left: 20px;'>"+e.pname+"</div>";
					div += "	<div class='col-sm-2' id='saleCost' style='margin-left: 20px;'>"+e.cnt+"</div>";
					div += "	<div class='col-sm-2' id='saleCost' style='margin-left: 20px;'>"+e.cost+"</div>";
								
					/* div += "		<div class='col-sm-2' id='saleCost' style='margin-left: 20px;'>"+e.cost+"</div>";
					
					if(e.dealno == 1){
						div += "		<div class='col-sm-2' id='deal'style='margin-left: 20px;'>카드</div>";	
					}
					else if(e.dealno == 2){
						div += "		<div class='col-sm-2' id='deal'style='margin-left: 20px;'>현금</div>";
					}
					else{
						div += "		<div class='col-sm-2' id='deal' style='margin-left: 20px;'>상품권</div>";
					} */
					
					div += "</div>";
					
				});
				
				
				$('#detail_list').append(div);
				
				
			}// success end
			
		});// ajax end
		
	}
	

	
</script>