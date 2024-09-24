<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% 
// 	UserDto dto=(UserDto)request.getAttribute("dto");
%>
<body>
<div id="container">
	<div class="main">
		<div class="lead">
			<span><%=ldto.getId()%>[<%=ldto.getRole()%>]님이 로그인하였습니다.</span>
			<span><a href="userController.jsp?command=userinfo&id=<%=ldto.getId()%>">나의정보</a></span>
			<span><a href="userController.jsp?command=logout">로그아웃</a></span>
		</div>
		<div class="contents">
			<h1>사용자 페이지</h1>
			<div id="myinfo">
				<form action="userController.jsp" method="post">
					<input type="hidden" name="command" value="userupdate"/>
					<input type="hidden" name="id" value="${dto.id}"/> 
					<table border="1">
						<tr>
							<th>아이디</th>
<%-- 							<td><%=dto.getId()%></td> --%>
							<td>${dto.id}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="role" value="${dto.name}"/><td>
							
						</tr>
						<tr>
							<th>등급</th>
<%-- 							<td><%=dto.getRole()%></td> --%>
							<td><input type="text" name="role" value="${dto.role}"/><td>
							
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="address" value="${dto.address}"/></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="email" name="email" value="${dto.email}"/></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit">수정</button>
								<button type="button" onclick="delUser('${dto.id}')">탈퇴</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function delUser(id){
		if(confirm("정말 탈퇴하시겠습니까?")){
			location.href="userController.jsp?command=deluser&id="+id;
		}
	}
</script>
</body>
</html>
<%@include file="footer.jsp" %>






