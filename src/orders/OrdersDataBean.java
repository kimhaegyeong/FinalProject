package orders;

import java.sql.Date;

public class OrdersDataBean {
	/** 주문번호. */
	private Integer onum;

	/** 목적지. */
	private String destination;
	
	/** 상품가격. */
	private Integer price;

	/** 진행상황. */
	private String state;

	/** 등록시간. */
	private Date reg_Time;

	/** 배달비용. */ 
	private Integer dprice;

	/** 수수료. */
	private Short fees;

	/** 도착제한시간. */
	private Date limit_Time;

	/** 응답제한시간. */
	private Date res_Limit_Time;

	/** 전체공개 여부. */
	private String opencheck;

	/** sid */
	/*private String sid;*/
	private int sid;
	
	/** did */
	private int did;

	public Integer getOnum() {
		return onum;
	}

	public void setOnum(Integer onum) {
		this.onum = onum;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}


	public Integer getDprice() {
		return dprice;
	}

	public void setDprice(Integer dprice) {
		this.dprice = dprice;
	}

	public Short getFees() {
		return fees;
	}

	public void setFees(Short fees) {
		this.fees = fees;
	}	

	public String getOpencheck() {
		return opencheck;
	}

	public void setOpencheck(String opencheck) {
		this.opencheck = opencheck;
	}

	/*public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}*/

	public int getDid() {
		return did;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public void setDid(int did) {
		this.did = did;
	}
	
	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public Date getLimit_Time() {
		return limit_Time;
	}

	public void setLimit_Time(Date limit_Time) {
		this.limit_Time = limit_Time;
	}

	public Date getRes_Limit_Time() {
		return res_Limit_Time;
	}

	public void setRes_Limit_Time(Date res_Limit_Time) {
		this.res_Limit_Time = res_Limit_Time;
	}

	public Date getReg_Time() {
		return reg_Time;
	}

	public void setReg_Time(Date reg_Time) {
		this.reg_Time = reg_Time;
	}
}
