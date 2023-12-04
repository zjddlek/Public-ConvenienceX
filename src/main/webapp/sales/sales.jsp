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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>
	.container{
		padding-top: 30px;	
	}
	
	h2{
		text-align: center;
		font-weight:bold;
		margin-bottom: 15px;
	}
	

	.row {
	  width: 100%;
	  display: table;
	}
	.box { display: table-cell; }
	.box-a { background: red; width: 50px; }
	.box-b { background: orange; }
	.box-c { background: yellow; width: 50px; }
	
</style>
</head>
<body>
	<div class="container">
		<h2>판매내역</h3>
		
		<!-- 차상위 div -->
		<div>
			<div class="date">
				<input class="datepicker" style="WIDTH: 100PX;">
			</div>
			
			<div>
				<!-- 왼쪽 -->
				<div class='row'>
					<h3>판매일자</h3>
					<div>
						<c:forEach var="vo" items="${list }">
							<div calss="box box-a">
								<a href="mc?type=sales_list&no=${vo.saleno }&date=${vo.salesdate}"> ${vo.salesdate } </a>
							</div>
						</c:forEach>
					</div>
				</div>
				
				<!-- 중앙 -->
				<div class='row'>
					<div>
						<h3>판매일</h3>
					</div>
					<div>23/11/06</div>
					<div calss="box box-b">
						<div>거래번호</div>
						<div>거래날짜</div>
						<div>판매수량</div>
						<div>환불여부</div>
						<div>상품명</div>
						<div>수단</div>
					</div>
					<div calss="box box-b">
						<c:forEach var="vo" items="${list }">
							<div><a href="mc?type=sales_list&s_no=${vo.saleno }&s_date=${vo.salesdate}"> ${vo.saleno }거래번호1</a></div>
							<div>거래날짜1</div>
							<div>판매수량1</div>
							<div>환불여부1</div>
							<div>상품명1</div>
							<div>수단1</div>
						</c:forEach>
					</div>
				</div>
				
				<!-- 오른쪽 -->
				<div class='row'>
					<h3>상세내역</h3>
					<div>
						<div>거래번호</div>
						<div>거래날짜</div>
						<div>판매수량</div>
						<div>환불여부</div>
						<div>상품명</div>
						<div>수단</div>
					</div>
					<c:forEach var="vo" items="${list }">
						<div class='col-sm-4'>${vo.salesdate }</div>
					</c:forEach>
				</div>
			</div>
			<%-- 페이징 
			<div>
				<nav aria-label="Page navigation example">
					<ul class="pagination">	
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li class="page-item">
								<a class="page-link" href="mc?type=sales&cp=${i}">${i}</a>
							</li>
						</c:forEach>
					</ul>
				</nav>					
			</div> --%>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">

	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년'
	});
	
	$(function () {
		$('.datepicker').datepicker(
		);
	});
	
</script>