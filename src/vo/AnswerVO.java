package vo;

public class AnswerVO {
	private String answer;
	private String adate;
	private int qno;
	private int ano;
	private int mno;
	private String id;
	
	
	public AnswerVO() {}


	public AnswerVO(String answer, String adate, int qno,  int ano, int mno, String id) {
		super();
		this.answer = answer;
		this.adate = adate;
		this.qno = qno;
		this.ano = ano;
		this.mno = mno;
		this.id = id;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public String getAdate() {
		return adate;
	}


	public void setAdate(String adate) {
		this.adate = adate;
	}


	public int getQno() {
		return qno;
	}


	public void setQno(int qno) {
		this.qno = qno;
	}


	public int getAno() {
		return ano;
	}


	public void setAno(int ano) {
		this.ano = ano;
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
