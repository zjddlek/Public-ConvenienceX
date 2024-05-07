<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폐기 등록</title>
</head> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
	function discardInsert(){
		
		if($("td[id='check']").length==0){
			alert("폐기할 상품이 없습니다.");
		}else{
			let result = confirm("해당 상품을 폐기 등록 하시겠습니까?");
			
			if(result){
				window.location.replace('mc?type=disposeInsert&sno='+${svo.sno });
			}
		}
	}

	 
</script>
<body>
	<jsp:include page="/main/nav.jsp"></jsp:include> 
	<div class="container">
		<h2>유통기한 지난 상품 </h2>
		
			<table class="table table-striped table-sm" style="width:100%">
				<tr>
					<th>재고 번호</th>
					<th>상품 구분 번호</th>
					<th>제품 번호</th>
					<th>재고 개수</th>
					<th>판매 개수</th>
					<th>남은 재고 개수</th>
					<!-- <th>생산일</th> -->
					<th>입고일</th>
					<th>폐기 예정일</th>
				</tr>
			 <c:forEach var="vo" items="${expired}" >
				<tr>
					<td id="check">${vo.stockNO} </td>
					<td>${vo.pnoInfo}</td> 
					<td>${vo.pname} </td>
					<td style=" text-align: center">${vo.stockCount}</td>
					<td style=" text-align: center">${vo.salesSum}</td>
					<td style=" text-align: center">${vo.remainCount}</td>
					<%-- <td>${vo.manudate}</td> --%>
					<td>${vo.warehouseDate}</td>
					<td>${vo.expiryEndDate}</td>
				</tr> 
			</c:forEach>
			</table>
		<input type="button" value="폐기 등록" onclick = "discardInsert()"/>
		
	</div>
</body>
</html>