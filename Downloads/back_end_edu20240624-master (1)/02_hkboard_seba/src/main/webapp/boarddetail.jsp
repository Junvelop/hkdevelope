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
	//전달된 파라미터 : seq
	String sseq = request.getParameter("seq");
	int seq = Integer.parseInt(sseq); //스트링숫자를 정수형으로 변환
	Hkdao dao = new Hkdao();
	HKDto dto = dao.getBoard(seq);
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
				<input type = "button" value = "글목록" onclick = "location.href = 'boardList.jsp'"/>
				
			</td>
		</tr>
		
		
	</table>
	
<script type = "text/javascript">
	function updateForm(seq){
		location.href = "boardupdateform.jsp?seq="+seq;
		
	function delBoard(seq){
		location.href = "deleteboard.jsp?seq="+seq;
	}
		
	}

</script>

</body>
</html>