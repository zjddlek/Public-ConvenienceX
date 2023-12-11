<%@page import="com.cx.www.dao.ShopDAO"%>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		margin-left: 15px;
	}
	#postcode{
		margin-right: 2px;
	}
	#postcodebtn{
		margin-left:10px;
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
		$("#shopcheck").on("click",()=>{
			let sname = $("#sname").val();
			console.log(sname);
			$.ajax({
				url:"/cx/snamecheck",
				async:true,
				type:"GET",
				data:{sname:sname},
				datatype:JSON,
				success : function(data) {
					count= data.count;
					if(count==0){
						//사용가능
						checksname.textContent = "사용가능한 점포명입니다!"
						checksname.style.color = "green";
						snameresult = true;
					}else{
						//사용불가
						checksname.textContent = "이미있는 점포명입니다!"
						checksname.style.color = "red";
						return snameresult;
					}
					
				},
				errer : function() {
					alert("error");
				}
				
			});		
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
					console.log(num);
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


	//카카오 우편주소 API
	function adress() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("roadaddrs").value = data.roadAddress;
				//console.dir(data);
				document.getElementById("jibunaddrs").value = data.jibunAddress;

				}
			}).open();
	}

	
	
	
	
	//이메일 @주소 밸류
	function changeEmail(){
		var emailAddrsSelect = document.getElementById("emailAddrsSelect");
		var value = emailAddrsSelect.options[emailAddrsSelect.selectedIndex].value ;
		document.getElementById("emailAddrs").value=value;
	} 
	
	
	//유효성검사
	function validation() {
		 if(document.getElementById("sname").value==""||document.getElementById("sname").value.length<1){
			alert("점포명을 입력해주세요");
			document.getElementById("sname").focus();
			return;
		}else if(document.getElementById("postcode").value==""||document.getElementById("postcode").value.length<1){
			alert("주소를 입력해주세요");
			adress();
			return;		
		}else if(document.getElementById("addrsdetail").value==""||document.getElementById("addrsdetail").value.length<1){
			alert("상세주소를 입력해주세요");
			document.getElementById("addrsdetail").focus();
			return;
		}else if(document.getElementById("email").value==""||document.getElementById("email").value.length<1){
			alert("이메일을 입력해주세요");
			document.getElementById("email").focus();
			return;
		}else if(document.getElementById("termscheck").checked == false){
			alert("이용약관에 동의 해주세요");
			//console.dir(document.getElementById("termcheck").checked);
			return;
		}else if(emailresult==false){
			alert("이메일 인증을 완료해주세요");
			return;
		}else if(snameresult==false){
			alert("점포명 중복확인을 진행해주세요");
			return;
		} else{
			alert("점포등록이 완료되었습니다.");
		} 
		
	}
	
</script>

</head>
<section class="ftco-section">
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
										<input type="button" id="shopcheck" value="중복확인" class="form-control btn btn-primary rounded" />
									</div>
									<div class="form-floating mb-3 w-50">
										<span id="checksname"></span>
									</div>
								</div>
								<div class="form-group d-md-flex align-items-center" >
									<div class="form-floating mb-3 w-50 text-left" >
										<input type="text" name="postcode" id="postcode" class="form-control" placeholder="우편번호"  readonly />
										<label for="postcode" class="form-control-placeholder" >우편번호</label>
									</div>
									<div class="form-floating mb-3 w-25 text-right" >
										<input type="button" id="postcodebtn" value="주소찾기" onclick="adress();" class="form-control btn btn-primary rounded" />
									</div>
								</div>
								<div class="form-floating mb-3">
									<input type="text" name="roadaddrs" id="roadaddrs" placeholder="도로명주소"  class="form-control"  readonly />
									<label for=roadaddrs class="form-control-placeholder" >도로명주소</label>				
								</div>
								<div class="form-floating mb-3">
									<input type="text" name="jibunaddrs" id="jibunaddrs" placeholder="지번" class="form-control"   readonly />
									<label for="jibunaddrs" class="form-control-placeholder" >지번 주소</label>
								</div>
								<div class="form-floating mb-3" >
										<input type="text" name="addrsdetail" id="addrsdetail" placeholder="상세주소" class="form-control"  />
										<label for="addrsdetail" class="form-control-placeholder" >상세 주소</label>
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
									<input type="text" name="confirm" id="confirm" class="form-control" placeholder="인증번호를 입력해주세요."  required />
									<label for="confirm" class="form-control-placeholder" >인증번호를 입력해주세요.</label>
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
									<textarea name="terms" id="" cols="80" rows="10" class="form-control" placeholder="이용약관" disabled>이용약관 입니다.</textarea>
									<label for="terms" class="form-control-placeholder" >이용약관</label>
								</div>
								<div class="form-floating mb-3">								
									<div class="form-check form-switch mt-2">
						            	<input class="form-check-input" type="checkbox" id="termscheck">
						            	<label class="form-check-label" for="termscheck">모두 읽었으며 동의합니다.</label>
        							</div>
								</div>
								<div class="form-group d-md-flex align-items-center">
									<div class="w-50">
										<input type="submit" id=goregist class="form-control btn btn-primary rounded" value="등록하기" onclick="validation()"  />
									</div>
									<div class="w-50">
										<a href="mc"><input type="button" id="back" class="form-control btn btn-success rounded" value="돌아가기" /></a>
									</div>
								</div>
							</form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>