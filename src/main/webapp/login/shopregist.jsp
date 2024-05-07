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
	#terms{
		height: 300px;
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
							<form action="mc?type=shopResistOk" method="post">
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
									<div class="form-floating mb-3 w-25 text-right">
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
									<textarea name="terms" id="terms" cols="80" rows="5" class="form-control" placeholder="이용약관" readonly>
											제1장 총 칙
											제1조 (명칭)										
											본 사이트는 "ConvenienceX"로 칭하며 본 사이트의 운영주체는 ConvenienceX입니다.											
											제2조 (목적)											
											본 약관은 회원들이 본 정보를 이용함에 있어 본 사이트와 가입 회원(이하 회원) 간의 관계 설정을 목적으로 합니다.											
											제3조 (약관의 변경)											
											본 사이트가 약관을 변경하고자 할 경우, 본 사이트는 변경된 내용을 시행예정 30일전까지 회원에게 통지함과 동시에 홈페이지 내의 공지 페이지에 공지하여야 하며 회원이 적용 예정일까지 이의를 제기하지 않을 경우에는 변경된 약관을 승인한 것으로 봅니다. 											
											회원이 이의를 제기한 때에는 본 사이트에 대하여 탈퇴의사를 밝힌 것으로 봅니다.
											제4조 (본 약관에서 정하지 아니한 사항)											
											본 약관에서 정하지 아니한 사항과 본 약관의 해석에 관하여는 관계법령 또는 상관례에 따릅니다.											
											제2장 회원의 가입 및 탈퇴											
											제5조 (회원)											
											본 사이트 회원이란 예문사가 회원으로 적합하다고 인정하는 일반 개인으로서, 본 약관에 동의하고 예문사가 인정하는 본 사이트의 회원가입양식을 작성한 뒤 고유의 ID와 PASSWORD를 발급 받은 자를 말합니다.											
											본 사이트에 기재하는 모든 정보는 이름을 포함하여 실제정보로 간주합니다. 그와 같이 입력하지 않는 사용자는 법적인 보호를 받을 수 없으며 본 사이트의 서비스 제한 조치를 받을 수 있습니다.											
											제6조 (가입과 탈퇴)											
											본 사이트에 가입을 희망하는 이용자는 본 사이트가 지정한 가입신청서를 작성하여야 하며, 본 사이트는 이용자의 가입 신청 시 개인정보 수집과 관련하여 반드시 회원의 동의를 받아야 합니다. 											
											제 1항의 경우, 가입을 희망하는 자가 본 사이트의 회원으로서 부적합 하다고 판단할 경우, 본 사이트는 가입신청을 거절할 수 있으며, 이 경우 부적격사유를 통보하여야 합니다. 											
											회원은 언제든지 본 사이트의 회원에서 탈퇴할 수 있습니다.
											제7조 (회원자격의 정지 및 박탈)										
											본 사이트는 회원이 다음 각 호에 해당되는 경우, 당해 회원에게 소명의 기회를 부여한 후 회원의 자격을 일시 정지시킬 수 있습니다.											
											① 가입신청서의 기재사항을 허위로 작성할 경우											
											② 본 약관에서 정한 사항을 위반하는 경우																				
											본 사이트가 제1항에 의하여 회원의 자격을 일시 정지시킨 후, 동일한 행위가2회 이상 반복되거나 또는 30일 이내에 그 사유가 시정되지 아니하는 경우, 본 사이트는 회원의 자격을 박탈할 수 있습니다.
											제3장 서비스의 이용											
											제8조 (ID관리)											
											ID 및 비밀번호는 본 사이트와 협의 없이 타인에게 양도, 임대, 대여할 수 없으며, 회원ID와 비밀번호에 관한 모든 관리 책임은 회원에게 있습니다.
											본 사이트는 회원ID에 의해 게시판 활동, 쇼핑 등 회원관리업무를 수행하며 본 사이트가 인정하는 정당한 사유가 없는 한 회원은 ID를 공유, 양도 또는 변경할 수 없습니다.
											회원에게 부여된 ID 및 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
											본 사이트는 회원과 관련된 개인 신상정보가 외부에 누출되지 않도록 보안에관련된 책임을 질 의무가 있습니다.
											제9조 (서비스 이용제한)											
											이용자는 서비스의 이용에 있어서 다음 각 호에 해당되지 않도록 하여야 하며, 이에 해당되는 경우 서비스 이용을 제한할 수 있습니다.
											① 공공질서 및 미풍양속(욕설, 비난 포함)에 반하는 경우											
											② 범죄적 행위에 관련되는 경우											
											③ 타인의 명예를 손상시키거나 불이익을 주는 경우											
											④ 서비스에 위해를 가하는 등 서비스의 건전한 이용을 저해하는 경우											
											제4장 계약사항											
											제10조 (계약사항의 변경 및 해제)											
											이용자는 주소 등 이용계약 내용을 변경하거나, 서비스를 해지할 경우에는 본 사이트를 통해서 이용계약을 변경 및 해지하여야 합니다.
											제11조 (면책조항)									
											본 사이트는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지않습니다.
											본 사이트는 이용자가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은자료로 인한 손해에 관하여 책임을 지지 않습니다.
											제12조 (저작권)											
											본 사이트에서 볼 수 있는 모든 자료는 ConveniencX 에서 본 사이트로만 제공하는 정보입니다.
									</textarea>
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