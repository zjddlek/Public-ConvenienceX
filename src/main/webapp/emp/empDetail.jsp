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
</head>
<style>
#root{
	margin: auto;
	width:800px;
	margin:auto;
	width:1500px;
	height:1000px;
}
#header{
	padding-top:20px;
	withd:100%;
	height:100px;
	text-align:center;
}
#leftpicture{
	width:50%;
	height:250px;
	float:left;
	display: flex;
	justify-content: right;
	padding-top: 20px;
}
#rightside{
	width:50%;
	height:250px;
	float:left;
	padding-left: 
}
#middle{
	height:800px;
	padding-left: 320px;
	padding-top: 60px;
}
#buttons{
	text-align:center;
}
</style>
<body>
	<div class="container" id="root">
		<div id="header" >
			<h3>사원정보 조회</h3>
		</div>

		<form action="mc" method="get">
			<div id="leftpicture">
			<div class="col-md-4 offset-md-1 my-3">
				<img src="/cx/upload/${vo.picture}" alt=""  /></div>
			</div>
			<!-- 이부분 강사님께서 경로 지정해주셨는데 이해가 1도 안감.........저 폴더엔 아무것도없는데,,,??? -->
			
			<div id="rightside">
				<div class="col-md-5 offset-md-1 my-3">
					<label for="username">사원명</label> 
					<input type="text" class="form-control" name="ename" value="${vo.ename}" readonly />
				</div>

				<div class="col-md-5 offset-md-1 my-3">
					<label for="username">생년월일</label>
					<input type="text" class="form-control" name="date" value="${vo.date }" readonly />

				</div>
				<div class="col-md-5 offset-md-1 row my-3">
					<label for="username">전화번호</label> 
					<input type="text" class="form-control" name="phone" value="${vo.phone }" readonly/>
				</div>
			</div>
			
			<div id="middle">		
				<div class="row">
					<div class="col-md-3 offset-md-1 row my-3">
						<label for="username">아이디</label> 
						<input type="text" class="form-control" name="id" value="${vo.id }" readonly/>
					</div>

					<div class="col-md-3 offset-md-1 row my-3">
						<label for="username">비밀번호</label> 
						<input type="password" class="form-control" name="pwd" value="${vo.pwd }" readonly />
					</div>
				</div>

				<div class="row">
					<div class="col-md-7 offset-md-1 row my-3">
						<label for="username">이메일</label> 
						<input type="text"class="form-control" name="email" value="${vo.email }" readonly />
					</div>

					<div class="col-md-7 offset-md-1 row my-3">
						<label for="username">주소</label> 
						<input type="text" class="form-control" name="address" id="address" value="${vo.address }" readonly/>
					</div>
	
					<div class="col-md-7 offset-md-1 row my-3">
						<label for="username">상세주소</label> 
						<input type="text" class="form-control" name="address_detail" id="address_detail" value="${vo.address_detail }" readonly />
					</div>

					<div class="col-md-4 offset-md-1 row my-3">
						<label for="username">입사일자</label> 
						<input type="text" class="form-control" name="hiredate" value="${vo.hiredate }" readonly />
					</div>
	
					<div class="col-md-4 offset-md-1 row my-3">
						<input type="hidden" class="form-control" name="sal_hour" value="10000" value="${vo.sal_hour }" readonly/>
					</div>
				</div>
				<div id="buttons">
					<div class="col-md-6 offset-md-4 pt-5 bt-5">
						<a href="mc?type=emp">
							<input type="button" class="btn btn-success" value="목록" />
						</a> 
						<a href="mc?type=modify&empno=${vo.empno }">
							<input type="button" class="btn btn-primary" value="수정" />
						</a> 
						<a href="mc?type=delete&empno=${vo.empno }">
							<input type="button" class="btn btn-danger" value="삭제" />
						</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>