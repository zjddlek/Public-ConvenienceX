<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<div class="left"> <h2>매출 TOP</h2>

		<c:forEach var="vo" items="${prList }">
			<div class="prItems">
				<span>${vo.PName }</span>
				<span>${vo.total }개</span>
				<span>발주가격 : <fmt:formatNumber value="${vo.priceServer}" type="number" />원</span>
				<span>이익률 : <fmt:formatNumber value="${(vo.priceConsumer-vo.priceServer) / vo.priceServer *100 }" pattern=".0"/>%</span>
			</div>
		</c:forEach>
		
		<a href="mc?type=productRank&sno=${svo.sno }">
			<input type="button" class="btn btn-primary" value="전체 랭킹 보러가기" name="showAllProductRanking" />
		</a>
	</div>
