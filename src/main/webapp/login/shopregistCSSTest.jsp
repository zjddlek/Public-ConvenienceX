<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<secction class="ftco-section">
		<div class="container">
			<div class="row d-flex justify-content-center pb-3">
				<div class ="img" ><!-- 추후 background-img: url(jpg)로 변경 -->		
				</div>
			</div>
			<div class="row d-flex justify-content-center pb-3">
				<div class="col-md-8 col-lg-6">
					<div class="wrap">
						<div class="findPW-wrap p-4 p-md-5 border border-primary border-3 rounded-3 ">
							<div class="d-flex">
								<div class="w-50">
									<h3>점포 등록</h3>
								</div>
							</div>
							<form action="mc?type=shopResistOk">
								<div class="form-floating mb-3">
									<input type="text" name="sname" id="sname" class="form-control" placeholder="점포명"  required />
									<label for="sname" class="form-control-placeholder" >점포명</label>
									<input type="hidden" name="type" value="shopResistOk" />
								</div>
								<div class="form-group d-md-flex align-items-center">
									<div class=" mb-3 w-50">
										<input type="button" id="shopcheck" value="ID 체크하기" class="form-control btn btn-primary rounded" />
									</div>
									<div class="form-floating mb-3 w-50">
										<span id="duplicationSname"></span>
									</div>
								</div>
								<div class="form-group d-md-flex">
									<div class="form-floating mb-3 w-50 text-left">
										<input type="text" name="eamil" id="email" class="form-control" placeholder="이메일을 입력해주세요."  required />
										<label for="email" class="form-control-placeholder" >이메일을 입력해주세요.</label>
									</div>
										<p>@</p>
									<div class="form-floating mb-3 w-50 text-right">
										<input type="text" name="emailAddrs" id="emailAddrs" class="form-control" placeholder="이메일을 입력해주세요."  required />
										<label for="emailAddrs" class="form-control-placeholder" >이메일을 입력해주세요.</label>
									</div>
								</div>
								<div class="form-group d-md-flex align-items-center">
									<div class="w-50 text-left">
										<input type="button" class="form-control btn btn-primary rounded" value="인증메일보내기" id="sendemailcheck" />
									</div>
									<div class="w-50 text-right">
										<span id="timer"></span>
									</div>
								</div>
								<div class="form-floating mb-3">
									<input type="text" name="code" id="code" class="form-control" placeholder="인증번호를 입력해주세요."  required />
									<label for="code" class="form-control-placeholder" >인증번호를 입력해주세요.</label>
								</div>
								<div class="form-group d-md-flex align-items-center">
									<div class="w-50 text-left">
										<input type="button" class="form-control btn btn-primary rounded" value="인증확인" id="numcheck"/>
									</div>
									<div class="w-50 text-right">
										<span id="codecheck"></span>
									</div>
								</div>
								<div class="form-floating mb-3">
									<input type="password" name="newPW" id="newPW" class="form-control" placeholder="새로운 비밀번호를 입력해주세요."  required />
									<label for="newPW" class="form-control-placeholder" >새로운 비밀번호를 입력해주세요.</label>
								</div>
								<div class="form-floating mb-3">
									<input type="password" name="newPWcheck" id="newPWcheck" class="form-control" placeholder="비밀번호를 다시 입력해주세요."  required />
									<label for="newPWcheck" class="form-control-placeholder" >비밀번호를 다시 입력해주세요.</label>
								</div>
								<div class="form-floating d-md-flex align-items-center mb-3">
									<span id="duplicationPW" ></span>
								</div>
								<div class="form-group d-md-flex align-items-center">
									<div class="w-50">
										<input type="submit" id="changePW" class="form-control btn btn-primary rounded" value="변경하기" onclick="validation()"  />
									</div>
									<div class="w-50">
										<input type="button" id="back" class="form-control btn btn-success rounded" value="돌아가기" />
									</div>
								</div>
							</form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</secction>
</body>
</html>