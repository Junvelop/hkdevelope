<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ��</title>
<!-- <link rel = "stylesheet" href="css/layout.css"> -->
</head>
<body>
<nav class = "navbar">
	<div id = "navbar">
		<ul class ="navbar-nav">
			<li><a href = "index.jsp">HOME</a></li>
			<li>about</li>
			<li>CONTECT</li>
		
		</ul>
	
	</div>

</nav>
<div>
	<h1>ȸ������</h1>
	<form action = "userController.jsp" method = "post" onsubmit = "return isPW(this)">
	<input type = "hidden" name = "command" value = "adduser"/>
	<input type = "text" name = "id" placeholder="ID" required = "required"/>
	<a href = "#" onclick = "idChk()">�ߺ�üũ</a>
	<input type = "text" name = "name" placeholder="�̸�" required = "required"/>
	<input type = "password" name = "password" placeholder="PASSWORD" required = "required"/>
	<input type = "password" name = "password2" placeholder="PASSWORDȮ��" required = "required"/>
	<input type = "text" name = "address" placeholder="ADDRESS" required = "required"/>
	<input type = "email" name = "email" placeholder="EMAIL" required = "required"/>
	<button type = "submit">���ԿϷ�</button>
	<button type = "button" onclick = "location.href = 'index.jsp'">����</button>
	</form>
</div>
<!-- <div class = "footer">
	Coptright 1999-2024. �Ѱ���� ALL rights reserved.
</div>  -->
<script type = "text/javascript">
function isPW(formEle){ //�Ķ���ʹ� form ������Ʈ ���� ���� �� �׷��� var foremEle = document.getElementByTagName("form")[0]�� �����
	if(formEle.paswword.value!=foremEle.password2.value){
		alert("��й�ȣ�� Ȯ���ϼ���");
		formEle.password.value=""; // ��й�ȣ �ʱ�ȭ
		formEle.password2.value="";
		formEle.password.focus(); //��й�ȣ �ٷ� �Է��� �� �ֵ��� ���� -> Ŀ�� �ֱ�
		return false; // false ��ȯ����� submit ����� �� �ִ�. (������������ �����Ѵٴ� ��)
		
	}
	
	
	
	
}


function idChk(){
	var id = document.getElementsByName("id")[0].value;
	if(id==""){
		alert("���̵� �Է��ϼ���");
	}else{
		window.open("userController.jsp?command=idchk&id="+id,"���̵�Ȯ��","width=300px,height=300px");
	}
}
</script>
</body>
</html>

<%@include file="footer.jsp" %>