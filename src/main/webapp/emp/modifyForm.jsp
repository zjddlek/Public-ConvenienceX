<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	window.onload=()=>{
	
	let btn=document.getElementById("btn");
	btn.onclick = openkakaoPostCode;
	
	}	

	function openkakaoPostCode(){
		console.log("버튼 눌림");
		new daum.Postcode({
		oncomplete: function(data){
			//팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
			//console.log("팝업검색버튼 누름");
			console.dir(data);
			//document.getElementById("address").value= data.zonecode;
			document.getElementById("address").value= data.roadAddress;
			document.getElementById("address_detail").value= data.jibunAddress;

			}
		}).open();
	
	}

</script>
<body>

		<div class="container">

		<form action="mc">
        
        	<div class="col-md-4 offset-md-3">
			<h3>사원정보 수정</h3>
				
			</div>
			
			
			<div class="col-md-4 offset-md-2 row my-3">
				
				<input type="text" class="form-control" name="empno" value="${vo.empno}">
				 <input type="hidden" name="type" value="modifyOk"/>

			</div>
			
			
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">이름</label>
				<input type="text" class="form-control" name="ename" value="${vo.ename }" />
            
			</div>			
			
			
				
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">생년월일</label>
				<input type="date" class="form-control" name="date" value="${vo.date }" />
            
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">아이디</label>
				<input type="text" class="form-control" name="id" value="${vo.id }" /> 
				
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">비밀번호</label>
				<input type="text" class="form-control" name="pwd" value="${vo.pwd }" />
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

			<div class="col-md-6 offset-md-4">
				<input type="button" value="주소검색" id="btn" class="btn btn-success"/>
			</div>			
			
			
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">이메일</label>
				<input type="text" class="form-control" name="email" value="${vo.email }"   />
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">입사일자</label>
				<input type="date" class="form-control" name="hiredate" value="${vo.hiredate }"  />
			</div>
			
			
			<div class="col-md-4 offset-md-2 row my-3">
				<label for="username">퇴사여부</label>
				<select name="isretire" id="isretire" >
				
					<option value="N">재직중</option>
					<option value="Y">퇴사</option>
				</select>
				
			</div>
			
			
			<%-- <div class="col-md-4 offset-md-2 row my-3">
				<label for="username">시급</label>
				<input type="text" class="form-control" name="sal_hour" value="${vo.sal_hour }"   />
			</div> --%>
            
            
            <div class="col-md-4 offset-md-2 row my-3">
				<label for="username">구분</label>
				<select name="jobno" id="jobno" >
				
					<option value="100">아르바이트</option>
					<option value="200">사원</option>
					<option value="300">매니저</option>
					<option value="400">점장</option>
					
					
				</select>
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<input type="text" class="form-control" name="sal_hour" value="${vo.sal_hour }"   />
			</div>
			
			<div class="col-md-4 offset-md-2 row my-3">
				<input type="text" class="form-control" name="sno" value="${vo.sno }"/>
			</div>
            
          
 			<div class="col-md-4 offset-md-2 my-3">         
          			<input type="submit" class="btn btn-primary" value="수정" />
			<a href="mc?type=emp"><input type="button" class="btn btn-danger" value="취소" /></a>
          			</div>
         
          
      </form>
	</div>



</body>
</html>