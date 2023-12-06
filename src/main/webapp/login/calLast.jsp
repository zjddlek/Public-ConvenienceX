<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
.tabss .tab {
	min-width: 90px;
	border: solid 1px;
	max-width: 280px;
	display: inline-block;
	padding: 13px 10px;
	text-align: center;
	font-size: 15.5px;
	text-align: center;
}

.tabss .tab a {
	color: black;
}

.tabss .tab.active {
	background-color: DimGray;
}

.tabss .tab.active a {
	color: white;
}

.button {
	border: 1px solid black;
}
</style>
<script type="text/javascript">

	

	$(()=>{
		$("#cashfiftythousand").on("click",()=>{
			$("#cashfiftythousand").val("");				
		});	
		$("#cashtenthousand").on("click",()=>{
			$("#cashtenthousand").val("");				
		});	
		$("#cashfivethousand").on("click",()=>{
			$("#cashfivethousand").val("");				
		});	
		$("#cashonethousand").on("click",()=>{
			$("#cashonethousand").val("");				
		});	
		$("#cashfivehundread").on("click",()=>{
			$("#cashfivehundread").val("");				
		});	
		$("#cashonehundread").on("click",()=>{
			$("#cashonehundread").val("");				
		});	
		$("#cashfifty").on("click",()=>{
			$("#cashfifty").val("");				
		});	
		$("#cashten").on("click",()=>{
			$("#cashten").val("");				
		});	
		$("#giftfiftythousand").on("click",()=>{
			$("#giftfiftythousand").val("");				
		});	
		$("#gifttenthousand").on("click",()=>{
			$("#gifttenthousand").val("");				
		});	
		$("#giftfivethousand").on("click",()=>{
			$("#giftfivethousand").val("");				
		});	
		$("#giftonethousand").on("click",()=>{
			$("#giftonethousand").val("");				
		});
		

	});
	
	function tabSelect(num) {
		  if (num == 1) {
		    $(".tab_1").addClass("active");
		    $(".tab_2").removeClass("active");

		    $("#tab_1").show();
		    $("#tab_2").hide();
		  } else {
		    $(".tab_2").addClass("active");
		    $(".tab_1").removeClass("active");

		    $("#tab_1").hide();
		    $("#tab_2").show();
		  }
		}

		function cancel() {
		  alert("취소");
		}

		function save() {
		  alert("저장");
		}
	
</script>

