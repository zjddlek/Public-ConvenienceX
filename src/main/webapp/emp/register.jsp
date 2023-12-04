<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>사원 등록</h3>


		<form action="mc" method="get">
        
        <table border="1">
           <tr>
            	<td>사원번호</td>
                <td><input type="text" name="empno"/>
                <input type="hidden" name="type" value="registerOk" />
                </td>
            </tr>
             <tr>
            	<td>사원이름</td>
                <td><input type="text" name="ename"/></td>
            </tr>
             <tr>
            	<td>생년월일</td>
                <td><input type="text" name="date"/></td>
            </tr>
             <tr>
            	<td>전화번호</td>
                <td><input type="text" name="phone"/></td>
            </tr>
             <tr>
            	<td>주소</td>
                <td><input type="text" name="address"/></td>
            </tr>
            
            <tr>
            	<td>상세주소</td>
                <td><input type="text" name="address_detail"/></td>
            </tr>
            <tr>
            	<td>이메일</td>
                <td><input type="text" name="email"/></td>
            </tr>
            <tr>
            	<td>입사일자</td>
                <td><input type="text" name="hiredate"/></td>
            </tr>
            <tr>
            	<td>퇴사여부</td>
                <td><input type="text" name="isretire"/></td>
            </tr>
            <tr>
            	<td>시급</td>
                <td><input type="text" name="sal_hour"/></td>
            </tr>
            <tr>
            	<td>아이디</td>
                <td><input type="text" name="id"/></td>
            </tr>
            <tr>
            	<td>비밀번호</td>
                <td><input type="text" name="pwd"/></td>
            </tr>
            <tr>
            	<td>점포번호</td>
                <td><input type="text" name="sno"/></td>
            </tr>
            
            <tr>
            	<td>직책번호</td>
                <td><input type="text" name="jobno"/></td>
                
            </tr>
            
          <tr>
          <td> <input type="submit" value="제출하기" /></td>
          </tr>
          
        </table>
      </form>



</body>
</html>