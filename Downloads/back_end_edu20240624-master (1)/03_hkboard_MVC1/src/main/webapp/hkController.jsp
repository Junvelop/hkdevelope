<%@page import="com.hk.dtos.HKDto"%>
<%@page import="com.hk.daos.Hkdao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.util.List"%> <!-- List 클래스 임포트 -->
    <%@page import="java.net.URLEncoder"%>
   <%@page import="java.util.Arrays"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>hkController.jsp</title>
</head>
<body>
<%
   //1단계 : 커맨드값 받기 - 어떤 요청인지 확인
   //       index.jsp -> 글목록 요청 - > hkController.jsp?command=boardllist
   String command =request.getParameter("command");
   
   //2단계 : DAO 객체 생성 -> DB 관련 작업 수행을 위한 준비 단꼐
   Hkdao dao = new Hkdao();
   // HKDto dto = new HKDto();
   //3단게 : 분기 - command값 확인해서 요청작업 처리 실행
   if(command.equals("boardlist")){ //글목록 요청 처리
      
      //5단계 :dao 메서드 실행 4단계는 파라미터 받기인데 여기서 받을 객체가 없어서 생략 
      List<HKDto> lists =dao.getAllList();
   
   //6단계 : scope 객체에 담기
   request.setAttribute("lists", lists); // 키 밸류 형태로 저장
   
   //7단계 : 페이지 이동
   pageContext.forward("boardlist.jsp");
      
   }else if(command.equals("boarddetail")){
      int seq = Integer.parseInt(request.getParameter("seq"));
      HKDto dto = dao.getBoard(seq);//상세내용 가져오기
      request.setAttribute("dto",dto);//상세내용 담긴 DTO객체를 request에 저장
      pageContext.forward("boarddetail.jsp");//상세페이지로 이동
   }else if(command.equals("insertboardform")){
    response.sendRedirect("insertboardform.jsp"); //브라우저 주소창에 응답 URL로 변경된다. 업데이트작업시 응답
   }else if(command.equals("insertboard")){
      String id = request.getParameter("id");
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      
      boolean isS = dao.insertBoard(new HKDto(id,title,content));
      if(isS){
         response.sendRedirect("hkController.jsp?command=boardlist");
//          pageContext.forward("hkController.jsp?command=boardlist"); // 브라우저 주소창에 요청 URL로 적용된다. 조회작업시 응답
         
      }else{
         %>
         <script type = "text/javascript">
         alert("글추가실패");
         location.href="hkController.jsp?command=insertboardform";
         </script>         <%
      }
   }else if(command.equals("boardupdateform")){
      // seq값을 받아서 DAO요청해서 글상세내용을 조회하는 작업
            // --> 수정폼에 글상세내용이 조회되기때문에
      
      String sseq = request.getParameter("seq");
      int seq = Integer.parseInt(sseq);
      HKDto dto = dao.getBoard(seq);
      
      request.setAttribute("dto",dto);
      
   }else if(command.equals("boardupdate")){
      String sseq = request.getParameter("seq");
      int seq = Integer.parseInt(sseq);
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      
      boolean isS = dao.updateBoard(new HKDto(seq,title,content));
      
      if(isS){
         response.sendRedirect("hkController.jsp?"+"command=boarddetail&seq="+seq);
      }else{
         response.sendRedirect("error.jsp?msg=" +URLEncoder.encode("글수정실패","utf-8"));
      }
            
            
      
   }else if(command.equals("deleteboard")){
      String sseq = request.getParameter("seq");
      int seq = Integer.parseInt(sseq);
      
      boolean isS = dao.delBoard(seq);
      if(isS){
         response.sendRedirect("hkController.jsp?command=boardlist");
         
      }else{
         response.sendRedirect("error.jsp?msg="
               +URLEncoder.encode("글삭제실패","utf-8"));
      }
         
      
   }
   
   else if(command.equals("mulDel")){
      String[] chks =  request.getParameterValues("chk"); //chk={1,2,3,4}
      
      boolean isS = dao.mulDel(chks);
      if(isS){
         response.sendRedirect("hkController.jsp?command=boardlist");
      }else{
         response.sendRedirect("error.jsp?msg=" + URLEncoder.encode("글삭제실패","utf-8"));
      }
      
      //여려글을 삭제하는 기능 구현 :전달할 파라미터 타입은 배열
      //자바에서 유효값 처리할 경우 ->  유효하지 않은 값을 처리하기 위해서 요청이 실행되는 단점이 있음
      out.println(Arrays.toString(chks));
      if(chks==null || chks.length==0){
         response.sendRedirect("error.jsp?msg" + URLEncoder.encode("글 삭제할 때 최소 하나 이상 체크하세요","utf-8"));
      }
      dao.mulDel(chks);
   }


%>

   
</body>
</html>