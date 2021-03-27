package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.OracleXEConnection;
import vo.AuctionVO;

public class AuctionDAO {
   StringBuffer sb = new StringBuffer();
   ResultSet rs = null;
   PreparedStatement pstmt = null;
   Connection conn = null;
   
   public AuctionDAO() {
      conn = OracleXEConnection.getInstance().getConnection();
   }
   
   // 데이터 추가
   public void addData(AuctionVO vo) {
      
      sb.setLength(0);
      sb.append("insert into auction (ANO, TITLE, CONTENTS, REGDATA, STARTTIME, ENDTIME, MAXPRICE, MINPRICE, IMGPATH, MNO, AMOUNT, CATEGORY, STATUS) ");
      sb.append("values (auction_ano_seq.nextVal, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?, ?, 'N') ");
                                 // 경매작성 시 등록일자, 참여자수, 경매상태 관련해서는 어찌해야지?
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         
         pstmt.setString(1, vo.getTitle());
         pstmt.setString(2, vo.getContents());
         pstmt.setString(3, vo.getStarttime());
         pstmt.setString(4, vo.getEndtime());
         pstmt.setInt(5, vo.getMaxprice());
         pstmt.setInt(6, vo.getMinprice());
         pstmt.setString(7, vo.getImgpath());
         pstmt.setInt(8, vo.getMno());
         pstmt.setInt(9, vo.getAmount());
         pstmt.setString(10, vo.getCategory());
         
         pstmt.executeUpdate();
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

   }
   
   // 데이터 검색
   public AuctionVO selectOne(AuctionVO vo) {

      sb.setLength(0);
      sb.append(
            "SELECT ANO, TITLE, CONTENTS, REGDATA, STARTTIME, ENDTIME, MAXPRICE, MINPRICE, IMGPATH, MNO, AMOUNT, CATEGORY, STATUS FROM AUCTION "
                  + "WHERE ANO = ?");

      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1, vo.getAno());
         rs = pstmt.executeQuery();
         rs.next();

         int ano = rs.getInt(1);
         String title = rs.getString(2);
         String contents = rs.getString(3);
         String regdata = rs.getString(4);
         String startTime = rs.getString(5);
         String endTime = rs.getString(6);
         int maxPrice = rs.getInt(7);
         int minPrice = rs.getInt(8);
         String imgPath = rs.getString(9);
         int mno = rs.getInt(10);
         int amount = rs.getInt(11);
         String category = rs.getString(12);
         String status = rs.getString(13);

