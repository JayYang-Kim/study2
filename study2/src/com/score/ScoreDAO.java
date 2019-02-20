package com.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class ScoreDAO {
	private Connection conn = DBConn.getConnection();
	
	public void insertScore(ScoreDTO dto) throws Exception {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "INSERT INTO score(hak, name, birth, kor, eng, mat) VALUES(?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getHak());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getBirth());
			
			pstmt.setInt(4, dto.getKor());
			pstmt.setInt(5, dto.getEng());
			pstmt.setInt(6, dto.getMat());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString()); // 예외 발샐 시 오류 메시지 찍기
			throw e;
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
		}
	}
	
	public int dataCount() {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM score";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
					
				}
			}
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
		}
		
		return result;
	}
	
	public List<ScoreDTO> listScore(int start, int end) {
		List<ScoreDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		try {
			sb.append("SELECT * FROM (");
			sb.append("	SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("		SELECT hak, name, birth, kor, eng, mat,");
			sb.append("			(kor+eng+mat) as tot,");
			sb.append("			(kor+eng+mat) / 3 as ave");
			sb.append("		FROM score");
			sb.append("		ORDER BY hak ASC");
			sb.append("	) tb WHERE ROWNUM <= ?");
			sb.append(") WHERE rnum >= ?");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ScoreDTO dto = new ScoreDTO();
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				//dto.setBirth(rs.getString("birth")); // yyyy-MM-dd hh:mm:ss
				//java.sqlDate getDate();
				dto.setBirth(rs.getDate("birth").toString()); // yyyy-MM-dd
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
					
				}
			}
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
		}
		
		return list;
	}
}
