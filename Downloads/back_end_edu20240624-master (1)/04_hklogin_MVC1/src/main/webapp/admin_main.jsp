<%@page import="com.hk.dtos.UserDto"%>
<%@page import="com.hk.daos.UserDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 목록</title>
</head>
<body>
<h1>전체 회원 목록</h1>

<%
  UserDao dao = UserDao.getUserDao();
  List<UserDto> userList = dao.getUserInfoList(); // 전체 회원 정보 가져오기
%>

		<div class="contents">
			<h1>관리자 페이지</h1>

			<div style="height: 500px;"></div>
		</div>

<table border="1">
    <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>주소</th>
        <th>이메일</th>
        <th>등급</th>
        <th>가입 날짜</th>
    </tr>
    <% for(UserDto user : userList) { %>
    <tr>
        <td><%= user.getId() %></td>
        <td><%= user.getName() %></td>
        <td><%= user.getAddress() %></td>
        <td><%= user.getEmail() %></td>
        <td><%= user.getRole() %></td>
        <td><%= user.getRegDate() %></td>
    </tr>
    <% } %>
</table>

</body>
</html>
