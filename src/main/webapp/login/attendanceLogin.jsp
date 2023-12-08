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
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<style>
		.img{
			background-image: url('./images/ConvenienceXLogo1.png');
			background-repeat: no-repeat;
			background-size: contain;
			background-position: center;
			width:600px;
			height:400px;
		}
		#back{
			margin-left: 2px;
		}
		#login{
			margin-right: 2px;
		}
	</style>

</head>
<body>
	<section class="ftco-section" >
		<div class="container">
			<div class="row d-flex justify-content-center ">
			 			<div class ="img" ><!-- 추후 background-img: url(jpg)로 변경 -->		
						</div>
			</div>
			<div class="row d-flex justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap">
						<div class="login-wrap p-4 p-md-5" >
							<div class="d-flex">
								<div class="w-100">
									<h3>Sign In</h3>
								</div>
								<div class="w-100">
									<h5>Create Tomorrow's Smile Together</h5>
								</div>
							</div>
							<form action="mc" method="post" class="signin-form" >
								<div class="form-floating mb-3">
									<input type="text" name="id" id="id" class="form-control" placeholder="UserID"  required />
									<input type="hidden" name="type" value="login"/>
									<label for="id" class="form-control-placeholder" >UserID</label>
								</div>
								<div class="form-floating mb-3" >
									<input type="password" name="pwd" id="pwd" class="form-control" placeholder="PASSWORD" required />
									<label for="pwd" class="form-control-placeholder" >PASSWORD</label>
								</div>
								<div class="form-group d-md-flex">
									<div class="w-50 ">
										<input type="submit" value="로그인하기" id="login" class="form-control btn btn-primary rounded" />
									</div>
									<div class="w-50 ">
										<a href="mc?type=main&sno=${svo.sno }"><input type="button" value="돌아가기" id="back" class="form-control btn btn-success rounded" /></a>
									</div>
								</div>	
								<div class="form-group d-md-flex">
									<div class="w-50 text-left p-3"  >
										<a href="mc?type=empAddOne&sno=${svo.sno }"><h6>직원등록을 아직안하셨나요? 등록하러가기</h6></a>
									</div>
									<div class="w-50 text-md-right p-3" >
										<a href="#"><h6>비밀번호를 잊으셨나요?</h6></a>
									</div>
								</div>			
							</form>
						</div>
					</div>
				</div> <!--col-md-7 col-lg-5  -->
			</div><!-- row jusify-content-center -->
		</div> <!--container  -->
	</section>
	
	
</body>
</html>