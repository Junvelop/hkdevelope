<%@page import="com.hk.daos.Hkdao"%>
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
	String sseq = request.getParameter("seq");
	int seq = Integer.parseInt(sseq);
	
	Hkdao dao = new Hkdao();
	boolean isS = dao.delBoard(seq); //삭제실행됨
	
	if(isS){
		%>
		<script type="text/javascript">
			alert("글을 삭제합니다.");
			location.href="boardlist.jsp";
		</script>
		<% 
		
	}else{
		
		%>
		<script type="text/javascript">
			alert("글 삭제 실패");
			location.href="boarddetail.jsp?seq=<%=seq%>";
		</script>
		<%

		
	}
%>
</body>
</html>