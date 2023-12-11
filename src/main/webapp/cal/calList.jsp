<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산 이력</title>
</head>
<body>

	<div class="container" style="padding-bottom:20px;">
		<h2>정산 이력</h2>
		<div>
			<div style="display:flex;">
				<div class="target-select__elements--control"  style="margin-bottom: 10px; margin-right: 10px;">
					<div class="dropdown input-dropdown">
						<button class="btn dropdown-toggle" type="button" id="dropdown" data-bs-toggle="dropdown" aria-expanded="false">
							<input type="text" id="month" value="월별" readonly />
						</button>
						<ul></ul>
					</div>		
				</div>
			</div>
		</div>
	</div>


</body>
</html>