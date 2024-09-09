<%@page import="com.hk.dtos.HKDto"%>
<%@page import="com.hk.daos.Hkdao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	HKDto dto = (HKDto)request.getAttribute("dto");
%>
<body>
<h1>게시판 상세보기</h1>
<table border = "1">
		<tr>
			<th>작성자(ID)</th>
			<td><%=dto.getId() %></td>
		</tr>
				<tr>
			<th>글제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		
				<tr>
			<th>글내용</th>
			<td><textarea rows="10" cols="60" readonly = "readonly" ><%=dto.getContent() %></textarea></td>
		</tr>
		
				<tr>
			<th>작성자(ID)</th>
			<td colspan = "2">
				<input type ="button" onclick = "updateForm(<%=dto.getSeq()%>)" value = "수정폼이동"/>
				<input type ="button" onclick = "delBoard(<%=dto.getSeq()%>)") value = "삭제"/>
				<input type = "button" value = "글목록" onclick = "location.href='hkController.jsp?command=boardlist'"/>
				
			</td>
		</tr>
		
		
	</table>
	
<script type = "text/javascript">
	function updateForm(seq){
		location.href="hkController.jsp?command=boardupdateform&seq="+seq;
		
	function delBoard(seq){
		location.href="hkController.jsp?command=deleteboard&seq="+seq;
	}
		
	}

</script>

</body>
</html>