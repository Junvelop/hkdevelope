<%@ page import="java.util.List" %>
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
</head>

<style>
	th{
		background-color:blue;
		color:white;
	}
	
	th:nth-child(odd){
		background-color:orange;
	}

</style>
<%
	Hkdao dao = new Hkdao();
	List<HKDto> lists = dao.getAllList();
%>
<body>
<h1>게시판</h1>
<h2>글목록</h2>

<table>
	<col width = "50px">
	<col width = "50px">
	<col width = "50px">
	<col width = "50px">
	<tr>
		<th>번호</th> <th>작성자</th> <th>제목</th> <th>작성일</th>
	</tr>
	
	<%
		for(HKDto dto:lists){
			%>
			<tr>
					<td><%=dto.getSeq()%></td>
					<td><%=dto.getId()%></td>
					<td><a href = "boarddetail.jsp?seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></td>
					<td><%=dto.getRegDate()%></td>
			</tr>
			<% 
		}
	%>
	
	<tr>
		<td colspan = "4">
			<button onclick="insertBoardForm()">글추가</button>
			
		</td>
	 </tr>
	 
</table>
<script type="text/javascript">
	function insertBoardForm(){
		location.href = "insertboardform.jsp"
	}

</script>
</body>
</html>