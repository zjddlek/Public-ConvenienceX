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
	span{
		margin-top:15px;
	}
</style>
<script type="text/javascript">
	//코드번호
	let num;
	// 코드 유효성 (유효하면 true, 아니면 false)
	let code_valid = false 
	// 발송 후 지난 초
	let current_time = 0;
	// 유효시간 
	let minutes,seconds;
	let timer_thread;
	//인증 결과값
	let emailresult = false;
	//점포 결과값
	let snameresult = false;

	// 인증코드 유효시간 카운트다운 및 화면 출력
	function timer_start(){
	    // 인증코드 유효성 true
	    code_valid = true;
	    // 현재 발송 시간 초기화
	    current_time = 0;
	    // 20초
	    let count = 180;
	
	    timer.innerHTML = "03:00";
	    // 1초마다 실행
	    timer_thread = setInterval(function () {
	        
	        minutes = parseInt(count / 60, 10);
	        seconds = parseInt(count % 60, 10);
	
	        minutes = minutes < 10 ? "0" + minutes : minutes;
	        seconds = seconds < 10 ? "0" + seconds : seconds;
	
	        timer.innerHTML  = minutes + ":" + seconds;
	       
	        // 타이머 끝
	        if (--count < 0) {
	            timer_over();
	            timer.textContent = "인증코드가 만료되었습니다."
	            timer.style.color = "red";
	        }
	        if(count < 29){
	        	 timer.style.color = "red";
	        }
	        current_time++;
	    }, 1000);
	
	} 

	// 타이머 종료
	function timer_over(){
	    // 타이머 종료
	    clearInterval(timer_thread)
	    // 유효시간 만료
		code_valid = false;
	}
	
	// 인증코드가 유효하면 true, 만료되었다면 false 반환
	function iscodeValid(){
	    return code_valid;
	}

	$(()=>{
		$("#back").on("click",()=>{
			history.back();		
		});
	
		$("#sendemailcheck").on("click",()=>{
			let email = ($("#email").val() + "@" + $("#emailAddrs").val());
			$.ajax({
				url:"/cx/sendEmail",
				async:true,
				type:"GET",
				data:{email:email},
				datatype:JSON,
				beforeSend : function() {
					alert("메일을 전송하였습니다."); 
				},
				success : function(data) {
					num= data.num;
					timer_start()
				},
				errer : function() {
					alert("메일 전송에 실패했습니다. \n 이메일 확인 후 다시 시도해 주세요.")
				}
				
			});
			
		});	
		
		$("#numcheck").on("click",()=>{
			// 타이머 시간 초과 확인
            if(iscodeValid()){
                let code = $("#confirm").val();
                // 인증코드 일치성 검사 
                // 통과시
                if(num == code){
                    // code msg "이메일 인증 성공!"
                    timer.textContent = "인증됨";
                    codecheck.textContent = "이메일 인증 성공!"
                    timer.style.color = "green";
                   	codecheck.style.color = "green";
                    clearInterval(timer_thread);
                    emailresult=true;
                }
                else{
                    // 미통과
                    // code msg "인증코드가 일치하지 않습니다."
                    codecheck.textContent = "인증코드가 일치하지 않습니다."
                    // code msg 색상 비정상
                    codecheck.style.color = "red";
                    clearInterval(timer_thread);                   
                }
            }
			
			
		});		
	});
	
</script>
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
							<form action="mc?type=findPW">
							<div class="form-floating mb-3">
									<input type="text" name="id" id="id" class="form-control" placeholder="찾고싶은 아이디를 입력해주세요."  required />
									<label for="id" class="form-control-placeholder" >찾고싶은 아이디를 입력해주세요.</label>
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
								<div class="form-group d-md-flex">
									<div class="w-50 text-left">
										<input type="button" class="form-control btn btn-primary rounded" value="인증메일보내기" id="sendemailcheck" />
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
										<span id="codecheck">인증</span>
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
							</form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</secction>
</body>
</html>