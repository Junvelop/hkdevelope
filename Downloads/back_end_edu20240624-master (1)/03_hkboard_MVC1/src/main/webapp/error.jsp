<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
   <%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<% String msg =request.getParameter("msg"); %>

<body>
<h1>�����޽��� : <%=msg %></h1>
<h3><a href = "index.jsp">�������� ���ư���</a></h3>

</body>
</html>