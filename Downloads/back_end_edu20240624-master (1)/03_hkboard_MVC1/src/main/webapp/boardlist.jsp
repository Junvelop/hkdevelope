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
<title>�Խ��� �۸�� ��ȸ</title>
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
	
	List<HKDto> lists = (List<HKDto>) request.getAttribute("lists");
	
	
%>
<body>
<h1>�Խ���</h1>
<h2>�۸��</h2>
<form action = "hkController.jsp" method = "post" onsubmit = "return isAllCheck();">
<input type = "hidden" name = "command" value = "mulDel"/>
<!-- ���� ��ư Ŭ�� - chkbox: üũ�� �ڽ��鸸 chk = seq, chk  -->
<table>
	<col width = "50px">
	<col width = "50px">
	<col width = "100px">
	<col width = "300px">
	<col width = "200px">
	<tr>
	<th><input type = "checkbox" name = "all" onclick = "allSel(this.checked)"/> </th>
		<th>��ȣ</th> <th>�ۼ���</th> <th>����</th> <th>�ۼ���</th>
	</tr>
	
	<%
		for(HKDto dto:lists){
			%>
			<tr>
					<td><input type = "checkbox" name = "chk" value = "<%=dto.getSeq()%>"/></td>
					<td><%=dto.getSeq()%></td>
					<td><%=dto.getId()%></td>
					<td><a href = "hkController.jsp?command=boarddetail&seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
					<td><%=dto.getRegDate()%></td>
			</tr>
			<% 
		}
	%>
	
	<tr>
		<td colspan = "5">
			<button type= "button" onclick="insertBoardForm()">���߰�</button>
			<button type = "submit">�ۻ���</button>
			
		</td>
	 </tr>
	 
</table>
</form>
<script type="text/javascript">
function insertBoardForm() {
    location.href = "hkController.jsp?command=insertboardform";
}

function allSel(bool){
	var chks = document.getElementsByName("chk"); //[chk,chk,chk..]
	for (var i = 0; i < chks.length; i++){
		chks[i].checked = bool; //Ʈ�� : üũ, false: üũ���� 
	}
}

function isAllCheck(){
	if(confirm("���� �����Ұž�?")){
		var count = 0;
//		var chks = document.getElementsByName("chk");
//		for (var i = 0; i < chks.length; i++) {
//			if(chks[i].checked){ //üũ �Ǹ� Ʈ�� ��ȯ 
//				break;
//			}
			
//		}
//		if(count==0){
//			alert('�ּ� �ϳ��̻� üũ�ϼ���');
//			
//		}
//		return count>0?true:false;
		var chks = document.querySelectorAll("input[name=chk]:checked");
		if(chks.length==0){
			alert("�ϳ��̻� üũ��");
			return false;
		}else{
			return true;
		}
	}
	return false; //��ҹ�ư Ŭ������ ��� ���۵Ǹ� �ȵǴϱ� false ��ȯ
}

</script>
</body>
</html>