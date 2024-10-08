<%@page import="com.hk.board.dtos.UserDao"%>
<%@page import="com.hk.board.dtos.UserDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정</title>
</head>
<% //수정하려고 하는 회원의 아이디를 받는다 
	String userId = request.getParameter("userId");

	//전달받은 ID에 해당하는 회원의 정보를 조회
	UserDao dao = new UserDao();
	UserDto dto=dao.getUser(userId);
	
%>
<body>

<h1>회원정보수정</h1>
<form action="userUpdate.jsp" method="post">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input readonly = "readonly" type="text" name="userId" value = "<%=dto.getUserId()%>"/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value = "<%=dto.getName()%>" /></td>
		</tr>
		<tr>
			<th>출생년도</th>
			<td><input type="text" name="birthYear" value = "<%=dto.getBirthYear()%>"/></td>
		</tr>
		<tr>
			<th>지역</th>
			<td><input type="text" name="addr" value = "<%=dto.getAddr()%>"/></td>
		</tr>
		<tr>
			<th>휴대폰 국번</th>
			<td><input type="text" name="mobile1" value = "<%=dto.getMobile1()%>"/></td>
		</tr>
		<tr>
			<th>휴대폰 전화번호</th>
			<td><input type="text" name="mobile2" value = "<%=dto.getMobile2()%>"/></td>
		</tr>
		<tr>
			<th>신장</th>
			<td><input type="text" name="height" value = "<%=dto.getHeight()%>"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="회원입력" />
			</td>
		</tr>
	</table>
</form>


</body>
</html>