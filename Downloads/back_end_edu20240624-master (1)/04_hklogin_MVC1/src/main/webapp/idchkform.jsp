<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% String resultId = (String)request.getAttribute("resultId"); %>
<div>
	<span><%=resultId==null? "��밡���� ���̵��Դϴ�.":"�ߺ��� ���̵��Դϴ�." %></span>
	<span><button onclick = "confirmId('<%=resultId %>')">Ȯ��</button></span>
</div>
<script type = "text/javascript">
	function confirmId(resultId){
		
		var parentInputId=opener.document.getElementsByName("id")[0]; // id �Է� �ڽ� ��ü 
		if(resultId=='null'){
			localStorage.setItem("idchk","y");
			opener.document.getElementsByName("name")[0].focus();
		}else{
			localStorage.setItem("idchk","n");
			parentInputId.focus();
		}
		self.close(); //����â�� �ݴ´�
	}
	
</script>
</body>
</html>