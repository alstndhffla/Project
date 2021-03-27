package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Connection.OracleXEConnection;
import vo.AuctionVO;
import vo.BiddingVO;

	public class BiddingDAO {
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = null;
	
	public BiddingDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	public BiddingVO insertBid(BiddingVO vo) {
		//biddingVO는 최근 걸로 데이터가 가져와짐. insert같은 경우는 한 행 수정이기 때문에 해당 VO로 작업을 함.
		sb.setLength(0);
		sb.append("insert into bidding ");
		sb.append("values (bidding_ano_seq.nextVal, ?, ?, ?, sysdate) ");	
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, vo.getMno());
			pstmt.setInt(2, vo.getAno());
			pstmt.setString(3, vo.getPrice());
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	
	//경매 입찰 참여자 수 
	public int countBidder(BiddingVO vo) {
		
		sb.setLength(0);
		sb.append("select count(distinct(mno)) as count from bidding ");
		sb.append("where ano = ? ");
		
		int count = -1;
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, vo.getAno());
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				count = rs.getInt(1);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return count;
	}
	
	//경매에 참여한 총 입찰 건 수
	public int countBid(BiddingVO vo) {
		
		sb.setLength(0);
		sb.append("select count(distinct(ano)) as count from bidding ");
		sb.append("where ano = ? ");
		
		int count1 = -1;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getAno());
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			count1 = rs.getInt(1);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count1;
	}
	
	//경매의 남은 시간 카운트.
	public String countTime(BiddingVO vo) {
		sb.setLength(0);
		sb.append("select (endtime - sysdate) as counttime from auction ");
		sb.append("where ano = ? ");
		String time = "";
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getAno());
			
			rs = pstmt.executeQuery();
			rs.next();
			
			time = rs.getString(1);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return time;
		
	}
	
	//입찰기록 --회원 아이디, 입찰가격, 입찰일시
	public List<BiddingVO> bidlist(BiddingVO vo) {
		
		List<BiddingVO> resultList = new ArrayList<BiddingVO>();
		
		sb.setLength(0);
		sb.append("select id, price, time ");
		sb.append("from member, bidding ");
		sb.append("where member.mno = bidding.mno and bidding.ano=? ");
		sb.append("order by time desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getAno());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BiddingVO resultVO = new BiddingVO();
				resultVO.setId(rs.getString("id"));
				resultVO.setPrice(rs.getString("price"));
				resultVO.setTime(rs.getString("time"));
				resultList.add(resultVO);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultList;
	}
	
	//입찰 가격 중 가장 높은 가격(현재 입찰가, 낙찰자)
	public int topprice(BiddingVO vo) {
		sb.setLength(0);
		sb.append("select max(price) from member, bidding ");
		sb.append("where member.mno = bidding.mno and bidding.ano = ? ");
		int topprice=0;
		try {
			pstmt = conn.prepareStatement(sb.toString()); //이거 써도 try-catch문이 활성이 안되네;; 일일히 입력함.
			
			pstmt.setInt(1, vo.getAno());
			
			rs = pstmt.executeQuery();
			rs.next();
			
			topprice=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return topprice;
			
		
	}
	
	//입찰 취소(자신이 참여한 경매의 입찰 자체를 아예 취소)
	public void deleteBid(int ano, int mno) {
		sb.setLength(0);
		sb.append("delete from bidding ");
		sb.append("where ano = ? and mno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, ano);
			pstmt.setInt(2, mno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//deleteBid() end
	
	
	
	//입찰 참여자 수가 많은 순서대로 best5 리스트화.(이미지, 남은 시간, 입찰 참여자)
	public List<AuctionVO> popularlist(AuctionVO vo){
		
		List<AuctionVO> popular = new ArrayList<AuctionVO>();
		
		sb.setLength(0); 
		sb.append("select ano, title, a.imgpath, (a.endtime-sysdate) as time, (select count(distinct(mno)) as count from bidding where a.ano = ano) as bidder ");
		sb.append("from auction a ");
		sb.append("where sysdate BETWEEN a.starttime and a.endtime ");
		sb.append("order by bidder desc");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AuctionVO popularVO = new AuctionVO();
				popularVO.setAno(rs.getInt("ano"));
				popularVO.setTitle(rs.getString("title"));
				popularVO.setImgpath(rs.getString("imgpath")); 
				popularVO.setStarttime(rs.getString("time"));
				popularVO.setBidder(rs.getInt("bidder"));
				popular.add(popularVO);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return popular;
	}
	
	
	//회원 개인의 입찰한 목록 총 건수	
	   public int getTotalBid(int mno) {
	      
	      sb.setLength(0);
	      sb.append("select count(max(price)) as count from bidding where mno = ? group by mno, ano " );
	      // 회원고유값으로 게시물 가져오기
	      
	      int totalbid = 0;
	      
	      try {
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setInt(1, mno);
	         
	         rs = pstmt.executeQuery();
	         
	         rs.next();
	         
	         totalbid = rs.getInt("count");
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      return totalbid;
	   }// getTotalCount() end
	
	   
	   
	   public ArrayList<BiddingVO> myBiddingList(int mno){
		   
		   ArrayList<BiddingVO> biddingList = new ArrayList<BiddingVO>();
		   
		  sb.setLength(0);
	      sb.append("select max(price) as price, mno, ano from bidding where mno = ? group by mno, ano order by ano desc" );
	      
	      try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, mno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BiddingVO biddingVO = new BiddingVO();
				biddingVO.setPrice(rs.getString("price"));
				biddingVO.setMno(rs.getInt("mno"));
				biddingVO.setAno(rs.getInt("ano"));				
				
				biddingList.add(biddingVO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		   
		   
		   return biddingList;
	   }
}
