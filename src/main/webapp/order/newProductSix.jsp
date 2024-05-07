<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
	<div class="right"><h2>이달의 신상</h2>
		<c:forEach var="vo" items="${npList }">
			<div class="npItems">
				<span>${vo.PName }</span>
				<span>발주가격 : <fmt:formatNumber value="${vo.priceServer}" type="number" />원</span>
				<span>판매가격 : <fmt:formatNumber value="${vo.priceConsumer}" type="number" />원</span>
				<span>이익률 : <fmt:formatNumber value="${(vo.priceConsumer-vo.priceServer) / vo.priceServer *100 }" pattern=".0"/>%</span>
			</div>
		</c:forEach>
		<a href="mc?type=newProducts&sno=${svo.sno }">
			<input type="button" class="btn btn-primary" value="신상품 보러가기" name="showNewProduct" />
		</a>
	</div>
