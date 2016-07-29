package orders;

import java.sql.Date;

public class OrdersDataBean {
	/** 주문번호. */
	private Integer onum;

	/** 상품가격. */
	private Integer price;

	/** 진행상황. */
	private String state;

	/** 등록시간. */
	private Date regTime;

	/** 배달비용. */ 
	private Integer dprice;

	/** 수수료. */
	private Short fees;

	/** 도착제한시간. */
	private Date limitTime;

	/** 응답제한시간. */
	private Date resLimitTime;

	/** 전체공개 여부. */
	private String opencheck;

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

	public Date getRegTime() {
		return regTime;
	}

	public void setRegTime(Date regTime) {
		this.regTime = regTime;
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

	public Date getLimitTime() {
		return limitTime;
	}

	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

	public Date getResLimitTime() {
		return resLimitTime;
	}

	public void setResLimitTime(Date resLimitTime) {
		this.resLimitTime = resLimitTime;
	}

	public String getOpencheck() {
		return opencheck;
	}

	public void setOpencheck(String opencheck) {
		this.opencheck = opencheck;
	}

}
