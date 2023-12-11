<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html> 
<head>
<meta charset="UTF-8">
<title>재고현황</title>
 
<%-- jquery --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%-- 부트스트랩 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<link rel="stylesheet" href="./style/stock.css" />

</head>

<script>
	$(document).ready(function(){
		goStockMain();
		
		$("#product_name").tooltip();
		
		$("#search_text").on("keyup",function(key){         
			if(key.keyCode==13) {
		        search();
			}     
		});
	});
	
	// 재고번호 불러오기
	function goStockMain(){
		$.ajax({
			url : "ajax/stockAjaxStockno.jsp",
			success:function(data){
				
				let obj = JSON.parse(data.trim());
				
				// 리스트 초기화
				$("#stock_list *").remove();
				$("#product_list *").remove();
				$("#cost_list *").remove();
				$("#cnt_list *").remove();
				
				$.each(obj, function(i, e){
					let pname = e.pname;
					let cost = e.price_consumer.toLocaleString('ko-KR');
					
					let stno = "<div id='stockno'>" + e.stockNo + "</div>";
					
					pname = "<div id='pname'>" + e.pname + "</div>";
					
					cost = "<div id='cost' style='text-align:center;'>" + cost + "</div>";
					let cnt = "<div id='cnt' style='text-align:center;'>" + e.stock_count + "</div>";
					
					$("#stock_list").append(stno);
					$("#product_list").append(pname);
					$("#cost_list").append(cost);
					$("#cnt_list").append(cnt);
				});
			}
		});
	}
	
	// 대분류 선택시 중분류 목록 생성
	function change_Major(obj, mcNo, mname){
		$("#major").val(mname);
		
		if(mcNo == '0'){
			goStockMain();
			$("#subList").empty();
			
			let msg = "<li id='subname'>대분류를 선택해주세요.</li>";
			$("#subList").append(msg);		}
		else{
			$.ajax({
				url : "ajax/stockAjaxSub.jsp",
				data : {
					"mcno" : mcNo
				},
				success:function(data){
					let obj = JSON.parse(data);
					
					$("#subList").empty();
					
					$.each(obj, function(i, e){
						
						let msg = "<li id='subname' onclick = goStockNo(this,'" + e.scNo + "/" + e.scName + "')>" + e.scName + "</li>";
						$("#subList").append(msg);
					});	
				}
			});	
		}
	}	
	
	// 재고번호 불러오기 - stock_list, product_list에 overflow-y : scroll 넣고싶은데 안되는거 물어보기
	function goStockNo(obj, snum){
		
		sc = snum.split('/');
		scno = sc[0];
		let scname = sc[1];
		
		$("#sub").val(scname);
		
		$.ajax({
			url : "ajax/stockAjaxStockno.jsp",
			data: {
				"scno" : scno
			},
			success:function(data){
				console.log(data);
				
				// 값이 없는 경우 처리 ----> 아무런 값 없이 []만 나오는데 if문에 안걸림 물어보기
				if (data.trim() == ""){
					console.log("1");
				}
				
				let obj = JSON.parse(data.trim());
				
				// 리스트 초기화
				$("#stock_list *").remove();
				$("#product_list *").remove();
				$("#cost_list *").remove();
				$("#cnt_list *").remove();
				
				$.each(obj, function(i, e){
					let pname = e.pname;
					let cost = e.price_consumer.toLocaleString('ko-KR');
					
					let stno = "<div id='stockno'>" + e.stockNo + "</div>";
					
					pname = "<div id='pname'>" + e.pname + "</div>";
					
					cost = "<div id='cost' style='text-align:center;'>" + cost + "</div>";
					let cnt = "<div id='cnt' style='text-align:center;'>" + e.stock_count + "</div>";
					
					$("#stock_list").append(stno);
					$("#product_list").append(pname);
					$("#cost_list").append(cost);
					$("#cnt_list").append(cnt);
					
				});
			}
		});
	}
	
	// 검색
	function search(){
		
		let searchVal = $("#search_text").val();
		
		$.ajax({
			url : "ajax/stockAjaxSearch.jsp",
			data: {
				"searchVal" : searchVal
			},
			success:function(data){
				
				let obj = JSON.parse(data.trim());
				
				// 리스트 초기화
				$("#stock_list *").remove();
				$("#product_list *").remove();
				$("#cost_list *").remove();
				$("#cnt_list *").remove();
				
				$.each(obj, function(i, e){
					let pname = e.pname;
					let cost = e.price_consumer.toLocaleString('ko-KR');
					
					let stno = "<div id='stockno'>" + e.stockNo + "</div>";
					
					pname = "<div id='pname'>" + e.pname + "</div>";
					
					cost = "<div id='cost' style='text-align:center;'>" + cost + "</div>";
					let cnt = "<div id='cnt' style='text-align:center;'>" + e.stock_count + "</div>";
					
					$("#stock_list").append(stno);
					$("#product_list").append(pname);
					$("#cost_list").append(cost);
					$("#cnt_list").append(cnt);
					
				});
			}
		});
	}

