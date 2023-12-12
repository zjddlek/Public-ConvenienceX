<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sales</title>

<%-- jquery --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%-- datepicker --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="./style/sales.css" />

</head>
<body>
	<div class="container min-vw-75 justify-content-center" style="padding-bottom: 20px;">
		<jsp:include page="/main/nav.jsp"></jsp:include>
		
		<h2>판매내역</h2>
		<div>
			<div class="picker">
				<div class="ui-block-a">
					<input type="text" id="datepicker" readonly="readonly">
		        </div>
			</div>
			
			<div style="display: flex;">
			
				<div class="index" style="width:140px;">
					<div class="sale_list">
						<h3 style="width:150px; margin-top: 10px;">거래일자</h3>
						<div id="dateList" style="margin-left:10px;"></div>
					</div>
				</div>
				
				<div class="index" style="width:50%;">
					<div class="sale_list">
						<h3 style='margin-top: 10px;'>판매일자</h3>
						<div id="select_date"></div>
						<div id="sales_list" style="display: none;"></div>
					</div>
				</div>
				
				<div class="index" style="width:50%;">
					<div class="sale_list">
						<h3 style='margin-top: 10px;'>거래번호</h3>
						<div id="select_no" style="font-weight: bold;"></div>
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
		
		$("#product_name").tooltip();
		
	    // datepicker에 공통 옵션
	    $.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd'
	        ,showOtherMonths: true
	        ,showMonthAfterYear:true
	        ,changeYear: true
	        ,changeMonth: true                
	        ,showOn: "both"  
	        ,buttonImage: "./images/datepicker_img.PNG"
	        ,buttonImageOnly: true
	        ,buttonText: "선택"                
	        ,yearSuffix: "년"
	        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	        ,dayNamesMin: ['일','월','화','수','목','금','토']
	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
	        ,minDate: "-1Y" 
	        ,maxDate: "0"       
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
			}
		});
	} 
	

	// 날짜변경시 거래날짜 변경
	$("#datepicker").change(function(){
		var date = $("#datepicker").val();
		
		$.ajax({
			url : "ajax/salesAjaxDate.jsp",
			data : {
				"salesdate" : date
			},
			success:function(data){
					
				$("#dateList *").remove();
				
				let obj = JSON.parse(data);
				
				$.each(obj, function(i, e){
					
					let msg = "<div class='date' id='date' onclick=goList(this,'" + e.sdate + "')>" + e.sdate + "</div>";
					$("#dateList").append(msg);
				});
			}
		});
	});
	
	
	// 일자별 리스트
	function goList(obj, salesDate){
		$(".date").css("font-weight","normal");
		$(obj).css("font-weight", "bold");
		
		$("#sales_list").show();
		
		$.ajax({
			url : "ajax/salesAjaxList.jsp",
			data : {
				"salesDate" : salesDate
			},
			success:function(data){
				
				$("#select_date").text(salesDate);
				
				let obj = JSON.parse(data);
				
				// 판매리스트 초기화
				$("#sales_list *").remove();
				
				let div = "";
				
				div += "<div class='row' id='listHead'>";
				div += "	<div class='col-sm-2'>거래번호</div>";
				div += "	<div class='col-sm-3'>거래날짜</div>";
				div += "	<div class='col-sm-2' style='margin-left:75px;'>총액</div>";
				div += "	<div class='col-sm-2'>결제수단</div>";
				div += "</div>";
				div += "<div id='history'>";
				
				let sum = 0;
				$.each(obj, function(i, e){
					
					let saleCost = e.cost.toLocaleString('ko-KR'); 
					let total = e.total.toLocaleString('ko-KR'); 

					div += "<div class='row' id='listBody'>";
					div += " 		<div class='col-sm-2' id='saleNo' onclick=goDetail(this,'" + salesDate +"/" +e.saleno + "')>"+e.saleno+"</div>";
					div += "		<div class='col-sm-2' id='salesDate' >" + e.date + "</div>";
					div += "		<div class='col-sm-2' id='saleCost' style='margin-left: 20px;'>" + total + "</div>";
					
					if(e.dealno == 1){
						div += "	<div class='col-sm-2' id='deal'>카드</div>";	
					}
					else if(e.dealno == 2){
						div += "	<div class='col-sm-2' id='deal'>현금</div>";
					}
					else{
						div += "	<div class='col-sm-2' id='deal'>상품권</div>";
					}
					
					div += "</div>";
				});				
				div += "</ div>";
				
				$('#sales_list').append(div);
			}
		});
	}
	
	// 상세
	function goDetail(e, saleno){
		
		let sdate = saleno.substr(0,10);
		let num = saleno.substr(11);
		
		$("div[id='listBody']").css("font-weight","normal");
		$(e).parent().css("font-weight", "bold");
		
		$("#detail_list").show();
		
		$.ajax({
			url : "ajax/salesAjaxDetail.jsp",
			data : {
				"salesno" : num
			},
			success:function(data){
				
				$("#select_no").text(num);
				
				let obj = JSON.parse(data);
				
				// 판매리스트 초기화
				$("#detail_list *").remove();
				
				let div = "";
				
				div += "<br/>"
				div += "<div class='row' id='listHead'>";
				div += "	<div>거래날짜</div>";
				div += "	<div id='salesDate' styel='margin-bottom : 10px;'>"+sdate+"</div>";
				div += "</div>";
				
				div += "<div id='unit'>단위(원)</div>";
				div += "<div class='row' id='listHead'>";
				div += "	<div class='col-sm-3' id='ptitle'>상품명</div>";
				div += "	<div class='col-sm-2' style='padding-left: 20px;'>가격</div>";
				div += "	<div class='col-sm-2' style='margin-right: 10px;'>수량</div>";
				div += "	<div class='col-sm-2' style='padding-left: 20px;'>합계</div>";
				div += "	<div class='col-sm-2'>결제수단</div>";
				div += "</div>";
				
				div += "<div id='history2'>";
				
				let sum = 0;
				
				$.each(obj, function(i, e){
					sum += e.cost;
					
					let pname = e.pname;
					
					let price_consumer = e.price_consumer.toLocaleString('ko-KR');
					let cost = e.cost.toLocaleString('ko-KR');
					let cnt = e.cnt.toLocaleString('ko-KR');
					
					div += "<div class='row'>";
				    	
					if(pname.length >= 7){
						
						pname = pname.substr(0,6)+"...";
						div += "		<div class='col-lg-3' id='product_name' title='" + e.pname + "'>" + pname + "</div>";
					}
					else{ 
						div += "		<div class='col-lg-3' id='pname'>" + e.pname + "</div>";
					}
					
					div += "		<div class='col-sm-2' id='price_consumer' style='text-align: right;'>" + price_consumer + "</div>";
					div += "		<div class='col-sm-2' id='cnt'>" + cnt + "</div>";
					div += "		<div class='col-sm-2' id='cost' style='text-align: right;'>" + cost + "</div>";
					
					if(e.dealno == 1){
						div += "		<div class='col-sm-2' id='deal'>카드</div>";	
					}
					else if(e.dealno == 2){
						div += "		<div class='col-sm-2' id='deal'>현금</div>";
					}
					else{
						div += "		<div class='col-sm-2' id='deal'>상품권</div>";
					}
					
					div += "</div>";
				});
				
				sum = sum.toLocaleString('ko-KR');
				
				div += "<div class='row' id='listHead' style='margin-top:30px;'>";
				div += "	<div>총액</div>";
				div += "	<div>" + sum + "원</div>";
				div += "</div>";
				
				div += "</div>";
				$('#detail_list').append(div);
			}
		});
	}
</script>