         vo.setAno(ano);
         vo.setTitle(title);
         vo.setContents(contents);
         vo.setRegdate(regdata);
         vo.setStarttime(startTime);
         vo.setEndtime(endTime);
         vo.setMaxprice(maxPrice);
         vo.setMinprice(minPrice);
         vo.setImgpath(imgPath);
         vo.setMno(mno);
         vo.setAmount(amount);
         vo.setCategory(category);
         vo.setStatus(status);

      } catch (SQLException e) {
         e.printStackTrace();
      }

      return vo;
   }
   
   // 총 게시물 파악 메소드
   public int getTotalCount(int mno) {
      
      sb.setLength(0);
      sb.append("select count(*) cnt " );
      sb.append("from auction ");
      sb.append("where mno = ? ");
      // 회원고유값으로 게시물 가져오기
      
      int cnt = 0;
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1, mno);
         
         rs = pstmt.executeQuery();
         
         rs.next();
         
         cnt = rs.getInt("cnt");
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return cnt;
   }// getTotalCount() end
   
   // 데이터 한 건 조회 메소드 
   // 한 건 데이터 조회시 int ano(변수)로 지정해주었기 때문에 new auctionVO 를 지정해주고
   // get를 했으면  set을 통해서 해당 값들을 불러와야 Detail에 보여질 수 있음.
   public AuctionVO getDate(int ano) {
      
      sb.setLength(0);
      sb.append("select * from auction ");
      sb.append("where ano = ? ");
      
      AuctionVO vo = new AuctionVO();
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1, ano);
         
         rs = pstmt.executeQuery();
         
         rs.next();
         
         String title = rs.getString(2);
         String contents = rs.getString(3);
         String regdata = rs.getString(4);
         String startTime = rs.getString(5);
         String endTime = rs.getString(6);
         int maxPrice = rs.getInt(7);
         int minPrice = rs.getInt(8);
         String imgPath = rs.getString(9);
         int mno = rs.getInt(10);
         int amount = rs.getInt(11);
         String category = rs.getString(12);
         int auctionAno = rs.getInt(1);
         
         
         vo.setTitle(title);
         vo.setContents(contents);
         vo.setRegdate(regdata);
         vo.setStarttime(startTime);
         vo.setEndtime(endTime);
         vo.setMaxprice(maxPrice);
         vo.setMinprice(minPrice);
         vo.setImgpath(imgPath);
         vo.setMno(mno);
         vo.setAmount(amount);
         vo.setCategory(category);
         vo.setAno(auctionAno);
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return vo;
   }
   
   // 게시글 수정 - (다 수정 가능하게?)
   public void modifyData(AuctionVO vo) {
      
      sb.setLength(0);
      sb.append("UPDATE AUCITON ");
      sb.append("SET TITLE = ?, CONTENTS = ?, STARTTIME = ?, ENDTIME = ?, MAXPRICE = ?, MINPRICE = ?, IMGPATH = ?, AMOUNT = ?, CATEGORY = ? ");
      sb.append("WHERE ANO = ? ");
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setString(1, vo.getTitle());
         pstmt.setString(2, vo.getContents());
         pstmt.setString(3, vo.getStarttime());
         pstmt.setString(4, vo.getEndtime());
         pstmt.setInt(5, vo.getMaxprice());
         pstmt.setInt(6, vo.getMinprice());
         pstmt.setString(7, vo.getImgpath());
         pstmt.setInt(8, vo.getAmount());
         pstmt.setString(9, vo.getCategory());
         
         pstmt.executeUpdate();
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }// modifyDate() end
   
   // 게시글 삭제 - deleteDate()
   public void deleteDate(AuctionVO vo) {
      
      sb.setLength(0);
      sb.append("delete from auction ");
      sb.append("where ano = ? ");
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1, vo.getAno());
         
         pstmt.executeUpdate();
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }// delectData() end
   
   // mno값으로 조회해서 전체 게시물 가져오고 정렬하기
   public ArrayList<AuctionVO> getAllData(int startNo, int endNo, int mno){
      
      ArrayList<AuctionVO> list = new ArrayList<AuctionVO>();
      
      sb.setLength(0);
      sb.append("select * from ");
      sb.append("(select rownum rn, ano, title, contents, regdata, starttime, endtime, status, maxprice, minprice, imgpath, mno, amount, category from ");
      sb.append("(select * from auction order by ano desc) ");
      sb.append("where rownum <= ?) ");
      sb.append("where rn >= ? and mno = ? ");
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1, endNo);
         pstmt.setInt(2, startNo);
         pstmt.setInt(3, mno);
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            int ano = rs.getInt("ano");
            String title = rs.getString("title");
            String contents = rs.getString("contents");
            String regdate = rs.getString("regdata");
            String starttime = rs.getString("starttime");
            String endtime = rs.getString("endtime");
            String status = rs.getString("status");
            int maxprice = rs.getInt("maxprice");
            int minprice = rs.getInt("minprice");
            String imgpath = rs.getString("imgpath");
            mno = rs.getInt("mno");
            int amount = rs.getInt("amount");
            String category = rs.getString("category");
            
            
            AuctionVO vo = new AuctionVO(ano, "", title, contents, regdate, starttime, endtime, status, maxprice, minprice, imgpath, mno, amount, category, 0);   
            list.add(vo);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return list;
   }
   
   public void updateData(AuctionVO vo) {
      
      sb.setLength(0);
      sb.append("UPDATE AUCTION SET  ");
      sb.append("TITLE = ?,  ");
      sb.append("CONTENTS = ?,  ");
      sb.append("STARTTIME = ?,  ");
      sb.append("ENDTIME = ?,  ");
      sb.append("MAXPRICE = ?,  ");
      sb.append("MINPRICE = ?,  ");
      sb.append("IMGPATH = ?,  ");
      sb.append("AMOUNT = ?,  ");
      sb.append("CATEGORY = ?  ");
      sb.append("WHERE ANO = ?  ");
      
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         
         pstmt.setString(1, vo.getTitle());
         pstmt.setString(2, vo.getContents());
         pstmt.setString(3, vo.getStarttime());
         pstmt.setString(4, vo.getEndtime());
         pstmt.setInt(5, vo.getMaxprice());
         pstmt.setInt(6, vo.getMinprice());
         pstmt.setString(7, vo.getImgpath());
         pstmt.setInt(8, vo.getAmount());
         pstmt.setString(9, vo.getCategory());
         pstmt.setInt(10, vo.getAno());
         
         pstmt.executeUpdate();
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
   }
   
   
   
   
   public ArrayList<AuctionVO> getSearchedData(String title){ 
       ArrayList<AuctionVO> searchedlist = new ArrayList<AuctionVO>();
     
       sb.setLength(0); 
       sb.append("select ano, title, a.imgpath, (a.endtime-sysdate) as time, (select count(distinct(mno)) as count from bidding where a.ano = ano) as bidder ");
       sb.append("from auction a ");
       sb.append("where title like '%"+title+"%' ");
       
          try {
            pstmt = conn.prepareStatement(sb.toString());
            /* pstmt.setString(1, title); */ //석호한테 물어보기. 이거 왜 안써 시발
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
               AuctionVO searchedlistVO = new AuctionVO();
               searchedlistVO.setAno(rs.getInt("ano"));
               searchedlistVO.setTitle(rs.getString("title"));
               searchedlistVO.setImgpath(rs.getString("imgpath"));
               searchedlistVO.setStarttime(rs.getString("time"));
               searchedlistVO.setBidder(rs.getInt("bidder"));
               searchedlist.add(searchedlistVO);
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
          return searchedlist;
       
    
    }   
   
   	   
// 입찰자(bidder)순으로 메인화면에 출력할 수 있는 메소드 - F 관련 쿼리(수정중)
		public ArrayList<AuctionVO> getAData(){
			
			ArrayList<AuctionVO> Alist = new ArrayList<AuctionVO>();
			
			sb.setLength(0);
			sb.append("select ano, m.id, title, a.imgpath, (a.endtime - sysdate) as time, a.category, ");
			sb.append("(select count(distinct(mno)) as count from bidding where a.ano = ano) as bidder ");
			sb.append("from auction a, member m ");
			sb.append("where a.mno=m.mno ");
			sb.append("and sysdate BETWEEN a.starttime and a.endtime ");
			sb.append("order by bidder desc ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					AuctionVO vo = new AuctionVO();					
					vo.setAno(rs.getInt("ano"));
					vo.setId(rs.getString("id"));
					vo.setTitle(rs.getString("title"));
					vo.setImgpath(rs.getString("imgpath")); 
					vo.setStarttime(rs.getString("time"));
					vo.setBidder(rs.getInt("bidder"));
					Alist.add(vo);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return Alist;
		}
   
   // 입찰자(bidder)순으로 메인화면에 출력할 수 있는 메소드 - F 관련 쿼리
   public ArrayList<AuctionVO> getFData(){
      
      ArrayList<AuctionVO> Flist = new ArrayList<AuctionVO>();
      
      sb.setLength(0);
      sb.append("select ano, m.id, title, a.imgpath, (a.endtime-sysdate) as time, a.category, ");
      sb.append("(select count(distinct(mno)) as count from bidding where a.ano = ano) as bidder ");
      sb.append("from auction a, member m ");
      sb.append("where a.mno=m.mno and category = 'F' ");
      sb.append("and sysdate BETWEEN a.starttime and a.endtime ");
      sb.append("order by bidder desc ");
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            AuctionVO vo = new AuctionVO();
            vo.setAno(rs.getInt("ano"));
            vo.setId(rs.getString("id"));
            vo.setTitle(rs.getString("title"));
            vo.setImgpath(rs.getString("imgpath")); 
            vo.setStarttime(rs.getString("time"));
            vo.setBidder(rs.getInt("bidder"));
            Flist.add(vo);
            
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return Flist;
   }
   
   
   //입찰자(bidder)순으로 메인화면에 출력할 수 있는 메소드 - E 관련 쿼리
   public ArrayList<AuctionVO> getEData(){
   
   ArrayList<AuctionVO> Elist = new ArrayList<AuctionVO>();
   
   sb.setLength(0);
   sb.append("select ano, m.id, title, a.imgpath, (a.endtime-sysdate) as time, a.category, ");
   sb.append("(select count(distinct(mno)) as count from bidding where a.ano = ano) as bidder ");
   sb.append("from auction a, member m ");
   sb.append("where a.mno=m.mno and category = 'E' ");
   sb.append("and sysdate BETWEEN a.starttime and a.endtime ");
   sb.append("order by bidder desc ");
   
   try {
      pstmt = conn.prepareStatement(sb.toString());
      
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
         AuctionVO vo = new AuctionVO();
         vo.setAno(rs.getInt("ano"));
         vo.setId(rs.getString("id"));
         vo.setTitle(rs.getString("title"));
         vo.setImgpath(rs.getString("imgpath")); 
         vo.setStarttime(rs.getString("time"));
         vo.setBidder(rs.getInt("bidder"));
         Elist.add(vo);
         
         }
      } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      }
      return Elist;
   }

   //입찰자(bidder)순으로 메인화면에 출력할 수 있는 메소드 - C 관련 쿼리
   public ArrayList<AuctionVO> getCData(){
   
   ArrayList<AuctionVO> Clist = new ArrayList<AuctionVO>();
   
   sb.setLength(0);
   sb.append("select ano, m.id, title, a.imgpath, (a.endtime-sysdate) as time, a.category, ");
   sb.append("(select count(distinct(mno)) as count from bidding where a.ano = ano) as bidder ");
   sb.append("from auction a, member m ");
   sb.append("where a.mno=m.mno and category = 'C' ");
   sb.append("and sysdate BETWEEN a.starttime and a.endtime ");
   sb.append("order by bidder desc ");
   
   try {
      pstmt = conn.prepareStatement(sb.toString());
      
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
         AuctionVO vo = new AuctionVO();
         vo.setAno(rs.getInt("ano"));
         vo.setId(rs.getString("id"));
         vo.setTitle(rs.getString("title"));
         vo.setImgpath(rs.getString("imgpath")); 
         vo.setStarttime(rs.getString("time"));
         vo.setBidder(rs.getInt("bidder"));
         Clist.add(vo);
         
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return Clist;
   }
   
   
   public boolean finalCount(int mno) {
	   boolean state = false;
	   
	   sb.setLength(0);
	   sb.append("select count(1) as count from auction where sysdate > endtime and ano = ? ");
	   
	  try {
		pstmt = conn.prepareStatement(sb.toString());
		pstmt.setInt(1, mno);
		
		rs = pstmt.executeQuery();
		
		rs.next();
		int count = 0;
		count = rs.getInt(1);
		
		if(count > 0) {
			state = true;
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	      
	   return state;
   }
   
   
   }













