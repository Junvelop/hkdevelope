<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="com.hk.dtos.UserDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id = "container">
	<div class = "main">
		<div class = "lead">
			
			<span><%=ldto.getId() %>[<%=ldto.getRole() %>]님이 로그인하였습니다.</span>
			<span><a href ="userController.jsp?command=userinfo">나의정보</a></span>
			<span><a href = "userController.jsp?command=logout"></a></span>
		</div>
	</div>
</div>
</body>
</html>
<%@include file="footer.jsp" %>