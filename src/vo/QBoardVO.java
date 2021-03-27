package vo;

public class QBoardVO {
	private int qno;
	private String qtitle;
	private String qcontents;
	private String qdate;
	private int mno;
	private String id;
	
	

	public QBoardVO() {}

	public QBoardVO(int qno, String qtitle, String qcontents, String qdate, int mno, String id) {
		super();
		this.qno = qno;
		this.qtitle = qtitle;
		this.qcontents = qcontents;
		this.qdate = qdate;
		this.mno = mno;
		this.id = id;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQcontents() {
		return qcontents;
	}

	public void setQcontents(String qcontents) {
		this.qcontents = qcontents;
	}

	public String getQdate() {
		return qdate;
	}

	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	
	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
