package vo;

public class AuctionVO {
	private int ano; //경매번호
	private String id; 
	private String title; // 경매제목
	private String contents; // 경매내용
	private String regdate; // 등록일자
	private String starttime; // 경매시작시간
	private String endtime; //경매마감시간
	private String status; // 경매상태
	private int maxprice; // 즉시 낙찰가
	private int minprice; // 입찰 최소금액
	private String imgpath; // 이미지
	private int mno; // 회원번호
	private int amount; // 판매수량
	private String category; // 카테고리
	private int bidder;
	
	public AuctionVO() {}

	public AuctionVO(int ano, String id, String title, String contents, String regdate, String starttime,
			String endtime, String status, int maxprice, int minprice, String imgpath, int mno, int amount,
			String category, int bidder) {
		super();
		this.ano = ano;
		this.id = id;
		this.title = title;
		this.contents = contents;
		this.regdate = regdate;
		this.starttime = starttime;
		this.endtime = endtime;
		this.status = status;
		this.maxprice = maxprice;
		this.minprice = minprice;
		this.imgpath = imgpath;
		this.mno = mno;
		this.amount = amount;
		this.category = category;
		this.bidder = bidder;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMaxprice() {
		return maxprice;
	}

	public void setMaxprice(int maxprice) {
		this.maxprice = maxprice;
	}

	public int getMinprice() {
		return minprice;
	}

	public void setMinprice(int minprice) {
		this.minprice = minprice;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getBidder() {
		return bidder;
	}

	public void setBidder(int bidder) {
		this.bidder = bidder;
	}

		
}
