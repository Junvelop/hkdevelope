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
 	//boarddetail.jsp --> parameter : seq 전달됨
 	String sseq = request.getParameter("seq"); //반환값은 항상 문자형
 	int seq = Integer.parseInt(sseq);
 	
 	Hkdao dao = new Hkdao();
 	HKDto dto = dao.getBoard(seq);
 %>

</head>
<body>


<h1>글 수정하기</h1>
<form action = "boardupdate.jsp" method = "post">
	<input type = "hidden" name = "seq"" value ="<%=dto.getSeq()%>"/>
	<table border = "1">
		<tr>
			<th>작성자(ID)</th>
			<td><%=dto.getId() %></td>
		</tr>
				<tr>
			<th>글제목</th>
			<td><input type = "text" name = "title" required = "required" value = "<%=dto.getTitle()%>"/></td>
		</tr>
		
				<tr>
			<th>글내용</th>
			<td><textarea rows="10" cols="60" name = "content" required = "required"><%=dto.getContent() %></textarea></td>
		</tr>
		
				<tr>
						<td colspan = "2">
				<input type ="submit" value = "글 수정완료"/>
				<input type = "button" value = "글목록" onclick = "location.href = 'boardList.jsp'"/>
				
			</td>
		</tr>
		
		
	</table>
</form>

</body>
</html>