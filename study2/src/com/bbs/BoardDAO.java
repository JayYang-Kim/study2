package com.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class BoardDAO {
	private Connection conn = DBConn.getConnection();
	
	/**
	 * title : 방명록 데이터 등록
	 * @param dto // 입력 값
	 */
	public void insertBorad(BoardDTO dto) {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "INSERT INTO bbs(num, name, pwd, subject, content, ipAddr) VALUES(bbs_seq.NEXTVAL, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getIpAddr());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
		}
	}
	
	/**
	 * title : 검색이 아닌 방명록 리스트
	 * @param start // 데이터 시작 수 
	 * @param end   // 데이터 끝 수
	 * @return
	 */
	public List<BoardDTO> listBoard(int start, int end) {
		List<BoardDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		// num, name, subject, hitCount, created(yyyy-mm-dd 형식)
		sb.append("SELECT * FROM (");
		sb.append("	SELECT ROWNUM rnum, tb.* FROM (");
		sb.append("		SELECT num, name, subject, hitCount, created");
		sb.append("		FROM bbs");
		sb.append("		ORDER BY num DESC");
		sb.append("	) tb WHERE ROWNUM <= ?");
		sb.append(") WHERE rnum >= ?"); 
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getDate("created").toString());
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
	
	/**
	 * title : 검색 조건이 있는 방명록 리스트
	 * @param start       // 데이터 시작 수
	 * @param end         // 데이터 끝 수
	 * @param searchKey   // 검색 키
	 * @param searchValue // 검색 값
	 * @return
	 */
	public List<BoardDTO> listBoard(int start, int end, String searchKey, String searchValue ) {
		List<BoardDTO> list = new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("SELECT * FROM (");
			sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("        SELECT num, name, subject, hitCount, created");
			sb.append("        FROM bbs  ");
			if(searchKey.equalsIgnoreCase("created")) {
				searchValue = searchValue.replaceAll("(\\-|\\/|\\.)", "");
				sb.append("    WHERE TO_CHAR(created, 'YYYYMMDD') = ? ");
			} else if(searchKey.equalsIgnoreCase("name")) {
				sb.append("    WHERE INSTR(name, ?) = 1 ");
			} else if(searchKey.equalsIgnoreCase("all")) {
				sb.append("    WHERE INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1");
			} else {
				sb.append("    WHERE INSTR("+searchKey+", ?) >= 1 ");
			}
			sb.append("	      ORDER BY num DESC");
			sb.append("    ) tb WHERE ROWNUM <= ? ");
			sb.append(") WHERE rnum >= ? ");

			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, searchValue);
			if(searchKey.equalsIgnoreCase("all")) {
				pstmt.setString(2, searchValue);
				pstmt.setInt(3, end);
				pstmt.setInt(4, start);
			} else {
				pstmt.setInt(2, end);
				pstmt.setInt(3, start);
			}

			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto=new BoardDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setCreated(rs.getDate("created").toString());
				dto.setHitCount(rs.getInt("hitCount"));
				
				list.add(dto);
			}
			//rs.close();
			//pstmt.close();	
		} catch (Exception e) {
			e.printStackTrace();
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
	
	/**
	 * title : 게시글 가져오기
	 * @param num
	 * @return
	 */
    public BoardDTO readBoard(int num) {
        BoardDTO dto = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;
        
       try {
    	   sql="SELECT num, name, pwd, subject, content, ipAddr, hitCount, created FROM bbs WHERE num = ?";
    	   
    	   pstmt = conn.prepareStatement(sql);
    	   
    	   pstmt.setInt(1, num);
    	   
    	   rs = pstmt.executeQuery();
    	   
    	   if(rs.next()) {
    		   dto = new BoardDTO();
    		   dto.setNum(rs.getInt("num"));
    		   dto.setName(rs.getString("name"));
    		   dto.setPwd(rs.getString("pwd"));
    		   dto.setSubject(rs.getString("subject"));
    		   dto.setContent(rs.getString("content"));
    		   dto.setIpAddr(rs.getString("ipAddr"));
    		   dto.setHitCount(rs.getInt("hitCount"));
    		   dto.setCreated(rs.getString("created"));
    	   }
    	   
        } catch (Exception e) {
        	e.printStackTrace();
			System.out.println(e.toString());
        } finally {
        	if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}			
		}
        
        return dto;
    }
    
    /**
     * title : 조회 수 증가 (hitCount + 1 증가)
     * @param num
     */
    public void updateHitCount(int num) {
        PreparedStatement pstmt = null;
        String sql;
        
        try {
        	sql="UPDATE bbs SET hitCount = hitCount + 1 WHERE num = ?";
        	
        	pstmt = conn.prepareStatement(sql);
        	
        	pstmt.setInt(1, num);
        	
        	pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
        	if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
    }
    
    /**
     * title : 이전글
     * @param num
     * @param searchKey
     * @param searchValue
     * @return
     */
	public BoardDTO preReadBoard(int num, String searchKey, String searchValue) {
		BoardDTO dto=null;

		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb = new StringBuffer();

		try {
			if(searchValue!=null && searchValue.length() != 0) {
				sb.append("SELECT ROWNUM, tb.* FROM ( ");
				sb.append("  SELECT num, subject FROM bbs ");
				if(searchKey.equalsIgnoreCase("created")) {
					searchValue = searchValue.replaceAll("(\\-|\\/|\\.)", "");
					sb.append("    WHERE TO_CHAR(created, 'YYYYMMDD') = ? ");
				} else if(searchKey.equalsIgnoreCase("name")) {
					sb.append("    WHERE INSTR(name, ?) = 1 ");
				} else if(searchKey.equalsIgnoreCase("all")) {
					sb.append("    WHERE INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1");
				} else {
					sb.append("    WHERE INSTR("+searchKey+", ?) >= 1 ");
				}
				sb.append("		 AND (num > ? ) ");
				sb.append("		 ORDER BY num ASC ");
				sb.append("	  ) tb WHERE ROWNUM=1 ");

				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setString(1, searchValue);
				if(searchKey.equalsIgnoreCase("all")) {
					pstmt.setString(2, searchValue);
					pstmt.setInt(3, num);
				} else {
					pstmt.setInt(2, num);
				}
			} else {
				sb.append("SELECT ROWNUM, tb.* FROM ( ");
				sb.append("  SELECT num, subject FROM bbs ");
				sb.append("	 WHERE num > ? ");
				sb.append("		 ORDER BY num ASC ");
				sb.append("	  ) tb WHERE ROWNUM=1 ");

				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setInt(1, num);
			}

			rs=pstmt.executeQuery();

			if(rs.next()) {
				dto=new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
	
		return dto;
	}

	/**
	 * title : 다음글
	 * @param num
	 * @param searchKey
	 * @param searchValue
	 * @return
	 */
	public BoardDTO nextReadBoard(int num, String searchKey, String searchValue) {
		BoardDTO dto=null;

		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb = new StringBuffer();

		try {
			if(searchValue!=null && searchValue.length() != 0) {
				sb.append("SELECT ROWNUM, tb.* FROM ( ");
				sb.append("  SELECT num, subject FROM bbs ");
				if(searchKey.equalsIgnoreCase("created")) {
					searchValue = searchValue.replaceAll("(\\-|\\/|\\.)", "");
					sb.append("    WHERE TO_CHAR(created, 'YYYYMMDD') = ? ");
				} else if(searchKey.equalsIgnoreCase("name")) {
					sb.append("    WHERE INSTR(name, ?) = 1 ");
				} else if(searchKey.equalsIgnoreCase("all")) {
					sb.append("    WHERE INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1");
				} else {
					sb.append("    WHERE INSTR("+searchKey+", ?) >= 1 ");
				}
				sb.append("		 AND (num < ? ) ");
				sb.append("		 ORDER BY num DESC ");
				sb.append("	  ) tb WHERE ROWNUM=1 ");

				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setString(1, searchValue);
				if(searchKey.equalsIgnoreCase("all")) {
					pstmt.setString(2, searchValue);
					pstmt.setInt(3, num);
				} else {
					pstmt.setInt(2, num);
				}
			} else {
				sb.append("SELECT ROWNUM, tb.* FROM ( ");
				sb.append("  SELECT num, subject FROM bbs ");
				sb.append("	 WHERE num < ? ");
				sb.append("		 ORDER BY num DESC ");
				sb.append("	  ) tb WHERE ROWNUM=1 ");

				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setInt(1, num);
			}

			rs=pstmt.executeQuery();

			if(rs.next()) {
				dto=new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}

		return dto;
	}
	
	public void updateBoard(BoardDTO dto) {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "UPDATE bbs SET name = ?, subject = ?, content = ?, pwd = ? WHERE num = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPwd());
			pstmt.setInt(5, dto.getNum());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
		}
	}
	
	public void deleteBoard(int num) {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "DELETE FROM bbs WHERE num = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
		}
	}
	
	/**
	 * title : 등록된 방멸록 전체 데이터 개수 가져오기
	 * @return
	 */
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM bbs";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
	
	/**
	 * title : 검색한 전체 데이터 개수 가져오기
	 * @param searchKey   // 검색할 키
	 * @param searchValue // 검색할 내용
	 * @return
	 */
	public int dataCount(String searchKey, String searchValue) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		// equalsIgnoreCase : 대소문자 구분없이
		try {
			if(searchKey.equalsIgnoreCase("created")) {
				// 검색값을 가지고 와서 "-, /, ."을 지우는 처리
				// replace, replaceAll 차이점 : replaceAll에서는 첫번째 인자에 정규식 표현 사용가능
				searchValue = searchValue.replaceAll("(\\-|\\/|\\.)", "");
				sql = "SELECT NVL(COUNT(*), 0) FROM bbs WHERE TO_CHAR(created, 'YYYYMMDD') = ?";
			} else if(searchKey.equalsIgnoreCase("name")) {
				sql = "SELECT NVL(COUNT(*), 0) FROM bbs WHERE INSTR(name, ?) = 1";
			} else if(searchKey.equalsIgnoreCase("all")) { // subject + content
				sql = "SELECT NVL(COUNT(*), 0) FROM bbs WHERE INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1";
			} else { // subject, content
				sql = "SELECT NVL(COUNT(*), 0) FROM bbs WHERE INSTR("+ searchKey +", ?) >= 1";
			}
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			if (searchKey.equalsIgnoreCase("all")) {
				pstmt.setString(2, searchValue);
			}
			
			rs = pstmt.executeQuery();			
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
}
