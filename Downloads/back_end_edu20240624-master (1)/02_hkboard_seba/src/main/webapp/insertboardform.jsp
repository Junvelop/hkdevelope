<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>글 추가하기</h1>
<form action = "insertboard.jsp" method = "post">
	<table border = "1">
		<tr>
			<th>작성자(ID)</th>
			<td><input type = "text" name = "id" required = "required"/></td>
		</tr>
				<tr>
			<th>글제목</th>
			<td><input type = "text" name = "title" required = "required"/></td>
		</tr>
		
				<tr>
			<th>글내용</th>
			<td><textarea rows="10" cols="60" name = "content" required = "required"></textarea></td>
		</tr>
		
				<tr>
			<th>작성자(ID)</th>
			<td colspan = "2">
				<input type ="submit" value = "글 등록"/>
				<input type = "button" value = "글목록" onclick = "location.href = 'boardList.jsp'"/>
				
			</td>
		</tr>
		
		
	</table>
</form>
</body>
</html>