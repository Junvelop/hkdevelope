package com.hk.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hk.database.DataBase;
import com.hk.dtos.RoleStatus;
import com.hk.dtos.UserDto;

public class UserDao extends DataBase {

		//싱글톤 패턴 : 객체를 한번만 생성하자 --> 외부에 접근할 때 new를 사용 못하게해야해
	
	public static UserDao userDao;
	private UserDao() {
		// TODO Auto-generated constructor stub
	}
	
	public static UserDao getUserDao() { //UserDao.getUserDao() 가능
		if(userDao==null) {
			userDao = new UserDao();
		}
		
		return userDao;
	}
	
	//사용자 기능
	
	//1. 회우너가입기능 (enabled: 'y' // 초기사용여부 - 예  role: "user"// 유저 역할, regDate:SYSDATE())
	//insert문 실행
	public boolean insertUser(UserDto dto) {
		int count = 0;
		Connection conn = null;
		PreparedStatement psmt = null;
		String sql = " INSERT INTO USERINFO " + " VALUES(NULL,?,?,?,?,?,'Y',?,SYSDATE())";
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getPassword());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, String.valueOf(RoleStatus.USER));
			count = psmt.executeUpdate()	;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(null, psmt, conn);
		}
		
		
		return count>0?true:false;
	}
	
	
	//아이디 중복 체크하기
	public String idCheck(String id) {
		String resultId=null;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT ID FROM USERINFO WHWERE ID =?";
		
		try {
			conn=getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				resultId=rs.getString(1);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs,psmt,conn);
		}
		
		return resultId;
		
	}
	
	//로그인 기능 : 파라미터 ID, Password
	public UserDto getLogin(String id, String password) {
		UserDto dto= new UserDto();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql =  " SELECT ID, NAME, ROLE " + " FROM USERINFO " + " WHERE ID =? AND PASSWORD =? AND ENABLED = 'Y' ";
	    try {
			conn=getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, password);
			
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setRole(rs.getString(3));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs,psmt,conn);
		}
			return dto;
	    
	
	}
}