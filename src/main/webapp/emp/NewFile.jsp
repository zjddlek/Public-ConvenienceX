<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	
		<div class="container">
		
		<form action="mc">
        
        <div class="col-md-4 offset-md-3">
				<h3>사원정보 수정</h3>
			</div>
			
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">이름</label>
				<input type="text" class="form-control" name="ename" value="${vo.ename }">
			</div>
	
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">생년월일</label>
				<input type="date" class="form-control" name="date" value="${vo.date }"  />
            
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">아이디</label>
				<input type="text" class="form-control" name="id" value="${vo.id }"  /> 
				
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">비밀번호</label>
				<input type="password" class="form-control" name="pwd" value="${vo.pwd }" />
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">전화번호</label>
				<input type="text" class="form-control" name="phone" value="${vo.phone }" />
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">주소</label>
				<input type="text" class="form-control" name="address" id="address" value="${vo.address }"/>
				
			</div >
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">상세주소</label>
				<input type="text" class="form-control" name="address_detail" id="address_detail" value="${vo.address_detail }" />
			</div>


			<div class="col-md-6 offset-md-4">
				<input type="button" value="주소검색" id="btn" class="btn btn-success" value="${vo.address }"/>
			</div>
			
			
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">이메일</label>
				<input type="text" class="form-control" name="email" value="${vo.email }" />
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">입사일자</label>
				<input type="date" class="form-control" name="hiredate" value="${vo.hiredate }" />
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<input type="hidden" class="form-control" name="sal_hour" value="10000" value="${vo.sal_hour }" />
			</div>
            
            
            
            
          	<div class="col-md-4 offset-md-2 my-3">
			<a href="mc?type=emp"><input type="button" class="btn btn-primary" value="목록" /></a>
          	<input type="submit"  class="btn btn-success" value="수정" />
          	
         	</div>
        
      </form>
	</div>



</body>
</html>