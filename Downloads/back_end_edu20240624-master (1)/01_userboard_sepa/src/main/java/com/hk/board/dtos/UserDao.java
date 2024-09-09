package com.hk.board.dtos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//Dao 객체 : database에 접근하는 객체 
public class UserDao {
   //1단계 :  드라이버 로딩 -> 마리아 디비 불러오기 
   public UserDao() {
      // TODO Auto-generated constructor stub
      //강제 객체 생성 --> org.mariadb.jdbc.driver 얘의 객체를 강제로 생성하겠다 (강제 객체 생성은 예외처리를 무조건 해주어야 함)
      try {
         Class.forName("org.mariadb.jdbc.Driver");
         System.out.println("1단계 : 드라이버 로딩 성공");
      } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("1단계 드라이버 로딩 실패");
      }
   }
   //회원목록 조회기능 : [dto,dtp,dto...] dto에는 userid,name,birthYear등이 담겨있음 
   public List<UserDto> getAllUser(){
      List<UserDto> list = new ArrayList<>();
   
      
      //2단계 : 디비연결
      String url = "jdbc:mariadb://localhost:3306/hkeduweb";
      String user = "root";
      String password = "root";
      Connection conn = null ; //디비 연결할때 사용할 객체
      PreparedStatement psmt = null; //쿼리 준비 및 실행을 위한 객체
      ResultSet rs = null; //쿼리 실행결과를 받을 객체 
      
      // 실행 쿼리 작성 
      String sql = "SELECT    userID ,"
            + "         NAME ,"
            + "         birthYear ,"
            + "         addr , "
            + "         mobile1 ,"
            + "         mobile2 ,"
            + "         height ,"
            + "         mDate "
            + "FROM usertbl";
      //java.sql, java.io, java.net : 무조건 예외 처리해야 한다.
      try {
         conn=DriverManager.getConnection(url, user, password);
         System.out.println("2단게:디비연결성공");
         psmt = conn.prepareStatement(sql);// 위에 sql 디비에 전송후 그 저장된 상태를 psmt에 저장
         System.out.println("3단계: 쿼리준비성공");
         //쿼리실행
         rs= psmt.executeQuery();
         psmt.executeQuery()   ;
         System.out.println("4단게: 쿼리실행성공");
         //실행결과 받기 : 디비 데이터를 자바에서 사용할 수 있게 변환해서 저장
         while(rs.next()) { //next는 rs에 쿼리가 있는지 없는지 확인해서 트루/펄스 반환
            UserDto dto = new UserDto();
            dto.setUserId(rs.getString(1));
            dto.setName(rs.getString(2));
            dto.setBirthYear(rs.getInt(3));
            dto.setAddr(rs.getString(4));
            dto.setMobile1(rs.getString(5));
            dto.setMobile2(rs.getString(6));
            dto.setHeight(rs.getInt(7));
            dto.setmDate(rs.getDate(8));
            list.add(dto);
         }
         System.out.println("5단계 쿼리 결과 받기 성공");
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("JDBC실패" + getClass());
      }finally {
         try {
            if(rs!=null) {
               rs.close();
            }
            if(psmt != null) {
               psmt.close();
            }
            if(conn != null) {
               conn.close();
            }
            System.out.println("6단꼐 :디비 닫기 성공 ");
               
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("6단계 디비 닫기 실패");
         }
         
      }
      return list;


      
   }
   
   public boolean insertUser(UserDto dto) {
      
      int count = 0; // 쿼리 성공 여부 
      //2단계 : 디비연결
      String url = "jdbc:mariadb://localhost:3306/hkeduweb";
      String user = "root";
      String password = "root";
      Connection conn = null ; //디비 연결할때 사용할 객체
      PreparedStatement psmt = null; //쿼리 준비 및 실행을 위한 객체
      
      String sql = "INSERT INTO USERTBL "
            + " VALUES(?,?,?,?,?,?,?,SYSDATE())";
      try {
         conn = DriverManager.getConnection(url, user, password);
         System.out.println("디비연동성공 ");
         psmt=conn.prepareStatement(sql);
         psmt.setString(1, dto.getUserId());
         psmt.setString(2, dto.getName());
         psmt.setInt(3, dto.getBirthYear());
         psmt.setString(4, dto.getAddr());
         psmt.setString(5, dto.getMobile1());
         psmt.setString(6, dto.getMobile2());
         psmt.setInt(7, dto.getHeight());
         System.out.println("3단계 쿼리 준비 성공");
         count = psmt.executeUpdate(); //반환값 : 업데이트된 행의 개수를 반환 
         System.out.println("4단계 : 쿼리 실행 성공");
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("jdbc 실패 :" + getClass());
      }finally {
         try {
            if(psmt!=null) {
               psmt.close()   ;
            }
            
            if(conn!=null) {
               conn.close()   ;
               
            } System.out.println("6단계 : 디비닫기성공");
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
         
      }
      
      
      return count>0?true:false;
   }
   
   public boolean updateUser(UserDto dto) {
      
      int count = 0; // 쿼리 성공 여부 
      //2단계 : 디비연결
      String url = "jdbc:mariadb://localhost:3306/hkeduweb";
      String user = "root";
      String password = "root";
      Connection conn = null ; //디비 연결할때 사용할 객체
      PreparedStatement psmt = null; //쿼리 준비 및 실행을 위한 객체
      
      //실행쿼리 작성
		String sql="UPDATE usertbl SET 	NAME = ?,"
				+ "						birthYear = ?,"
				+ "						addr = ? ,"
				+ "						mobile1 = ? ,"
				+ "						mobile2 = ? ,"
				+ "						height = ? "
				+ " WHERE userID = ? ";


      try {
         conn = DriverManager.getConnection(url, user, password);
         System.out.println("디비연동성공 ");
         psmt=conn.prepareStatement(sql);
         
         psmt.setString(1, dto.getName());
         psmt.setInt(2, dto.getBirthYear());
         psmt.setString(3, dto.getAddr());
         psmt.setString(4, dto.getMobile1());
         psmt.setString(5, dto.getMobile2());
         psmt.setInt(6, dto.getHeight());
         psmt.setString(7, dto.getUserId()); // 애를 맨 뒤에 넣어야 함 그래야 인자 순서가 맞춰짐
         System.out.println("3단계 쿼리 준비 성공");
         count = psmt.executeUpdate(); //반환값 : 업데이트된 행의 개수를 반환 
         System.out.println("4단계 : 쿼리 실행 성공");
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("jdbc 실패 :" + getClass());
      }finally {
         try {
            if(psmt!=null) {
               psmt.close()   ;
            }
            
            if(conn!=null) {
               conn.close()   ;
               
            } System.out.println("6단계 : 디비닫기성공");
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("6단계 : 디비닫기실패");
         }
         
         
      }
      
      
      return count>0?true:false;
      
   }
   
   //회원 상세 정보 조회 : 셀렉트 ~ 웨어문, 파라미터 필요, 회원 1명의 정보 --> 테이블에서는 1개의 행의 정보 -> 우리가 필요한건 DTO 객체 
   
   public UserDto getUser(String userId){
      
      UserDto dto = new UserDto(); //회원 1명의 대한 정보를 저장할 객체
      
      //2단계 : 디비연결
      String url = "jdbc:mariadb://localhost:3306/hkeduweb";
      String user = "root";
      String password = "root";
      Connection conn = null ; //디비 연결할때 사용할 객체
      PreparedStatement psmt = null; //쿼리 준비 및 실행을 위한 객체
      ResultSet rs = null; //쿼리 실행결과를 받을 객체 
      
      // 실행 쿼리 작성 
      String sql = "SELECT    userID ,"
            + "         NAME ,"
            + "         birthYear ,"
            + "         addr , "
            + "         mobile1 ,"
            + "         mobile2 ,"
            + "         height ,"
            + "         mDate "
            + " FROM usertbl  "
            + " WHERE USERID = ?"; //유저아이디를 활용해 한 사람의 정보 구해오기
      
      //java.sql, java.io, java.net : 무조건 예외 처리해야 한다.
      try {
         conn=DriverManager.getConnection(url, user, password);
         System.out.println("2단게:디비연결성공");
         psmt = conn.prepareStatement(sql);// 위에 sql 디비에 전송후 그 저장된 상태를 psmt에 저장
         psmt.setString(1,userId);
         System.out.println("3단계: 쿼리준비성공");
         //쿼리실행
         rs= psmt.executeQuery(); // 결과반환
         psmt.executeQuery()   ;
         System.out.println("4단게: 쿼리실행성공");
         //실행결과 받기 : 디비 데이터를 자바에서 사용할 수 있게 변환해서 저장
         while(rs.next()) { //next는 rs에 쿼리가 있는지 없는지 확인해서 트루/펄스 반환
            
            dto.setUserId(rs.getString(1));
            dto.setName(rs.getString(2));
            dto.setBirthYear(rs.getInt(3));
            dto.setAddr(rs.getString(4));
            dto.setMobile1(rs.getString(5));
            dto.setMobile2(rs.getString(6));
            dto.setHeight(rs.getInt(7));
            dto.setmDate(rs.getDate(8));
            
         }
         System.out.println("5단계 쿼리 결과 받기 성공");
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("JDBC실패" + getClass());
      }finally {
         try {
            if(rs!=null) {
               rs.close();
            }
            if(psmt != null) {
               psmt.close();
            }
            if(conn != null) {
               conn.close();
            }
            System.out.println("6단꼐 :디비 닫기 성공 ");
               
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("6단계 디비 닫기 실패");
         }
         
      }
      return dto;


      
   }
   
	public boolean deleteUser(String userId) {

		int count=0;//쿼리 성공 여부 판단을 위해..

		//DB연결을 위한 정보 정의
		//url:DB소프트웨어마다 약간씩 다를 수 있음
		String url="jdbc:mariadb://localhost:3307/hkeduweb";
		String user="root";
		String password="manager";

		Connection conn=null;//DB연결할때 사용할 객체
		PreparedStatement psmt=null;//쿼리 준비 및 실행을 위한 객체

		String sql="DELETE FROM USERTBL WHERE USERID = ? ";

		try {
			conn=DriverManager.getConnection(url, user, password);
			System.out.println("2단계:DB연결성공");

			psmt=conn.prepareStatement(sql);
			psmt.setString(1, userId);
			System.out.println("3단계:쿼리준비성공");

			count=psmt.executeUpdate();//반환값: 업데이트된 행의 개수를 반환(int)
			System.out.println("4단계:쿼리실행성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("JDBC실패:"+getClass());
		}finally {
			try {
				if(psmt!=null) {
					psmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
				System.out.println("6단계:DB닫기성공");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("6단계:DB닫기실패");
			}
		}

		return count>0?true:false;
	}
   
}
