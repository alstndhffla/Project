package vo;

public class BiddingVO {
	private int bno;
	private int mno;
	private int ano;
	private String price;
	private String time;
	private String id; //오라클 테이블에 열은 없는데 쿼리문의 작동을 위해서는 그릇 자체만을
	//만들어 둘 수는 있다.
	
	public BiddingVO() {
		
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public BiddingVO(int bno, int mno, int ano, String price, String time, String id) {
		super();
		this.bno = bno;
		this.mno = mno;
		this.ano = ano;
		this.price = price;
		this.time = time;
		this.id = id;
	}

	
	
	
}
