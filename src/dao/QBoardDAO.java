package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.OracleXEConnection;
import vo.QBoardVO;

public class QBoardDAO {
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public QBoardDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	} 
	
	// 게시글 입력 - addData()
	public void addData(QBoardVO vo) {
		
		sb.setLength(0);
		sb.append("insert into qboard ");
		sb.append("values (qboard_qno_seq.nextval, ?, ?, sysdate, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getQtitle());
			pstmt.setString(2, vo.getQcontents());
			pstmt.setInt(3, vo.getMno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// addData() end
	
	// 전체 게시글 조회 - getAllData()
	public ArrayList<QBoardVO> getAllData(){
		
		ArrayList<QBoardVO> list = new ArrayList<QBoardVO>();
		
		sb.setLength(0);
		sb.append("select ");
		sb.append("q.qno, ");
		sb.append("q.qtitle, ");
		sb.append("q.qcontents, ");
		sb.append("q.qdate, ");
		sb.append("m.id, ");
		sb.append("m.mno ");
		sb.append("from qboard q, member m ");
		sb.append("where q.mno = m.mno ");
		sb.append("order by q.qno desc ");
		
		try {
			
			pstmt = conn.prepareStatement(sb.toString());
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int qno = rs.getInt("qno");
				String qtitle = rs.getString("qtitle");
				String qcontents = rs.getString("qcontents");
				String qdate = rs.getString("qdate");
				int mno = rs.getInt("mno");
				String id = rs.getString("id");
				
				QBoardVO vo = new QBoardVO(qno, qtitle, qcontents, qdate, mno, id);
				
				list.add(vo);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
		
	} // getAllData(startNo, endNo) end
	
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("select count(*) cnt " );
		sb.append("from qboard ");
		
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			cnt = rs.getInt("cnt");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;	
	}// getTotalcount() end
	
	// 데이터 한 건 조회 메소드  - 게시글 번호 - getData()
		public QBoardVO getData(int qno) {
			
			sb.setLength(0);
			sb.append("select a.qno, a.qtitle, a.qcontents, a.qdate, a.mno, b.id from qboard a, member b where a.mno = b.mno ");
			sb.append("and a.qno = ? ");
			
			QBoardVO vo = null;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, qno);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				String qtitle = rs.getString(2);
				String qcontents = rs.getString(3);
				String qdate = rs.getString(4);
				int mno = rs.getInt(5);
				String id = rs.getString(6);
				
				vo = new QBoardVO(qno, qtitle, qcontents, qdate, mno, id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return vo;		
		}// getData() end
		
		public void modifyData(QBoardVO vo) {
			
			sb.setLength(0);
			sb.append("update qboard ");
			sb.append("set qtitle = ?, qcontents = ? ");
			sb.append("where qno = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getQtitle());
				pstmt.setString(2, vo.getQcontents());
				pstmt.setInt(3, vo.getQno());
				
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}// modifyData() end
		
		// 게시글 삭제 메소드 - 게시글 번호 - deleteData()
		public void deleteData(int qno) {
			sb.setLength(0);
			sb.append("delete qboard ");
			sb.append("where qno = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, qno);
				
				pstmt.executeUpdate();		
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}// deleteData() end
		
		
}
