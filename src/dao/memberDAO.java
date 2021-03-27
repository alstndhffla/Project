package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Connection.OracleXEConnection;
import vo.memberVO;

public class memberDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public memberDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	// 회원 등록
	public void addData(memberVO vo) {
		sb.setLength(0);
		sb.append("insert into member ");
		sb.append("values (member_mno_seq.nextVal, ?, ?, ?, ?, ?, ?, sysdate) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getAddress());
			pstmt.setString(6, vo.getAccount());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}// addData() end
	
	// 회원 정보 가져오기(1건)
	public memberVO getData(int no) {
		sb.setLength(0);
		sb.append("select * from member ");
		sb.append("where mno = ? ");
		
		memberVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			int mno = rs.getInt(1);
			String id = rs.getString(2);
			String pw = rs.getString(3);
			String name = rs.getString(4);
			String email = rs.getString(5);
			String address = rs.getString(6);
			String account = rs.getString(7);
			String regdate = rs.getString(8);
				
			vo = new memberVO(mno, id, pw, name, email, address, account, regdate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	} // getData(no) end
	
	// 회원 번호 가져오기
		public int getMno(String id) {
			sb.setLength(0);
			sb.append("select mno from member ");
			sb.append("where id = ? ");
			
			memberVO vo = null;
			int mno = -1;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				mno = rs.getInt(1);
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return mno;
		} // getData(no) end
	
	
	// 회원 존재 여부 
	public boolean isExist(String id, String pw) {
		sb.setLength(0);
		sb.append("select * from member ");
		sb.append("where id = ? and pw = ? ");
		
		boolean check = false;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			check = rs.next();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return check;
	}// isExist(id, pw) end
	
	// id 중복 체크
		public boolean isExistById(String id) {
			sb.setLength(0);
			sb.append("select * from member ");
			sb.append("where id = ? ");
			
			boolean check = false;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				check = rs.next();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return check;
		}// isExistById(id) end
		
	// 비밀번호 수정
	public void modifyPw(int mno, String pw) {
		sb.setLength(0);
		sb.append("update member ");
		sb.append("set pw = ? ");
		sb.append("where mno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, pw);
			pstmt.setInt(2, mno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// modifyPw(mno, pw) end
	
	// 이름 수정
	public void modifyName(int mno, String name) {
		sb.setLength(0);
		sb.append("update member ");
		sb.append("set name = ? ");
		sb.append("where mno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, name);
			pstmt.setInt(2, mno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// modifyName(mno, name) end
	
	// 이메일 수정
	public void modifyEmail(int mno, String email) {
		sb.setLength(0);
		sb.append("update member ");
		sb.append("set email = ? ");
		sb.append("where mno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, email);
			pstmt.setInt(2, mno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// modifyEmail(mno, email) end
	
	// 주소 수정
	public void modifyAddress(int mno, String address) {
		sb.setLength(0);
		sb.append("update member ");
		sb.append("set address = ? ");
		sb.append("where mno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, address);
			pstmt.setInt(2, mno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// modifyAddress(mno, address) end
	
	// 계좌번호 수정
	public void modifyAccunt(int mno, String account) {
		sb.setLength(0);
		sb.append("update member ");
		sb.append("set account = ? ");
		sb.append("where mno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, account);
			pstmt.setInt(2, mno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// modifyAccunt(mno, account) end
	
	// 회원 정보 삭제
	public void deleteData(int mno) {
		sb.setLength(0);
		sb.append("delete member ");
		sb.append("where mno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, mno);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}// deleteData(mno) end
	
}
