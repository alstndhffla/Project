package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.OracleXEConnection;
import vo.AnswerVO;

public class BanswerDAO {
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;	
	Connection conn = null;
	
	public BanswerDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	// �뙎湲� �엯�젰 硫붿냼�뱶
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
	
	// �뙎湲� 議고쉶 硫붿냼�뱶
	public ArrayList<AnswerVO> getAllReply() {
		ArrayList<AnswerVO> list = new ArrayList<AnswerVO>();
		
		sb.setLength(0);
		sb.append("select ");
		sb.append("an.answer, ");
		sb.append("an.adate, ");
		sb.append("an.qno, ");
		sb.append("an.ano, ");
		sb.append("an.mno, ");
		sb.append("m.id ");
		sb.append("from answer an, auction a, member m ");
		sb.append("where an.ano = a.ano and an.mno = m.mno ");
		sb.append("order by an.adate desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AnswerVO vo = new AnswerVO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6));
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}
