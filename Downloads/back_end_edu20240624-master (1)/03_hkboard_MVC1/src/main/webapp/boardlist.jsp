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
<title>게시판 글목록 조회</title>
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
<h1>게시판</h1>
<h2>글목록</h2>
<form action = "hkController.jsp" method = "post" onsubmit = "return isAllCheck();">
<input type = "hidden" name = "command" value = "mulDel"/>
<!-- 삭제 버튼 클릭 - chkbox: 체크된 박스들만 chk = seq, chk  -->
<table>
	<col width = "50px">
	<col width = "50px">
	<col width = "100px">
	<col width = "300px">
	<col width = "200px">
	<tr>
	<th><input type = "checkbox" name = "all" onclick = "allSel(this.checked)"/> </th>
		<th>번호</th> <th>작성자</th> <th>제목</th> <th>작성일</th>
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
			<button type= "button" onclick="insertBoardForm()">글추가</button>
			<button type = "submit">글삭제</button>
			
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
		chks[i].checked = bool; //트루 : 체크, false: 체크헤제 
	}
}

function isAllCheck(){
	if(confirm("정말 삭제할거야?")){
		var count = 0;
//		var chks = document.getElementsByName("chk");
//		for (var i = 0; i < chks.length; i++) {
//			if(chks[i].checked){ //체크 되면 트루 반환 
//				break;
//			}
			
//		}
//		if(count==0){
//			alert('최소 하나이상 체크하세요');
//			
//		}
//		return count>0?true:false;
		var chks = document.querySelectorAll("input[name=chk]:checked");
		if(chks.length==0){
			alert("하나이상 체크해");
			return false;
		}else{
			return true;
		}
	}
	return false; //취소버튼 클릭했을 경우 전송되면 안되니깐 false 반환
}

</script>
</body>
</html>