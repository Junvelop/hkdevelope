package com.hk.daos;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hk.database.DataBase;
import com.hk.dtos.HKDto;

//DAO 객체 : 데이터베이스에 접근하여 작업하는 개체
public class Hkdao extends DataBase {

	public Hkdao() { // 생략가능 -> 오버라이딩 시에는 생략 불가
		// TODO Auto-generated constructor stub
		super(); //부모 생성자 호출 -> 생성자를 호출한다는 건 객체를 생성, -> 부모 객체도 함께 생성생략되어 있음 -> 곧 생략 가능 
		
	}
	//글목록 조회 기능: 여러개의 행이 반환 --> 반환 타입은? ->List
	//                                 하나의 행 --> DTO 여러개의 행은 리스트에 dto를 담아서
	
	public List<HKDto> getAllList(){
		List<HKDto> list = new ArrayList<>();
		Connection conn = null; //디비 연결 객체 
		PreparedStatement psmt = null; //쿼리 준비 객체
		ResultSet rs = null; //쿼리 결과를 받을 객체
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, REGDATE " + " FROM HKBOARD ORDER BY REGDATE DESC";
		try {
			conn = getConnection(); //2단계 - 디비 연결
			psmt = conn.prepareStatement(sql); //3단계 쿼리준비
			rs = psmt.executeQuery(); //4단계 쿼리실행
			while(rs.next()) {
				HKDto dto = new HKDto(); //dto는 행 단위로 저장
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegDate(rs.getDate(5));
				list.add(dto);
				System.out.println(dto);
				
				
			}
			System.out.println("5단계: 쿼리결과 받기");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("JDBC 실패" + getClass()+"getAllList()");
			e.printStackTrace();
		}finally {
			close(rs,psmt,conn);
		}
		
				
		
		return list;
		
	}
	
	//글 추가하기 : insert문, 파라미터 : id, title, content, 
	//테이블을 변경하는 작업 --> 처리만 하고 결과는 없음	seq, regdate -> 쿼리에서 추가해줌
	public boolean insertBoard(HKDto dto) {
		int count = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		String sql = " INSERT INTO HKBOARD " + " VALUES(NULL,?,?,?,SYSDATE())";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			
			count = psmt.executeUpdate()	;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(null, psmt, conn);
		}
		
		
		return count>0?true:false;
	}
	
	// 글 상세 조회 : 셀렉트문 실행, 파라미터: seq(px)
	// 조회 기능 : 결과반환 있음 -> ResultSEt 객체 필요
	// 반환타입 :DTO 객체
	public HKDto getBoard(int seq) {
	    HKDto dto = new HKDto();
	    
	    Connection conn = null;
	    PreparedStatement psmt = null;
	    ResultSet rs = null;
	    
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, REGDATE " + " FROM HKBOARD WHERE SEQ = ? ";
	    
	    try {
	        conn = getConnection(); // 이 메서드는 데이터베이스 연결을 반환해야 합니다.
	        psmt = conn.prepareStatement(sql);
	        psmt.setInt(1, seq);
	        rs = psmt.executeQuery();
	        
	        while (rs.next()) { // While 루프 대신 if를 사용하는 것이 적절합니다.
	            dto.setSeq(rs.getInt(1));
	            dto.setId(rs.getString(2));
	            dto.setTitle(rs.getString(3));
	            dto.setContent(rs.getString(4));
	            dto.setRegDate(rs.getDate(5));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs, psmt, conn); // 이 메서드는 ResultSet, PreparedStatement, Connection을 닫아야 합니다.
	    }
	    
	    return dto;
	}
	//수정하기 : 업데이트문 실행. 파라미터 : id,title,content 수정할내용: title, content, regdate -> Sysdate();
	
	public boolean updateBoard(HKDto dto) {
		int count = 0;
		Connection conn = null;
		PreparedStatement psmt = null;
 //		Statement st = null; // ? -> 파라미터 적용하는 기능이 없어 
		
		//string 객체 이용했을 경우
		String sql = " UPDATE HKBOARD SET TITLE =?, CONTENT=?, "
					 +"                             REGDATE=SYSDATE() "
					 +" WHERE SEQ = ? ";
		
		
		
	/*	//String~클래스를 이용했을 경우 new 예약어 사용 --> 메모리 효율 up
		StringBuffer sb = new StringBuffer();*/
		
		try {
			conn =getConnection();
			psmt = conn.prepareStatement(sql);
//	st.conn.createStatement();
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getSeq()); // 쿼리준비완료
			count = psmt.executeUpdate(); // 쿼리실행 : 반환값은 변경된 행의 개수
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count>0?true:false;
		
	}
	//글 삭제하기 : delete문 실행, 파라미터 : seq
	public boolean delBoard(int seq) {
		int count =0;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = " DELETE FROM HKBOARD WHERE SEQ=? ";
		
		try {
			conn=getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(null,psmt,conn);
		}
		
		
		return count>0?true:false;
	}
}
