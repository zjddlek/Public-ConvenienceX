<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	.img{
		background-image: url('./images/ConvenienceXLogo1.png');
		background-repeat: no-repeat;
		background-size: contain;
		background-position: center;
		width:600px;
		height:400px;
	}
	.form-group{
		margin-bottom: 10px;
	}
	p{
		margin-top: 15px;
	}
	#back{
		margin-left: 2px;
	}
	#changePW{
		margin-right:2px;
	}
</style>

</head>
<body>
	<secction class="ftco-section">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class ="img" ><!-- 추후 background-img: url(jpg)로 변경 -->		
				</div>
			</div>
			<div class="row d-flex justify-content-center">
				<div class="col-md-8 col-lg-6">
					<div class="wrap">
						<div class="findPW-wrap p-4 p-md-5">
							<div class="d-flex">
								<div class="w-50">
									<h3>패스워드 찾기</h3>
								</div>
							</div>
							<div class="form-floating mb-3">
								<input type="text" name="id" id="id" class="form-control" placeholder="찾고싶은 아이디를 입력해주세요."  required />
								<label for="id" class="form-control-placeholder" >찾고싶은 아이디를 입력해주세요.</label>
							</div>
							<div class="form-group d-md-flex">
								<div class="form-floating mb-3 w-50 text-left">
									<input type="text" name="eamil" id="email" class="form-control" placeholder="이메일인증을 위해 입력해주세요."  required />
									<label for="email" class="form-control-placeholder" >이메일인증을 위해 입력해주세요.</label>
								</div>
									<p>@</p>
								<div class="form-floating mb-3 w-50 text-right">
									<input type="text" name="emailAddrs" id="emailAddrs" class="form-control" placeholder="이메일인증을 위해 입력해주세요."  required />
									<label for="emailAddrs" class="form-control-placeholder" >이메일인증을 위해 입력해주세요.</label>
								</div>
							</div>
							<div class="form-group d-md-flex">
								<div class="w-50 text-left">
									<input type="button" class="form-control btn btn-primary rounded" value="인증메일보내기" id="sendemail" />
								</div>
								<div class="w-50 text-right">
									<span id="timer"></span>
								</div>
							</div>
							<div class="form-floating mb-3">
								<input type="text" name="code" id="code" class="form-control" placeholder="인증번호를 입력해주세요."  required />
								<label for="id" class="form-control-placeholder" >인증번호를 입력해주세요.</label>
							</div>
							<div class="form-group d-md-flex">
								<div class="w-50 text-left">
									<input type="button" class="form-control btn btn-primary rounded" value="인증확인" id="numcheck"/>
								</div>
								<div class="w-50 text-right">
									<span id="codecheck"></span>
								</div>
							</div>
							<div class="form-floating mb-3">
								<input type="text" name="newPW" id="newPW" class="form-control" placeholder="새로운 비밀번호를 입력해주세요."  required />
								<label for="newPW" class="form-control-placeholder" >새로운 비밀번호를 입력해주세요.</label>
							</div>
							<div class="form-floating mb-3">
								<input type="text" name="newPWcheck" id="newPWcheck" class="form-control" placeholder="비밀번호를 다시 입력해주세요."  required />
								<label for="newPWcheck" class="form-control-placeholder" >비밀번호를 다시 입력해주세요.</label>
							</div>
							<div class="form-group d-md-flex">
								<div class="w-50">
									<input type="button" id="changePW" class="form-control btn btn-primary rounded" value="변경하기" />
								</div>
								<div class="w-50">
									<input type="button" id="back" class="form-control btn btn-success rounded" value="돌아가기" />
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</secction>
</body>
</html>