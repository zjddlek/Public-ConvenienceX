<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		

		<form action="mc" method="get">
		
			<div class="col-md-4 offset-md-3">
				<h3>사원정보 조회</h3>
			</div>
			
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">이름</label>
				<input type="text" class="form-control" name="ename" value="${vo.ename}">
			</div>
			
				
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">생년월일</label>
				<input type="text" class="form-control" name="date" value="${vo.date }" />
            
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">아이디</label>
				<input type="text" class="form-control" name="id" value="${vo.id }" /> 
				
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">비밀번호</label>
				<input type="password" class="form-control" name="pwd" value="${vo.pwd }" />
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">전화번호</label>
				<input type="text" class="form-control" name="phone" value="${vo.phone }"  />
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">주소</label>
				<input type="text" class="form-control" name="address" id="address"  value="${vo.address }" />
				
			</div >
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">상세주소</label>
				<input type="text" class="form-control" name="address_detail" id="address_detail"   value="${vo.address_detail }"/>
			</div>
			
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">이메일</label>
				<input type="text" class="form-control" name="email" value="${vo.email }"   />
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">입사일자</label>
				<input type="text" class="form-control" name="hiredate" value="${vo.hiredate }"  />
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<input type="hidden" class="form-control" name="sal_hour" value="10000" value="${vo.sal_hour }"   />
			</div>
			
		
				
			
			<div class="col-md-6 offset-md-4">
				<a href="mc?type=emp"><input type="button" class="btn btn-success" value="목록" /></a>
				<a href="mc?type=modify&empno=${vo.empno }"><input type="button" class="btn btn-primary" value="수정" /></a>
				<a href="mc?type=delete&empno=${vo.empno }"><input type="button" class="btn btn-danger" value="삭제" /></a>
			</div>
			
			
			
		</form>
		
	</div>


</body>
</html>