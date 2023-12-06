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
</style>
<script type="text/javascript">
	<%-- $({
		$("#shopcheck").on("click",()=>{
			<%
				ShopDAO dao = new ShopDAO();
				
			%>
			
			
		});
		
	}); --%>


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
			return false;
		}else if(document.getElementById("postcode").value==""||document.getElementById("postcode").value.length<1){
			alert("주소를 입력해주세요");
			adress();
			return false		
		}else if(document.getElementById("addrsdetail").value==""||document.getElementById("addrsdetail").value.length<1){
			alert("상세주소를 입력해주세요");
			document.getElementById("addrsdetail").focus();
			return false
		}else if(document.getElementById("email").value==""||document.getElementById("email").value.length<1){
			alert("이메일을 입력해주세요");
			document.getElementById("email").focus();
			return false
		}else if(document.getElementById("termscheck").checked == false){
			alert("이용약관에 동의 해주세요");
			console.dir(document.getElementById("termcheck").checked);
			return false
		}
		else{
			href.location="mc";
		} 
		
	}
	
</script>

</head>
<body>
	<div class="container">
			<table class="table table-striped">
				<div class="text-center">
					<h3>ConvenienceX</h3>
				</div>

				<tr>
					<td>점포명</td>
					<td><input type="text" name="sname" id="sname"
						style="width: 500px" placeholder="점포명을 입력하세요" /><input
						type="button" value="중복확인" id="shopcheck" />
						<div></div> <input type="hidden" name="type" value="shopResistOk" /></td>

				</tr>
				<tr>
					<td>점포위치</td>
					<td><input type="text" name="postcode" id="postcode"
						placeholder="우편번호" disabled /><input type="button" value="주소찾기"
						onclick="adress();" /></td>

				</tr>
				<tr>
					<td></td>
					<td><input type="text" name="roadaddrs" id="roadaddrs"
						placeholder="도로명주소" style="width: 500px" disabled /><input type="text"
						name="jibunaddrs" id="jibunaddrs" placeholder="지번"
						style="width: 500px" disabled /></td>
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
					<td><input type="text" name="email" id="email" />@<input
						type="text" name="emailAddrs" id="emailAddrs" /> <select
						name="emailAddrsSelect" id="emailAddrsSelect"
						onchange="changeEmail()">
							<option name="emailAddrsSelect" value="default">주소를
								선택해주세요</option>
							<option name="emailAddrsSelect" value="naver.com">naver.com</option>
							<option name="emailAddrsSelect" value="daum.net">daum.net</option>
							<option name="emailAddrsSelect" value="gmail.com">gmail.com</option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" name="confirm" id="confirm"
						style="width: 500px" placeholder="인증번호를 입력하세요" /><a href="mc?type=sendEmail"><input
						type="button" value="인증요청" /></a>
						<div></div></td>

				</tr>
				<tr>
					<td></td>
					<td><textarea name="terms" id="" cols="80" rows="10" disabled>이용약관</textarea><br />
						<input type="checkbox" name="termscheck" id="termscheck" />모두
						읽었으며 동의합니다.</td>
				</tr>
			</table>
			<div class="text-center">
				<input type="button" id="goregist" value="등록하기"
					onclick="validation()" /> <a href="mc"><input id="back"
					type="button" value="돌아가기" /></a>
			</div>
	</div>
	
</body>
</html>