</script>
<body>
	<div class="container" style="padding-bottom: 20px;">
	<jsp:include page="/main/nav.jsp"></jsp:include> 
		<h2>재고리스트</h2>
		<div>
			<div style="display: flex;">
				<div class="target-select__elements--control" style="margin-bottom: 10px; margin-right: 10px;"> 
					<div class="dropdown input-dropdown">
						<button class="btn dropdown-toggle" type="button" id="dropdown1" data-bs-toggle="dropdown" aria-expanded="false">
							<input type="text" name="" id="major" value="대분류" readonly />
						</button>
				        <ul class="dropdown-menu" style="overflow-y: scroll;">
				        	<li class="dropdown-item" onclick="change_Major(this, '0', '전체');">전체</li>
							<li class="dropdown-item" onclick="change_Major(this, 'MC1', '식품');">식품</li>
							<li class="dropdown-item" onclick="change_Major(this, 'MC2', '주방용품');">주방용품</li>
							<li class="dropdown-item" onclick="change_Major(this, 'MC3', '생활용품');">생활용품</li>
							<li class="dropdown-item" onclick="change_Major(this, 'MC4', '문구');">문구</li>
						</ul>
				  	</div>
				</div>
				
				<div class="target-select__elements--control" style="margin-bottom: 10px;"> 
					<div class="dropdown input-dropdown">
						<button class="btn dropdown-toggle" type="button" id="dropdown2" data-bs-toggle="dropdown" aria-expanded="false">
							<input type="text" name="" id="sub" value="중분류" readonly />
						</button>
						<ul class="dropdown-menu" id="subList" style="overflow-y: scroll;">
							<li class="dropdown-item">대분류를 선택해주세요.</li>
						</ul>
					</div>
				</div>
				
				<div class="search">
				     <input type="text" id="search_text" placeholder="상품명을 입력해주세요.">
				     <button id="search-btn" onclick="search();">검색</button>
				</div>
			</div>
			
		
			<table>
				<colgroup>
					<col style="width:5%"/>
					<col style="width:33%"/>
					<col style="width:3%"/>
					<col style="width:8%"/>
				</colgroup>
				<thead style="border-bottom: 1px solid black;">
					<tr>
						<%-- sort는 언젠간.... 기능 제거함 --%>
						<th>
							<span style="text-align: center;">상품코드</span>
						</th>
						
						<th>
							<span>상품명</span>
						</th>
						
						<th style="text-align: center;">
							<span>수량</span>
						</th>
						<th style="text-align: center;">
							<span>가격(단위 : 원)</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="stock">
							<div id="stock_list"></div>
						</td>
						<td id="product_list"></td>
						<td id="cnt_list"></td>
						<td id="cost_list"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>