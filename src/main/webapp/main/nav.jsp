<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jquery --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<%-- 부트스트랩 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./style/nav.css" />


<nav class="navbar navbar-expand-lg">
  	<div class="container-fluid">
    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      		<span class="navbar-toggler-icon"></span>
    	</button>
    	<div class="collapse navbar-collapse" id="navbarNav">
    		<div>
	    		<img src="./images/conveni.PNG" alt="" />
		      	<ul class="navbar-nav">
		        	<li class="nav-item">
		         	 	<a class="nav-link" href="mc?type=main">메인 페이지</a>
		       	 	</li>
		        	<li class="nav-item">
		         	 	<a class="nav-link" href="mc?type=sales&sno=${svo.sno }">판매 관리</a>
		       	 	</li>
		        	<li class="nav-item">
		         	 	<a class="nav-link" href="mc?type=orders&sno=${svo.sno }">발주</a>
		        	</li>
		        	<li class="nav-item">
		          		<a class="nav-link" href="mc?type=stock&sno=${svo.sno }">재고관리</a>
		        	</li>
		        	<li class="nav-item">
		          		<a class="nav-link" href="mc?type=calList&sno=${svo.sno }" >중간/마감 이력</a>
		        	</li>
		        	<li class="nav-item">
		          		<a class="nav-link" href="mc?type=profit&sno=${svo.sno }" >매출 현황</a>
		        	</li>
		        	<%-- <li class="nav-item dropdown">
		          		<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="">정산</a>
		          		<div class="dropdown-menu" >
		          			<a href="mc?type=calList&sno=${svo.sno }" class="dropdown-item">중간/마감 이력</a>
		          			<div class="dropdown-divider"></div>
                            <a href="mc?type=profit&sno=${svo.sno }" class="dropdown-item">매출 현황</a>
		          		</div>
		        	</li> --%>
		        	<li class="nav-item">
		          		<a class="nav-link" href="mc?type=dispose&sno=${svo.sno }">폐기</a>
		        	</li>
		        	<li class="nav-item">
		          		<a class="nav-link" href="mc?type=emp&sno=${svo.sno}&jobno=${vo.jobno}">인사관리</a>
		        	</li>
		        	<li class="nav-item">
		          		<a class="nav-link" href="mc?type=workmain&sno=${svo.sno }">출퇴근</a>
		        	</li>
		      	</ul>
	      	</div>
    		<h5><strong>${svo.sname }</strong></h5>
    	</div>
  	</div>
</nav>
