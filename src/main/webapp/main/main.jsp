<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>

<body>
	<h3>메인 페이지 </h3>

	<a href="mc?type=sales"><input type="button" value="판매 관리" /></a>
	<a href="mc?type=orders&sno=${svo.sno }"><input type="button" value="발주" /></a>
	<a href="mc?type=stock"><input type="button" value="재고관리 - 접속불가" /></a>
	<a href="mc?type=calMain"><input type="button" value="정산- 접속불가" /></a>
	<a href="mc?type=dispose"><input type="button" value="폐기" /></a>
	<a href="mc?type=emp&sno=${svo.sno }&jobno=${vo.jobno}"><input type="button" value="인사관리" /></a>
	<a href="mc?type=workmain&sno=${svo.sno }"><input type="button" value="출퇴근" /></a>
	<a href="mc?type=etc"><input type="button" value="부대비용관리 - 접속불가" /></a>
</body>


</html>