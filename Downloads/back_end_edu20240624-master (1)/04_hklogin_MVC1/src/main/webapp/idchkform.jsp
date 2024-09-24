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
	<span><%=resultId==null? "사용가능한 아이디입니다.":"중복된 아이디입니다." %></span>
	<span><button onclick = "confirmId('<%=resultId %>')">확인</button></span>
</div>
<script type = "text/javascript">
	function confirmId(resultId){
		
		var parentInputId=opener.document.getElementsByName("id")[0]; // id 입력 박스 객체 
		if(resultId=='null'){
			localStorage.setItem("idchk","y");
			opener.document.getElementsByName("name")[0].focus();
		}else{
			localStorage.setItem("idchk","n");
			parentInputId.focus();
		}
		self.close(); //현재창을 닫는다
	}
	
</script>
</body>
</html>