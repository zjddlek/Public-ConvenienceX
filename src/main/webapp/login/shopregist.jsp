<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<style>
#goregist {
	height: 80px;
	width: 180px;
}

#back {
	height: 80px;
	width: 180px;
}
</style>

</head>
<body>
	<div class="container">
		<form action="mc" method="post">
			<table class="table table-striped">
				<div class="text-center">
					<h3>ConvenienceX</h4>
				</div>
	
				<tr>
					<td>점포명</td>
					<td><input type="text" name="sname" id="" style="width: 500px"
						placeholder="점포명을 입력하세요" /><input type="button" value="중복확인" />
						<input type="hidden" name="type" value="shopResistOk" /></td>

				</tr>
				<tr>
					<td>점포위치</td>
					<td><input type="text" name="postcode" id=""
						placeholder="우편번호" /><input type="button" value="주소찾기" /></td>

				</tr>
				<tr>
					<td></td>
					<td><input type="text" name="addrsdetail" id=""
						placeholder="상세주소를 입력해주세요" style="width: 500px" /></td>
				</tr>
				<tr>
					<td>사업자번호</td>
					<td><input type="text" name="businessNo" id=""
						style="width: 500px" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="email" />@<input
						type="text" name="emailAddrs" id="emailAddrs" /> <select
						name="emailAddrsSelect" id="emailAddrsSelect">
							<option value="default">주소를 선택해주세요</option>
							<option value="naver">naver.com</option>
							<option value="daum">daum.net</option>
							<option value="gmail">gmail.com</option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" name="confirm" id="confirm"
						style="width: 500px" placeholder="인증번호를 입력하세요" /><input
						type="button" value="인증요청" /></td>

				</tr>
				<tr>
					<td></td>
					<td><textarea name="terms" id="" cols="80" rows="10" disabled>이용약관</textarea><br />
						<input type="checkbox" name="termscheck" id="" />모두 읽었으며 동의합니다.</td>
				</tr>
			</table>
			<div class="text-center">
				<input type="submit" id="goregist" value="등록하기" /> 
				<a href="mc"><input id="back" type="button" value="돌아가기" /></a>
			</div>
		</form>
	</div>
</body>
</html>