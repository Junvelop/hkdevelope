<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>현재 로그인한 회원 목록</h1>
<%
    List<UserDto> loggedInUsers = (List<UserDto>) application.getAttribute("loggedInUsers");
    if (loggedInUsers != null && !loggedInUsers.isEmpty()) {
        for (UserDto user : loggedInUsers) {
            out.println("<p>" + user.getName() + "님이 로그인 중입니다.</p>");
        }
    } else {
        out.println("<p>로그인한 사용자가 없습니다.</p>");
    }
%>
 

</body>
</html>