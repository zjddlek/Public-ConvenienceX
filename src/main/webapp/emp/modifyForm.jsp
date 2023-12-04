<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>사원정보 수정</h3>

		<div class="container">
		
		<form action="mc">
        
        <table border="1">
           <tr>
            	<td>사원번호</td>
                <td><input type="text" name="empno" value="${vo.empno }"/>
                <input type="hidden" name="type" value="modifyOk"/>
                </td>
                
            </tr>
             <tr>
            	<td>사원이름</td>
                <td><input type="text" name="ename" value="${vo.ename }"/></td>
            </tr>
             <tr>
            	<td>생년월일</td>
                <td><input type="text" name="date" value="${vo.date }"/></td>
            </tr>
             <tr>
            	<td>전화번호</td>
                <td><input type="text" name="phone" value="${vo.phone }"/></td>
            </tr>
             <tr>
            	<td>주소</td>
                <td><input type="text" name="address" value="${vo.address }"/></td>
            </tr>
            
            <tr>
            	<td>상세주소</td>
                <td><input type="text" name="address_detail" value="${vo.address_detail }"/></td>
            </tr>
            <tr>
            	<td>이메일</td>
                <td><input type="text" name="email" value="${vo.email }"/></td>
            </tr>
            <tr>
            	<td>입사일자</td>
                <td><input type="text" name="hiredate" value="${vo.hiredate }"/></td>
            </tr>
            <tr>
            	<td>퇴사여부</td>
                <td><input type="text" name="isretire" value="${vo.isretire }"/></td>
            </tr>
            <tr>
            	<td>시급</td>
                <td><input type="text" name="sal_hour" value="${vo.sal_hour }"/></td>
            </tr>
            <tr>
            	<td>아이디</td>
                <td><input type="text" name="id" value="${vo.id }"></td>
            </tr>
            <tr>
            	<td>비밀번호</td>
                <td><input type="text" name="pwd" value="${vo.pwd }"/></td>
            </tr>
            <tr>
            	<td>점포번호</td>
                <td><input type="text" name="sno" value="${vo.sno }"/></td>
            </tr>
            
            <tr>
            	<td>직책번호</td>
                <td><input type="text" name="jobno" value="${vo.jobno }"/></td>
                
            </tr>
            
          <tr>
          <td>
			<a href="mc"><input type="button" class="btn btn-success" value="목록" /></a>
          	<input type="submit" value="수정" />
          </td>
          </tr>
          
        </table>
      </form>
	</div>



</body>
</html>