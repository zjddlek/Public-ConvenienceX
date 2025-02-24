<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>발주 완료 창2</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<link rel="stylesheet" href="./style/order.css">
<title>Insert title here</title>
<script>
	$(()=>{
		$("#date").on("change",()=>{
			console.dir($("#date"));
			let date = $("#date").val();
			let sno = $("#sno").val();
			
			location.href = 'mc?type=orderDayList&sno='+sno+'&yyyymmdd='+date;
		})
		
		$("#yesterday").on("click",()=>{
			let date = $("#date").val();
			let sno = $("#sno").val();
		
			let yyyy = date.substring(0,4);
			let mm = date.substring(5,7);
			let dd = date.substring(8,10);
			
			let today = new Date(yyyy,(mm-1),dd);
			
			today.setDate(today.getDate() - 1);

			yyyy=today.getFullYear();
			mm=today.getMonth()+1;
			dd=today.getDate();
			
			if ( mm >= 10 && dd >= 10) {
				$("#date").val(yyyy+'-'+(mm)+'-'+dd);
			} else if ( mm < 10 && dd >= 10 ) {
				$("#date").val(yyyy+'-0'+(mm)+'-'+dd);
			} else if ( mm >= 10 && dd < 10 ) {
				$("#date").val(yyyy+'-'+(mm)+'-0'+dd);
			} else {
				$("#date").val(yyyy+'-0'+(mm)+'-0'+dd);
			}			
			
			location.href = 'mc?type=orderDayList&sno='+sno+'&yyyymmdd='+$("#date").val();

		})
		
		$("#tomorrow").on("click",()=>{
			let date = $("#date").val();
			let sno = $("#sno").val();
		
			let yyyy = date.substring(0,4);
			let mm = date.substring(5,7);
			let dd = date.substring(8,10);
			
			let today = new Date(yyyy,(mm-1),dd);
			
			today.setDate(today.getDate() + 1);

			yyyy=today.getFullYear();
			mm=today.getMonth()+1;
			dd=today.getDate();
			
			if ( mm >= 10 && dd >= 10) {
				$("#date").val(yyyy+'-'+(mm)+'-'+dd);
			} else if ( mm < 10 && dd >= 10 ) {
				$("#date").val(yyyy+'-0'+(mm)+'-'+dd);
			} else if ( mm >= 10 && dd < 10 ) {
				$("#date").val(yyyy+'-'+(mm)+'-0'+dd);
			} else {
				$("#date").val(yyyy+'-0'+(mm)+'-0'+dd);
			}			

			location.href = 'mc?type=orderDayList&sno='+sno+'&yyyymmdd='+$("#date").val();
		})
	})
	
</script>
<style>
h1 {
	text-align: center;
}
</style>
</head>
<body>
	<div><jsp:include page="/main/nav.jsp"></jsp:include></div>
	<div class="container">
		<input type="date" name="date" id="date" value="${yyyyMMdd }" style="width: 170px" /> 
		<input type="hidden" name="sno" id="sno" value="${sno }" />
		<table class="table table-striped table-hover table-sm caption-top">
			<caption style="text-align: center">
				<input class="btn btn-dark" type="button" value="&lt;" id="yesterday" />
				<h1>${yyyyMMdd }</h1>
				<input class="btn btn-dark" type="button" value="&gt;" id="tomorrow" />
			</caption>
			<tr style="text-align:center;">
				<th>주문날짜</th>
				<th>주문번호</th>
				<th>상품명</th>
				<th>수량</th>
				<th>제조일자</th>
				<th>유통기한</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td style="text-align:center;">${vo.ordDate }</td>
					<td style="text-align:center;">${vo.ordno }</td>
					<c:set var="pname" value="${vo.pname }" />
						<c:if test="${fn:length(pname) >= 34 }">
							<td  class="pname" value="${vo.pname }">${fn:substring(pname, 0, 33) }...</td>
						</c:if>
						<c:if test="${fn:length(pname) < 34 }">
							<td  class="pname" value="${vo.pname }">${vo.pname }</td>
						</c:if>
					<td style="text-align:center;">${vo.ordCount }</td>
					<td style="text-align:center;">${vo.manudate }</td>
					<td style="text-align:center;">${vo.expirydate}</td>
				</tr>
			</c:forEach>
			<tr>
				<td style='text-align: end'>
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="mc?type=orderDayList&sno=${sno }&yyyymmdd=${yyyyMMdd }&cp=1">첫페이지로</a></li>
						</ul>
					</nav>
				</td>
				<td colspan='4' style='text-align: center'>
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<c:if test="${currentPage > 1}">
								<li class="page-item"><a class="page-link" href="mc?type=orderDayList&sno=${sno }&yyyymmdd=${yyyyMMdd }&cp=${currentPage -1 }">Previous</a></li>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<li class="page-item"><a class="page-link" href="mc?type=orderDayList&sno=${sno }&yyyymmdd=${yyyyMMdd }&cp=${i }">${i }</a></li>
							</c:forEach>
							<c:if test="${currentPage < totalPage}">
								<li class="page-item"><a class="page-link" href="mc?type=orderDayList&sno=${sno }&yyyymmdd=${yyyyMMdd }&cp=${currentPage +1 }">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</td>
				<td>
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="mc?type=orderDayList&sno=${sno }&yyyymmdd=${yyyyMMdd }&cp=${totalPage }">마지막 페이지로</a></li>
						</ul>
					</nav>
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="2"><a href="mc?type=orders&sno=${svo.sno }"><input type="button" class="btn btn-secondary" value="발주 리스트로 돌아가기"></a></td>
			</tr>
		</table>
	</div>
</body>
</html>