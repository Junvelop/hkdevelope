<%@page import="com.hk.dtos.HKDto"%>
<%@page import="com.hk.daos.Hkdao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
      <%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <%
	HKDto dto = (HKDto)request.getAttribute("dto");
 %>

</head>
<body>


<h1>�� �����ϱ�</h1>
<form action = "hkController.jsp" method = "post">
	<input type = "hidden" name = "command" value = "boardupdate"/>
	<input type = "hidden" name = "seq" value ="<%=dto.getSeq()%>"/>
	<table border = "1">
		<tr>
			<th>�ۼ���(ID)</th>
			<td><%=dto.getId() %></td>
		</tr>
				<tr>
			<th>������</th>
			<td><input type = "text" name = "title" required = "required" value = "<%=dto.getTitle()%>"/></td>
		</tr>
		
				<tr>
			<th>�۳���</th>
			<td><textarea rows="10" cols="60" name = "content" required = "required"><%=dto.getContent() %></textarea></td>
		</tr>
		
				<tr>
						<td colspan = "2">
				<input type ="submit" value = "�� �����Ϸ�"/>
				<input type = "button" value = "�۸��" onclick = "location.href = 'hkController.jsp?command=boardlist.jsp'"/>
				
			</td>
		</tr>
		
		
	</table>
</form>

</body>
</html>