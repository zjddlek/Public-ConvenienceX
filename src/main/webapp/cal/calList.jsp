<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>정산 이력</title>
</head>
<script>


	
$(document).ready(function(){
	getList();
});

	function getList(){
		
		$.ajax({
			url:"ajax/profitListAjax.jsp",
		
			success:function(data){
				
				let obj = JSON.parse(data);

				let calno = '';
				let attno = '';
				let calculate = '';
				let time = '';
				let amount = '';
				let diff = '';
				
				$.each(obj, function(i,e){
					calno += "<div id='cno'>"+e.calno+"</div>";
					attno += "<div id='attno'>"+e.attno+"</div>";
					
					if(e.calculate == 1){						
						calculate += "<div id='cal'>중간정산</div>";
					}
					else if(e.calculate == 2){
						calculate += "<div id='cal'>마감정산</div>";
					}
					time += "<div id='time'>"+e.caltime+"</div>";
					amount += "<div id='amount'>"+e.salesamount+"</div>";
					diff += "<div id='diff'>"+e.difference+"</div>";
					
				});
				
				$("#calno_list").append(calno);
				$("#attno_list").append(attno);
				$("#calculate_list").append(calculate);
				$("#caltime_list").append(time);
				$("#salesamount_list").append(amount);
				$("#difference_list").append(diff);
			 },
             error:function(){
                 console.log("통신에러");	
			}
		})
	}

</script>
<body>

	<div class="container" style="padding-bottom: 20px;">
		<h2>정산 이력</h2>
		<form action="">
			<div>
				<div style="display: flex;">
					<div class="target-select__elements--control"
						style="margin-bottom: 10px; margin-right: 10px;">
						<div class="dropdown input-dropdown">
							<input type="month" />

						</div>
					</div>
				</div>



				<table class="table table-hover table-striped table-bordered">
					<thead>
					<tr>
						<th>상품번호</th>
						<th>근태관리번호</th>
						<th>정산구분</th>
						<th>정산시간</th>
						<th>매출액</th>
						<th>차액</th>
					</tr>
					</thead>
					<tbody class="table_body">
					<tr>
						<td id="calno_list"></td>
						<td id="attno_list"></td>
						<td id="calculate_list"></td>
						<td id="caltime_list"></td>
						<td id="salesamount_list"></td>
						<td id="difference_list"></td>
					</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>

</body>

<script>

let todoData=[];
const recordPerPage=15; //페이지당 몇줄?
const totalPage=5; //화면에 보이는 페이지 번호 갯수

const currentPage=0;//현재 페이지번호
const cp =


</script>
</html>