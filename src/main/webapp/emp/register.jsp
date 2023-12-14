<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
#root {
	margin: auto;
	width: 60px;
	margin: auto;
	width: 900px;
	height: 1200px;
	margin-top: 50px;
	margin-bottom: 50px;
}

#header {
	padding-top: 20px;
	withd: 100%;
	height: 100px;
	text-align: center;
	
}

#leftpicture {
	width: 50%;
	height: 250px;
	float: left;
	display: flex;
	justify-content: right;
	padding-top: 50px;
	padding-left: 300px;
	
}

#rightside {
	width: 50%;
	height: 250px;
	float: right;
	margin-top:20px;
	
}

#middle {
	height: 650px;
	padding-left: 200px;
	padding-top: 20px;
	
}

#buttons {
	text-align: center;
	margin: auto;
}


#img {
	margin-left: 150px;
}

#picture {
	width: 100%;
	width:180px;
	height: 180px;
	margin-right: 120px;
}

#idChecking{
	margin-left: 70px;

}


#pic{
	width:250px;
	height:200px;
	padding-left: 40px;
	padding-bottom: 20px;
}


.navbar{

  display: inline-block;

  float: none;

}

</style>

<script>

    let idresult=false;

	window.onload=()=>{
	
		let btn=document.getElementById("btn");
		btn.onclick = openkakaoPostCode;
		
		
		
		
		const img = document.querySelector("#img");
		img.addEventListener("change",(e)=> {
			console.log(e);
			const reader = new FileReader()
			reader.readAsDataURL(e.target.files[0])
	 
			  reader.onload  =function(event){
				/* console.log(event)
				const img=document.createElement("img")
				img.setAttribute("src",event.target.result)
				document.querySelector("#lefpticture").appendChild(img)   */ 
				
				$("#pic").hide();
				
				  const picture = document.querySelector("#picture")
				picture.setAttribute("src",event.target.result) 
			}
				
		});

			
	

	function openkakaoPostCode(){
		console.log("버튼 눌림");
		new daum.Postcode({
		oncomplete: function(data){
			//팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
			//console.log("팝업검색버튼 누름");
			console.dir(data);
			//document.getElementById("address").value= data.zonecode;
			document.getElementById("address").value= data.roadAddress;
			//document.getElementById("address_detail").value= data.jibunAddress;

			}
		}).open();
		
	}
		
	
	
	
	
	$("#bnt").on("click",()=>{
        let id = $("#id").val();
        console.log(id);
        
		$.ajax({
			url:"/cx/idCheck",
			async:true,
			type:"GET",
			data:{id:id},
			datatype:JSON,
			success:function(data){
				
				let idCheck=$("#idcheck"); 
				
				count=data.count;
				if(count==0){
					idCheck.text("사용가능한 아이디입니다.");
					//$("#idCheck").css("color","green");
					idcheck.style.color="green",
					idresult=true;
					
					
				}else{
					idCheck.text("이미 사용중인 아이디입니다.");
					//$("#idCheck").css("color","red");
					idcheck.style.color="red";

				}
				
			},
			error:function(){
				alert("error");
			}
		})

	})

	}
</script>

