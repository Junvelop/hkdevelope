<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file="header.jsp" %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자 화면</h1>
<span><a href="userController.jsp?command=usersearch">회원정보 불러오기</a></span>
<span><a href="userController.jsp?command=userfix">회원정보 고치기</a></span>
</body>
</html>