</head>
<body>
	<div class="container" style="padding: 0px;">
		<div class="section-header">
			<div class="tabs-wrap">
				<div class="tabss " style="margin-bottom: -1px;">
					<div class="tab tab_1 active">
						<a class="preset__tabLink" onclick="tabSelect('1');">
							<span class="dashName">중간정산</span>
						</a>
					</div>
					<div class="tab engineer__tab tab_2">
						<a class="preset__tabLink"  onclick="tabSelect('2');">
							<span class="dashName">마감정산</span>
						</a>
					</div>
				</div>
			</div>

			<div class="section-content" id="tab_1" style="padding-bottom: 10px;">
			
				<div class="preset-tab-body">
					<div>
						<table class="table table-striped table-bordered">
							<tr>
								<th colspan="2" class="text-center">현금</th>
								<td><input type="button" value="차액구하기"
									id="cashdifferencebtn" /></td>
							</tr>
							<tr>
								<th>권종</th>
								<th>수량</th>
								<th>금액</th>
							</tr>
							<tr>
								<th>50000원</th>
								<td><input type="text" name="cashfiftythousand"
									id="cashfiftythousand" class="money" value=0 /></td>
								<td><div id="sumcashfiftythousand"></div></td>
							</tr>
							<tr>
								<th>10000원</th>
								<td><input type="text" name="cashtenthousand"
									id="cashtenthousand" class="money" value=0 /></td>
								<td><div id="sumcashtenthousand"></div></td>
							</tr>
							<tr>
								<th>5000원</th>
								<td><input type="text" name="cashfivethousand"
									id="cashfivethousand" class="money" value=0 /></td>
								<td><div id="sumcashfivethousand"></div></td>
							</tr>
							<tr>
								<th>1000원</th>
								<td><input type="text" name="cashonethousand"
									id="cashonethousand" class="money" value=0 /></td>
								<td><div id="sumcashonethousand"></div></td>
							</tr>
							<tr>
								<th>500원</th>
								<td><input type="text" name="cashfivehundread"
									id="cashfivehundread" class="money" value=0 /></td>
								<td><div id="sumcashfivehundread"></div></td>
							</tr>
							<tr>
								<th>100원</th>
								<td><input type="text" name="cashonehundread"
									id="cashonehundread" class="money" value=0 /></td>
								<td><div id="sumcashonehundread"></div></td>
							</tr>
							<tr>
								<th>50원</th>
								<td><input type="text" name="cashfifty" id="cashfifty"
									class="money" value=0 /></td>
								<td><div id="sumcashfifty"></div></td>
							</tr>
							<tr>
								<th>10원</th>
								<td><input type="text" name="cashten" id="cashten"
									class="money" value=0 /></td>
								<td><div id="sumcashten"></div></td>
							</tr>
							<tr>
								<th colspan="2">합계</th>
								<td><div id="cashsum"></div></td>
							</tr>
							<tr>
								<th colspan="2">매출액</th>
								<td><div id="cashsales">
										<c:set var="cashtotal" value="0" />
										<c:forEach var="vo" items="${list}">
											<c:set var="cashtotal"
												value="${cashtotal + (vo.price*vo.cnt)}" />
										</c:forEach>
										<c:out value="${cashtotal}" />
									</div></td>
							</tr>
							<tr>
								<th colspan="2">차액</th>
								<td><div id="cashdifference"></div></td>
							</tr>
						</table>
						<table class="table table-striped table-bordered">
							<tr>
								<th colspan="2" class="text-center">상품권</th>
								<td><input type="button" value="차액구하기"
									id="giftdifferencebtn" /></td>
							</tr>
							<tr>
								<th>권종</th>
								<th>수량</th>
								<th>금액</th>
							</tr>
							<tr>
								<th>50000원</th>
								<td><input type="text" name="giftfiftythousand"
									id="giftfiftythousand" class="money" value=0 /></td>
								<td><div id="sumgiftfiftythousand"></div></td>
							</tr>
							<tr>
								<th>10000원</th>
								<td><input type="text" name="gifttenthousand"
									id="gifttenthousand" class="money" value=0 /></td>
								<td><div id="sumgifttenthousand"></div></td>
							</tr>
							<tr>
								<th>5000원</th>
								<td><input type="text" name="giftfivethousand"
									id="giftfivethousand" class="money" value=0 /></td>
								<td><div id="sumgiftfivethousand"></div></td>
							</tr>
							<tr>
								<th>1000원</th>
								<td><input type="text" name="giftonethousand"
									id="giftonethousand" class="money" value=0 /></td>
								<td><div id="sumgiftonethousand"></div></td>
							</tr>
							<tr>
								<th colspan="2">합계</th>
								<td><div id="giftsum"></div></td>
							</tr>
							<tr>
								<th colspan="2">매출액</th>
								<td><div id="giftsales">
										<c:set var="gifttotal" value="0" />
										<c:forEach var="vo" items="${list2}">
											<c:set var="gifttotal"
												value="${gifttotal + (vo.price*vo.cnt)}" />
										</c:forEach>
										<c:out value="${gifttotal }" />
									</div></td>
							</tr>
							<tr>
								<th colspan="2">차액</th>
								<td><div id="giftdifference"></div></td>
							</tr>

						</table>
						<input type="button" value="정산하기" /> <input type="hidden"
							name="empno" value="<%=request.getParameter("empno")%>" />
					</div>

				</div>
			</div>
			<div class="section-content" id="tab_2" style="display: none;">
				<div class="preset-tab-body">
					<div>
						<table class="table table-striped table-bordered">
							<tr>
								<th colspan="2" class="text-center">현금</th>
								<td><input type="button" value="차액구하기"
									id="cashdifferencebtn" /></td>
							</tr>
							<tr>
								<th>권종</th>
								<th>수량</th>
								<th>금액</th>
							</tr>
							<tr>
								<th>50000원</th>
								<td><input type="text" name="cashfiftythousand"
									id="cashfiftythousand" class="money" value=0 /></td>
								<td><div id="sumcashfiftythousand"></div></td>
							</tr>
							<tr>
								<th>10000원</th>
								<td><input type="text" name="cashtenthousand"
									id="cashtenthousand" class="money" value=0 /></td>
								<td><div id="sumcashtenthousand"></div></td>
							</tr>
							<tr>
								<th>5000원</th>
								<td><input type="text" name="cashfivethousand"
									id="cashfivethousand" class="money" value=0 /></td>
								<td><div id="sumcashfivethousand"></div></td>
							</tr>
							<tr>
								<th>1000원</th>
								<td><input type="text" name="cashonethousand"
									id="cashonethousand" class="money" value=0 /></td>
								<td><div id="sumcashonethousand"></div></td>
							</tr>
							<tr>
								<th>500원</th>
								<td><input type="text" name="cashfivehundread"
									id="cashfivehundread" class="money" value=0 /></td>
								<td><div id="sumcashfivehundread"></div></td>
							</tr>
							<tr>
								<th>100원</th>
								<td><input type="text" name="cashonehundread"
									id="cashonehundread" class="money" value=0 /></td>
								<td><div id="sumcashonehundread"></div></td>
							</tr>
							<tr>
								<th>50원</th>
								<td><input type="text" name="cashfifty" id="cashfifty"
									class="money" value=0 /></td>
								<td><div id="sumcashfifty"></div></td>
							</tr>
							<tr>
								<th>10원</th>
								<td><input type="text" name="cashten" id="cashten"
									class="money" value=0 /></td>
								<td><div id="sumcashten"></div></td>
							</tr>
							<tr>
								<th colspan="2">합계</th>
								<td><div id="cashsum"></div></td>
							</tr>
							<tr>
								<th colspan="2">매출액</th>
								<td><div id="cashsales">
										<c:set var="cashtotal" value="0" />
										<c:forEach var="vo" items="${list}">
											<c:set var="cashtotal"
												value="${cashtotal + (vo.price*vo.cnt)}" />
										</c:forEach>
										<c:out value="${cashtotal}" />
									</div></td>
							</tr>
							<tr>
								<th colspan="2">차액</th>
								<td><div id="cashdifference"></div></td>
							</tr>
						</table>
						<table class="table table-striped table-bordered">
							<tr>
								<th colspan="2" class="text-center">상품권</th>
								<td><input type="button" value="차액구하기"
									id="giftdifferencebtn" /></td>
							</tr>
							<tr>
								<th>권종</th>
								<th>수량</th>
								<th>금액</th>
							</tr>
							<tr>
								<th>50000원</th>
								<td><input type="text" name="giftfiftythousand"
									id="giftfiftythousand" class="money" value=0 /></td>
								<td><div id="sumgiftfiftythousand"></div></td>
							</tr>
							<tr>
								<th>10000원</th>
								<td><input type="text" name="gifttenthousand"
									id="gifttenthousand" class="money" value=0 /></td>
								<td><div id="sumgifttenthousand"></div></td>
							</tr>
							<tr>
								<th>5000원</th>
								<td><input type="text" name="giftfivethousand"
									id="giftfivethousand" class="money" value=0 /></td>
								<td><div id="sumgiftfivethousand"></div></td>
							</tr>
							<tr>
								<th>1000원</th>
								<td><input type="text" name="giftonethousand"
									id="giftonethousand" class="money" value=0 /></td>
								<td><div id="sumgiftonethousand"></div></td>
							</tr>
							<tr>
								<th colspan="2">합계</th>
								<td><div id="giftsum"></div></td>
							</tr>
							<tr>
								<th colspan="2">매출액</th>
								<td><div id="giftsales">
										<c:set var="gifttotal" value="0" />
										<c:forEach var="vo" items="${list2}">
											<c:set var="gifttotal"
												value="${gifttotal + (vo.price*vo.cnt)}" />
										</c:forEach>
										<c:out value="${gifttotal }" />
									</div></td>
							</tr>
							<tr>
								<th colspan="2">차액</th>
								<td><div id="giftdifference"></div></td>
							</tr>

						</table>
						<input type="button" value="정산하기" /> <input type="hidden"
							name="empno" value="<%=request.getParameter("empno")%>" />
					</div>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(()=>{
			$
			
			
			
			$("#cashfiftythousand").on("keyup",()=>{
				$("#sumcashfiftythousand").text($("#cashfiftythousand").val()*50000);	
			});
			$("#cashtenthousand").on("keyup",()=>{
				$("#sumcashtenthousand").text($("#cashtenthousand").val()*10000);	
			});
			$("#cashfivethousand").on("keyup",()=>{
				$("#sumcashfivethousand").text($("#cashfivethousand").val()*5000);	
			});
			$("#cashonethousand").on("keyup",()=>{
				$("#sumcashonethousand").text($("#cashonethousand").val()*1000);	
			});
			$("#cashfivehundread").on("keyup",()=>{
				$("#sumcashfivehundread").text($("#cashfivehundread").val()*500);	
			});
			$("#cashonehundread").on("keyup",()=>{
				$("#sumcashonehundread").text($("#cashonehundread").val()*100);	
			});
			$("#cashfifty").on("keyup",()=>{
				$("#sumcashfifty").text($("#cashfifty").val()*50);	
			});
			$("#cashten").on("keyup",()=>{
				$("#sumcashten").text($("#cashten").val()*10);	
			});
			$("#giftfiftythousand").on("keyup",()=>{
				$("#sumgiftfiftythousand").text($("#giftfiftythousand").val()*50000);	
			});
			$("#gifttenthousand").on("keyup",()=>{
				$("#sumgifttenthousand").text($("#gifttenthousand").val()*10000);	
			});
			$("#giftfivethousand").on("keyup",()=>{
				$("#sumgiftfivethousand").text($("#giftfivethousand").val()*5000);	
			});
			$("#giftonethousand").on("keyup",()=>{
				$("#sumgiftonethousand").text($("#giftonethousand").val()*1000);	
			});
			
			
				
			 $("#cashdifferencebtn").on("click",()=>{
				$("#cashsum").text(($("#cashfiftythousand").val()*50000)+($("#cashtenthousand").val()*10000)+($("#cashfivethousand").val()*5000)+($("#cashonethousand").val()*1000)+($("#cashfivehundread").val()*500)+($("#cashonehundread").val()*100)
						+($("#cashfifty").val()*50)+($("#cashten").val()*10));
				$("#cashdifference").text(((($("#cashfiftythousand").val()*50000)+($("#cashtenthousand").val()*10000)+($("#cashfivethousand").val()*5000)+($("#cashonethousand").val()*1000)+($("#cashfivehundread").val()*500)+($("#cashonehundread").val()*100)
				+($("#cashfifty").val()*50)+($("#cashten").val()*10))-${cashtotal}));
							
			});
		
		$("#giftdifferencebtn").on("click",()=>{
			$("#giftsum").text(($("#giftfiftythousand").val()*50000)+($("#gifttenthousand").val()*10000)+($("#giftfivethousand").val()*5000)+($("#giftonethousand").val()*1000));
			$("#giftdifference").text((($("#giftfiftythousand").val()*50000)+($("#gifttenthousand").val()*10000)+($("#giftfivethousand").val()*5000)+($("#giftonethousand").val()*1000))-${gifttotal});
						
		});

		
		$("input[value='정산하기']").on("click",()=>{
			if(confirm("정산을 완료하시겠습니까? \n 확인을 누르시면 더이상 수정할 수 없습니다.")){
				alert("정산완료");
				location.href="mc?type=attend&sno=${svo.sno }&empno=<%=request.getParameter("empno")%>";
			}else{
				return false;
			}
		});
		
		
		});
	
	
	
	</script>
</body>
</html>