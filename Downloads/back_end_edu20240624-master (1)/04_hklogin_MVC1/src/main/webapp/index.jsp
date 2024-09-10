<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type= "text/javascript" src = "js/cookiefunc.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href = "css/loginpage.css">

</head>
<body>
<% String msg = request.getParameter("msg"); %>
<form action ="userController.jsp" method = "post" onsubmit="userIdCookie()">
	<input type = "hidden" name = "command" value = "login"/>
	<h1>Login</h1>
	<input type = "text" name = "id" required="required"/>
	<input type = "password" name = "password" placeholder = "password" required="required"/>
	<input type = "checkbox" value = "remember-me"/> <label>아이디 저장</label>
	<label style = "color:red"><small><%=msg==null?"":msg %></small></label>
	<button type = "submit">Sign in</button>
	<button type = "button" onclick = "registerForm()">Sign up</button>
</form>
<script type = "text/javascript">
	function registerForm(){
		location.href = "userController.jsp?command=registform"
	}
	
	function userIdCookie(){
		//chkId 객체 구함
		var chkID = document.querySelectorAll("input[type=checkbox]")[0];
		var id = document.querySelectorAll("input[name=id]")[0].value;
		if(chkID.checked){ // cpzmrk ehldj dlTdmaus znzldp dkdlelfmf wjwkdgkwk
			setCookie("rememberid",id,100);
		}
	}
	onload = function(){
		var cookieID = getCookie("rememberid");
		if(cookieID!=null){
			document.querySelectorAll("input[name=id]")[0].value=cookieID;
		}
		
	}
	
	
</script>
</body>
</html>