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
	#goregist {
		height: 80px;
		width: 180px;
	}
	
	#back {
		height: 80px;
		width: 180px;
	}
	.input_container{
        position: relative;
		display: inline-block;

 	 }
     #timer{
        position: absolute;
        right: 5px;
        top: 2px;
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
<body>
	<div class="container">
		<form action="mc?type=shopResistOk">
			<table class="table table-striped">
				<div class="text-center">
					<h3>ConvenienceX</h3>
				</div>

				<tr>
					<td>점포명</td>
					<td><input type="text" name="sname" id="sname" style="width: 500px" placeholder="점포명을 입력하세요" />
					<input type="button" value="중복확인" id="shopcheck" />
					<span id="checksname"></span> 
					<input type="hidden" name="type" value="shopResistOk" /></td>

				</tr>
				<tr>
					<td>점포위치</td>
					<td><input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly="readonly" />
					<input type="button" value="주소찾기" onclick="adress();" /></td>

				</tr>
				<tr>
					<td></td>
					<td><input type="text" name="roadaddrs" id="roadaddrs" placeholder="도로명주소" style="width: 500px" readonly="readonly" />
					<input type="text" name="jibunaddrs" id="jibunaddrs" placeholder="지번" style="width: 500px" readonly="readonly" /></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="text" name="addrsdetail" id="addrsdetail"
						placeholder="상세주소" style="width: 500px" /></td>
				</tr>
				<tr>
					<td>사업자번호</td>
					<td><input type="text" name="businessNo" id="businessNo"
						style="width: 500px" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="email" />@<input type="text" name="emailAddrs" id="emailAddrs" /> 
						<select name="emailAddrsSelect" id="emailAddrsSelect" onchange="changeEmail()">
							<option name="emailAddrsSelect" value="default">주소를 선택해주세요</option>
							<option name="emailAddrsSelect" value="naver.com">naver.com</option>
							<option name="emailAddrsSelect" value="daum.net">daum.net</option>
							<option name="emailAddrsSelect" value="gmail.com">gmail.com</option>
						</select>
						<input type="button" value="인증요청" id="sendemailcheck" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div class="input_container">
							<input type="text" name="confirm" id="confirm" style="width: 500px" placeholder="인증번호를 입력하세요" />
							<span id="timer"></span>
						</div>
						<input type="button" value="인증확인" id="numcheck" /><span id="codecheck"></span>
					</td>

				</tr>
				<tr>
					<td></td>
					<td><textarea name="terms" id="" cols="80" rows="10" disabled>이용약관</textarea><br />
						<input type="checkbox" name="termscheck" id="termscheck" />모두 읽었으며 동의합니다.
					</td>
				</tr>
			</table>
			<div class="text-center">
				<input type="submit" id="goregist" value="등록하기" onclick="validation()" /> 
				<a href="mc"><input id="back" type="button" value="돌아가기" /></a>
			</div>
		</form>
	</div>
	<script type="text/javascript">

	</script>
</body>
</html>