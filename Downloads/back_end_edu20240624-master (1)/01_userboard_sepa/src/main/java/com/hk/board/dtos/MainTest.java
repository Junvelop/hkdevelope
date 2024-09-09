package com.hk.board.dtos;

import java.util.List;

public class MainTest {

   public static void main(String[] args) {
      // TODO Auto-generated method stub
      
      //DB접근 --> DAO 객체
      UserDao dao = new UserDao();
      
      //회원목록 조회
      List<UserDto> userList = dao.getAllUser();
      
      for (int i = 0; i < userList.size(); i++) {
         
         System.out.println(userList.get(i));
      }
      
      //회원정보 등록
   //   UserDto dto = new UserDto();
   /*   dto.setUserId("KKA"); 이렇게 일일이 입력하기 귀찮잖아 그래서 생성자 오버로딩 함
      dto.setName("김경호");
      dto.setBirthYear(1999);
      dto.setHeight(181); */      
      UserDto dto = new UserDto("KKc", "김경호", 1971, "전남", "019", "12313", 177, null);
      boolean isS = dao.insertUser(dto); //파라미터를 dto객체를 이용하여 전달
      System.out.println("회원정보등록성공:"+isS);
      
      //회원 수정
      boolean isSUpdate = dao.updateUser(new UserDto(
               "KKp","김건모",1970,"서울","011","12345678",170,null));
          
            
      System.out.println("회원수정성공 : " + isSUpdate);
   
   
   
   //회원 상세 정보 조회 
	System.out.println("==회원상세조회==");
	UserDto dto1=dao.getUser("KKp");
	System.out.println(dto1);
   

}}
