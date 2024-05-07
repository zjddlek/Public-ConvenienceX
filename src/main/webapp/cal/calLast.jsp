<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중간/마감정산</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

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

	let tab=1;

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
		//마감
		$("#endcashfiftythousand").on("click",()=>{
			$("#endcashfiftythousand").val("");				
		});	
		$("#endcashtenthousand").on("click",()=>{
			$("#endcashtenthousand").val("");				
		});	
		$("#endcashfivethousand").on("click",()=>{
			$("#endcashfivethousand").val("");				
		});	
		$("#endcashonethousand").on("click",()=>{
			$("#endcashonethousand").val("");				
		});	
		$("#endcashfivehundread").on("click",()=>{
			$("#endcashfivehundread").val("");				
		});	
		$("#endcashonehundread").on("click",()=>{
			$("#endcashonehundread").val("");				
		});	
		$("#endcashfifty").on("click",()=>{
			$("#endcashfifty").val("");				
		});	
		$("#endcashten").on("click",()=>{
			$("#endcashten").val("");				
		});	
		$("#endgiftfiftythousand").on("click",()=>{
			$("#endgiftfiftythousand").val("");				
		});	
		$("#endgifttenthousand").on("click",()=>{
			$("#endgifttenthousand").val("");				
		});	
		$("#endgiftfivethousand").on("click",()=>{
			$("#endgiftfivethousand").val("");				
		});	
		$("#endgiftonethousand").on("click",()=>{
			$("#endgiftonethousand").val("");				
		});
	});
	
	function tabSelect(num) {
		  if (num == 1) {
		    $(".tab_1").addClass("active");
		    $(".tab_2").removeClass("active");
	
		    $("#tab_1").show();
		    $("#tab_2").hide();
		    
		    tab = 1;
		  } else {
		    $(".tab_2").addClass("active");
		    $(".tab_1").removeClass("active");

		    $("#tab_1").hide();
		    $("#tab_2").show();
		    tab = 2;
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
								<th colspan="3" class="text-center">카드</th>
							</tr>
							<tr>
								<th colspan="2">카드 총매출</th>
								<td><div id="cashsales">
										<c:set var="cardtotal" value="0" />
										<c:forEach var="vo" items="${list}">
											<c:set var="cardtotal"
												value="${cardtotal + (vo.price*vo.cnt)}" />
										</c:forEach>
										<c:out value="${cardtotal}" />
									</div></td>
							</tr>
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
										<c:forEach var="vo" items="${list2}">
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
										<c:forEach var="vo" items="${list3}">
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
						<!-- 마감 -->
						<div class="form-control text-center">
							<input type="button" value="정산하기" class="btn btn-primary rounded w-75" /> <input type="hidden" name="empno" value="<%=request.getParameter("empno")%>" />
						</div>
					</div>

				</div>
			</div>
			<div class="section-content" id="tab_2" style="display: none;">
				<div class="preset-tab-body">
					<div>
						<table class="table table-striped table-bordered">
							<tr>
								<th colspan="3" class="text-center">카드</th>
							</tr>
							<tr>
								<th colspan="2">카드 총매출</th>
								<td><div id="cashsales">
										<c:set var="cardendtotal" value="0" />
										<c:forEach var="evo" items="${endCardCal}">
											<c:set var="cardendtotal"
												value="${cardtotal + (evo.price*evo.cnt)}" />
										</c:forEach>
										<c:out value="${cardendtotal}" />
									</div></td>
							</tr>
						</table>
						
						
						<table class="table table-striped table-bordered">
							<tr>
								<th colspan="2" class="text-center">현금</th>
								<td><input type="button" value="차액구하기"
									id="endcashdifferencebtn" /></td>
							</tr>
							<tr>
								<th>권종</th>
								<th>수량</th>
								<th>금액</th>
							</tr>
							<tr>
								<th>50000원</th>
								<td><input type="text" name="cashfiftythousand"
									id="endcashfiftythousand" class="money" value=0 /></td>
								<td><div id="endsumcashfiftythousand"></div></td>
							</tr>
							<tr>
								<th>10000원</th>
								<td><input type="text" name="cashtenthousand"
									id="endcashtenthousand" class="money" value=0 /></td>
								<td><div id="endsumcashtenthousand"></div></td>
							</tr>
							<tr>
								<th>5000원</th>
								<td><input type="text" name="cashfivethousand"
									id="endcashfivethousand" class="money" value=0 /></td>
								<td><div id="endsumcashfivethousand"></div></td>
							</tr>
							<tr>
								<th>1000원</th>
								<td><input type="text" name="cashonethousand"
									id="endcashonethousand" class="money" value=0 /></td>
								<td><div id="endsumcashonethousand"></div></td>
							</tr>
							<tr>
								<th>500원</th>
								<td><input type="text" name="cashfivehundread"
									id="endcashfivehundread" class="money" value=0 /></td>
								<td><div id="endsumcashfivehundread"></div></td>
							</tr>
							<tr>
								<th>100원</th>
								<td><input type="text" name="cashonehundread"
									id="endcashonehundread" class="money" value=0 /></td>
								<td><div id="endsumcashonehundread"></div></td>
							</tr>
							<tr>
								<th>50원</th>
								<td><input type="text" name="cashfifty" id="endcashfifty"
									class="money" value=0 /></td>
								<td><div id="endsumcashfifty"></div></td>
							</tr>
							<tr>
								<th>10원</th>
								<td><input type="text" name="cashten" id="endcashten"
									class="money" value=0 /></td>
								<td><div id="endsumcashten"></div></td>
							</tr>
							<tr>
								<th colspan="2">합계</th>
								<td><div id="endcashsum"></div></td>
							</tr>
							<tr>
								<th colspan="2">매출액</th>
								<td><div id="cashsales">
										<c:set var="cashendtotal" value="0" />
										<c:forEach var="evo" items="${endCashCal}">
											<c:set var="cashendtotal"
												value="${cashendtotal + (evo.price*evo.cnt)}" />
										</c:forEach>
										<c:out value="${cashendtotal}" />
									</div></td>
							</tr>
							<tr>
								<th colspan="2">차액</th>
								<td><div id="endcashdifference"></div></td>
							</tr>
						</table>
						<table class="table table-striped table-bordered">
							<tr>
								<th colspan="2" class="text-center">상품권</th>
								<td><input type="button" value="차액구하기"
									id="endgiftdifferencebtn" /></td>
							</tr>
							<tr>
								<th>권종</th>
								<th>수량</th>
								<th>금액</th>
							</tr>
							<tr>
								<th>50000원</th>
								<td><input type="text" name="giftfiftythousand"
									id="endgiftfiftythousand" class="money" value=0 /></td>
								<td><div id="endsumgiftfiftythousand"></div></td>
							</tr>
							<tr>
								<th>10000원</th>
								<td><input type="text" name="gifttenthousand"
									id="endgifttenthousand" class="money" value=0 /></td>
								<td><div id="endsumgifttenthousand"></div></td>
							</tr>
							<tr>
								<th>5000원</th>
								<td><input type="text" name="giftfivethousand"
									id="endgiftfivethousand" class="money" value=0 /></td>
								<td><div id="endsumgiftfivethousand"></div></td>
							</tr>
							<tr>
								<th>1000원</th>
								<td><input type="text" name="giftonethousand"
									id="endgiftonethousand" class="money" value=0 /></td>
								<td><div id="endsumgiftonethousand"></div></td>
							</tr>
							<tr>
								<th colspan="2">합계</th>
								<td><div id="endgiftsum"></div></td>
							</tr>
							<tr>
								<th colspan="2">매출액</th>
								<td><div id="giftsales">
										<c:set var="giftendtotal" value="0" />
										<c:forEach var="vo" items="${endGiftCal}">
											<c:set var="giftendtotal"
												value="${giftendtotal + (vo.price*vo.cnt)}" />
										</c:forEach>
										<c:out value="${giftendtotal }" />
									</div></td>
							</tr>
							<tr>
								<th colspan="2">차액</th>
								<td><div id="endgiftdifference"></div></td>
							</tr>

						</table>
						<div class="form-control text-center">
							<input type="button" value="정산하기" class="btn btn-primary rounded w-75" />
							<input type="hidden" name="empno" value="<%=request.getParameter("empno")%>" />
							
						</div>	
					</div>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	let allDifference = ((($("#cashfiftythousand").val()*50000)+($("#cashtenthousand").val()*10000)+($("#cashfivethousand").val()*5000)+($("#cashonethousand").val()*1000)+($("#cashfivehundread").val()*500)+($("#cashonehundread").val()*100)
			+($("#cashfifty").val()*50)+($("#cashten").val()*10))-${cashtotal})+((($("#giftfiftythousand").val()*50000)+($("#gifttenthousand").val()*10000)+($("#giftfivethousand").val()*5000)+($("#giftonethousand").val()*1000))-${gifttotal});
	let allSales = ${cashtotal+cardtotal+gifttotal};
	let allEndDifference = ((($("#endcashfiftythousand").val()*50000)+($("#endcashtenthousand").val()*10000)+($("#endcashfivethousand").val()*5000)+($("#endcashonethousand").val()*1000)+($("#endcashfivehundread").val()*500)+($("#endcashonehundread").val()*100)
			+($("#endcashfifty").val()*50)+($("#endcashten").val()*10))-${cashendtotal})+((($("#endgiftfiftythousand").val()*50000)+($("#endgifttenthousand").val()*10000)+($("#endgiftfivethousand").val()*5000)+($("#endgiftonethousand").val()*1000))-${giftendtotal});
	let allEndSales = ${cashendtotal+cardendtotal+giftendtotal};
		$(()=>{		
			$("#cashfiftythousand").on("keyup",()=>{
				if($("#cashfiftythousand").val()==0)$("#sumcashfiftythousand").text(0);
				$("#sumcashfiftythousand").text($("#cashfiftythousand").val()*50000);	
			});
			$("#cashtenthousand").on("keyup",()=>{
				if($("#cashtenthousand").val()==0)$("#sumcashtenthousand").text(0);
				$("#sumcashtenthousand").text($("#cashtenthousand").val()*10000);	
			});
			$("#cashfivethousand").on("keyup",()=>{
				if($("#cashfivethousand").val()==0)$("#sumcashfivethousand").text(0);				
				$("#sumcashfivethousand").text($("#cashfivethousand").val()*5000);	
			});
			$("#cashonethousand").on("keyup",()=>{
				if($("#cashonethousand").val()==0)$("#sumcashonethousand").text(0);				
				$("#sumcashonethousand").text($("#cashonethousand").val()*1000);	
			});
			$("#cashfivehundread").on("keyup",()=>{
				if($("#cashfivehundread").val()==0)$("#sumcashfivehundread").text(0);				
				$("#sumcashfivehundread").text($("#cashfivehundread").val()*500);	
			});
			$("#cashonehundread").on("keyup",()=>{
				if($("#cashonehundread").val()==0)$("#sumcashonehundread").text(0);				
				$("#sumcashonehundread").text($("#cashonehundread").val()*100);	
			});
			$("#cashfifty").on("keyup",()=>{
				if($("#cashfifty").val()==0)$("#sumcashfifty").text(0);				
				$("#sumcashfifty").text($("#cashfifty").val()*50);	
			});
			$("#cashten").on("keyup",()=>{
				if($("#cashten").val()==0)$("#sumcashten").text(0);				
				$("#sumcashten").text($("#cashten").val()*10);	
			});
			$("#giftfiftythousand").on("keyup",()=>{
				if($("#giftfiftythousand").val()==0)$("#sumgiftfiftythousand").text(0);				
				$("#sumgiftfiftythousand").text($("#giftfiftythousand").val()*50000);	
			});
			$("#gifttenthousand").on("keyup",()=>{
				if($("#gifttenthousand").val()==0)$("#sumgifttenthousand").text(0);				
				$("#sumgifttenthousand").text($("#gifttenthousand").val()*10000);	
			});
			$("#giftfivethousand").on("keyup",()=>{
				if($("#giftfivethousand").val()==0)$("#sumgiftfivethousand").text(0);				
				$("#sumgiftfivethousand").text($("#giftfivethousand").val()*5000);	
			});
			$("#giftonethousand").on("keyup",()=>{
				if($("#giftonethousand").val()==0)$("#sumgiftonethousand").text(0);				
				$("#sumgiftonethousand").text($("#giftonethousand").val()*1000);	
			});
			
			//마감
			$("#endcashfiftythousand").on("keyup",()=>{
				if($("#endcashfiftythousand").val()==0)$("#endsumcashfiftythousand").text(0);
				$("#endsumcashfiftythousand").text($("#endcashfiftythousand").val()*50000);	
			});
			$("#endcashtenthousand").on("keyup",()=>{
				if($("#endcashtenthousand").val()==0)$("#endsumcashtenthousand").text(0);
				$("#endsumcashtenthousand").text($("#endcashtenthousand").val()*10000);	
			});
			$("#endcashfivethousand").on("keyup",()=>{
				if($("#endcashfivethousand").val()==0)$("#endsumcashfivethousand").text(0);				
				$("#endsumcashfivethousand").text($("#endcashfivethousand").val()*5000);	
			});
			$("#endcashonethousand").on("keyup",()=>{
				if($("#endcashonethousand").val()==0)$("#endsumcashonethousand").text(0);				
				$("#endsumcashonethousand").text($("#endcashonethousand").val()*1000);	
			});
			$("#endcashfivehundread").on("keyup",()=>{
				if($("#endcashfivehundread").val()==0)$("#endsumcashfivehundread").text(0);				
				$("#endsumcashfivehundread").text($("#endcashfivehundread").val()*500);	
			});
			$("#endcashonehundread").on("keyup",()=>{
				if($("#endcashonehundread").val()==0)$("#endsumcashonehundread").text(0);				
				$("#endsumcashonehundread").text($("#endcashonehundread").val()*100);	
			});
			$("#endcashfifty").on("keyup",()=>{
				if($("#endcashfifty").val()==0)$("#endsumcashfifty").text(0);				
				$("#endsumcashfifty").text($("#endcashfifty").val()*50);	
			});
			$("#endcashten").on("keyup",()=>{
				if($("#endcashten").val()==0)$("#endsumcashten").text(0);				
				$("#endsumcashten").text($("#endcashten").val()*10);	
			});
			$("#endgiftfiftythousand").on("keyup",()=>{
				if($("#endgiftfiftythousand").val()==0)$("#endsumgiftfiftythousand").text(0);				
				$("#endsumgiftfiftythousand").text($("#endgiftfiftythousand").val()*50000);	
			});
			$("#endgifttenthousand").on("keyup",()=>{
				if($("#endgifttenthousand").val()==0)$("#endsumgifttenthousand").text(0);				
				$("#endsumgifttenthousand").text($("#endgifttenthousand").val()*10000);	
			});
			$("#endgiftfivethousand").on("keyup",()=>{
				if($("#endgiftfivethousand").val()==0)$("#endsumgiftfivethousand").text(0);				
				$("#endsumgiftfivethousand").text($("#endgiftfivethousand").val()*5000);	
			});
			$("#endgiftonethousand").on("keyup",()=>{
				if($("#endgiftonethousand").val()==0)$("#endsumgiftonethousand").text(0);				
				$("#endsumgiftonethousand").text($("#endgiftonethousand").val()*1000);	
			});
			
				
			 $("#cashdifferencebtn").on("click",()=>{
				$("#cashsum").text(($("#cashfiftythousand").val()*50000)+($("#cashtenthousand").val()*10000)+($("#cashfivethousand").val()*5000)+($("#cashonethousand").val()*1000)+($("#cashfivehundread").val()*500)+($("#cashonehundread").val()*100)
						+($("#cashfifty").val()*50)+($("#cashten").val()*10));
				$("#cashdifference").text(((($("#cashfiftythousand").val()*50000)+($("#cashtenthousand").val()*10000)+($("#cashfivethousand").val()*5000)+($("#cashonethousand").val()*1000)+($("#cashfivehundread").val()*500)+($("#cashonehundread").val()*100)
				+($("#cashfifty").val()*50)+($("#cashten").val()*10))-${cashtotal}));
							
			});
			 //마감
			 $("#endcashdifferencebtn").on("click",()=>{
					$("#endcashsum").text(($("#endcashfiftythousand").val()*50000)+($("#endcashtenthousand").val()*10000)+($("#endcashfivethousand").val()*5000)+($("#endcashonethousand").val()*1000)+($("#endcashfivehundread").val()*500)+($("#endcashonehundread").val()*100)
							+($("#endcashfifty").val()*50)+($("#endcashten").val()*10));
					$("#endcashdifference").text(((($("#endcashfiftythousand").val()*50000)+($("#endcashtenthousand").val()*10000)+($("#endcashfivethousand").val()*5000)+($("#endcashonethousand").val()*1000)+($("#endcashfivehundread").val()*500)+($("#endcashonehundread").val()*100)
					+($("#endcashfifty").val()*50)+($("#endcashten").val()*10))-${cashendtotal}));
								
				});
		
		$("#giftdifferencebtn").on("click",()=>{
			$("#giftsum").text(($("#giftfiftythousand").val()*50000)+($("#gifttenthousand").val()*10000)+($("#giftfivethousand").val()*5000)+($("#giftonethousand").val()*1000));
			$("#giftdifference").text((($("#giftfiftythousand").val()*50000)+($("#gifttenthousand").val()*10000)+($("#giftfivethousand").val()*5000)+($("#giftonethousand").val()*1000))-${gifttotal});
		});
		//마감
		$("#endgiftdifferencebtn").on("click",()=>{
			$("#endgiftsum").text(($("#endgiftfiftythousand").val()*50000)+($("#endgifttenthousand").val()*10000)+($("#endgiftfivethousand").val()*5000)+($("#endgiftonethousand").val()*1000));
			$("#endgiftdifference").text((($("#endgiftfiftythousand").val()*50000)+($("#endgifttenthousand").val()*10000)+($("#endgiftfivethousand").val()*5000)+($("#endgiftonethousand").val()*1000))-${giftendtotal});
		});

		
		$("input[value='정산하기']").on("click",()=>{
			if(confirm("정산을 완료하시겠습니까? \n 확인을 누르시면 더이상 수정할 수 없습니다.")){
				alert("정산완료");
				location.href="mc?type=attend&sno=${svo.sno }&empno=<%=request.getParameter("empno")%>&allDifference="+allDifference+"&allSales="+allSales+"&allEndDifference="+allEndDifference+"&allEndSales="+allEndSales+"&tab="+tab;
			}else{
				return false;
			}
		});
		
		
		});
	
	
	
	</script>
</body>
</html>