package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.OracleXEConnection;
import vo.AnswerVO;

public class AnswerDAO {
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;	
	Connection conn = null;
	
	public AnswerDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	// 댓글 입력 메소드
	public void insertReply(AnswerVO vo) {
		sb.setLength(0);
		sb.append("insert into answer ");
		sb.append("values (?, sysdate, ?, ?, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getAnswer());
			pstmt.setInt(2, vo.getQno());
			pstmt.setInt(3, vo.getAno());
			pstmt.setInt(4, vo.getMno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	// 댓글 조회 메소드
	public ArrayList<AnswerVO> getAllReply() {
		ArrayList<AnswerVO> list = new ArrayList<AnswerVO>();
		
		sb.setLength(0);
		sb.append("select ");
		sb.append("a.answer, ");
		sb.append("a.adate, ");
		sb.append("q.qno, ");
		sb.append("a.ano, ");
		sb.append("a.mno, ");
		sb.append("m.id ");
		sb.append("from answer a, qboard q, member m ");
		sb.append("where q.qno = a.qno and a.mno = m.mno ");
		sb.append("order by a.adate desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AnswerVO vo = new AnswerVO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6));
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
