<%@page import="com.hk.board.dtos.UserDao"%>
<%@page import="com.hk.board.dtos.UserDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String userId = request.getParameter("userId");
	UserDao dao = new UserDao();
	boolean isS = dao.deleteUser(userId);
	
	if(isS){
		response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("error.jsp");
	}
	
%>

</body>
</html>