<body>
	<jsp:include page="/main/nav.jsp"></jsp:include>

	<div class="container border border-primary border-3 rounded-3" id="root">
		<div id="header">
			<h3>사원 등록</h3>
		</div>
		<form action="registerController" method="post" enctype="multipart/form-data">
			
			<div id="leftpicture">
				<div id="picturebox">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACgCAMAAACBpqFQAAAAMFBMVEXu7u6ZmZmurq7Z2dnDw8Pe3t7Ozs6+vr6enp7p6enJycmpqanj4+Ojo6O5ubmzs7NLxFgzAAAB2klEQVR4nO3X3XLCIBCGYZa/BEjM/d9tWYgprXbGHtS25n0OVCLj6De7YTUGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPAvTHZc2WlYRBs+7w77pZS9dz/7xf4iK+NKxui8XPMIm8yXpb5w/VKYpRqDfW0p+qjPGla0TehhTW2Rh7BqNmWVko6wVokprHJTeC+q1UZZelheGtfDsm0Rh7AmXV2ktt6lX5JSH7L4X/wBz7RKXqYezZ6Ku4bV316GsKzUoopi90SNmbWorMTf+vbP5doNp8gXYWW5mCEsX3cne2zS4KRIK68ziK2Ftlo/98IKvYCOsNIstWs3c4Rl3NbuaucQNJWawd3K0vvZHMbTME17NrrJj07RiVY2X7S8eljZuXwNK84So6b1HtZB5ywZ2Xsf/mrSVn+ptuLNaVhzitqn6xiWjq7T1MdUNzrN9NAeNSzXW2rplZV1+jTxQ2XpLmvNPjmYPpfZ80ylu4cm+D572Xp8pr5t1qzO0YOjR8PyfrWLtJHiuo2whsVNGxZZe1pS9H5FWMPicxvWv86ptGtnOgq/L+oBkJ3+/9blmYYsAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4EneAHYKB+xqekqbAAAAAElFTkSuQmCC" alt="" id="pic" />
				</div>
		 		<img src="${vo.picture}" id="picture" name="picture" />
			</div>

			<div id="rightside">
				<div class="col-md-4 offset-md-1 row my-3">
					<label for="username">사원명</label> <input type="text"
						class="form-control" name="ename"> <input type="hidden"
						name="type" value="registerOk" />
				</div>


				<div class="col-md-4 offset-md-1 row my-3">
					<label for="username">생년월일</label> <input type="date"
						class="form-control" name="date" />
				</div>
				<div class="col-md-4 offset-md-1 row my-3">
					<label for="username">전화번호</label> <input type="text"
						class="form-control" name="phone" />
				</div>

				<div class="col-md-4 offset-md-2 row my-3">
					<input type="hidden" name="empno" />
					<!-- empno는 자동 생성되도록 넣어줌 -->
				</div>
			</div>

			<input type="file" value="파일검색" id="img" name="img" accept="image/*" />

			<div id="middle">
				<div class="row">
					<div class="col-md-3 offset-md-1 row my-1">
						<label for="username">아이디</label> 
						<input type="text" class="form-control" name="id" id="id" />
					</div>

					<div class="col-md-2 row offset-md-1">
						<label for="username">&nbsp;</label> 
						<input type="button" id="bnt" class="btn btn-success" value="중복확인" />
					</div>
					<div id="idChecking">
						<span  id="idcheck">  </span>
					</div>
				</div>

				<div class="col-md-3 offset-md-1 row my-3">
					<label for="username">비밀번호</label> <input type="password"
						class="form-control" name="pwd" />
				</div>

				<div class="col-md-7 offset-md-1 row my-3">
					<label for="username">이메일</label> <input type="text"
						class="form-control" name="email" />
				</div>

				<div class="row">
				<div class="col-md-5 offset-md-1 row my-1">
					<label for="username">주소</label> <input type="text"
						class="form-control" name="address" id="address" />
				</div>
				<div class="col-md-2 row offset-md-1">
					<label for="username">&nbsp;</label> 
					<input type="button" value="주소검색" id="btn" class="btn btn-success" />
				</div>
				
				</div>
				

				<div class="col-md-8 offset-md-1 row my-3">
					<label for="username">상세주소</label> <input type="text"
						class="form-control" name="address_detail" id="address_detail" />
				</div>
				<!-- <div class="col-md-6 offset-md-4">
					<input type="button" value="주소검색" id="btn" class="btn btn-success" />
				</div> -->

				<div class="col-md-4 offset-md-1 row my-3">
					<label for="username">입사일자</label> <input type="date"
						class="form-control" name="hiredate" />
				</div>

				<div class="col-md-4 offset-md-2 row my-3">
					<input type="hidden" class="form-control" name="sal_hour"
						value="10000" />
				</div>

				<div class="col-md-4 offset-md-1 row my-3">
					<label for="username">구분</label> <select name="jobno" id="jobno">
						<option value="">---선택하세요---</option>
						<option value="100">아르바이트</option>
						<option value="200">사원</option>
						<option value="300">매니저</option>
						<option value="400">점장</option>

					</select>
				</div>
			</div>

			<div id="buttons">

				<div class="col-md-4 offset-md-2 row my-3">
					<input type="hidden" class="form-control" name="sno" value="${svo.sno }" />
				</div>

				<div class="col-md-4 offset-md-2 row my-3">
					<input type="hidden" class="form-control" name="isretire" value="N" />
				</div>

				<div class="col-md-6 offset-md-4">
					<button type="submit" class="btn btn-primary">등록하기</button>
					<a href="mc?type=emp&sno=${svo.sno }&jobno=${vo.jobno}"> 
					<input type="button" class="btn btn-danger" value="취소" />
					</a>
				</div>
			</div>
		</form>
	</div>


</body>
</html>
<!-- 
<script>

const picture = document.querySelector("#picture")
picture.addEventListener("change",(e)=> {
	console.log(e);
	const reader = new FileReader()
	reader.readAsDataURL(e.target.files[0])

	reader.onload  =function(event){
		console.log(event)
		const img=document.createElement("img")
		img.setAttribute("src",event.target.result)
		document.querySelector("#image_container").appendChild(img)
		
		//const picture = document.querySelector("#picture")
		//picture.setAttribute("src",event.target.result)
	}
	
})


</script> -->