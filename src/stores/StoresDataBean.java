package stores;

public class StoresDataBean {
	/** sid. */
	private Integer sid;

	/** email+id. */
	private String email;

	/** 비번. */
	private String passwd;

	/** 가게명. */
	private String shopName; 

	/** 사업주. */
	private String onner;

	/** 우편번호. */
	private Short post;

	/** 주소. */
	private String address;

	/** 전화번호. */
	private String tel;

	/** 핸드폰번호. */
	private String phone;

	/** 자기소개. */
	private String intro;

	/** 사업자번호. */
	private Integer shopNum;

	/** 위도. */
	private Double lat;

	/** 경도. */
	private Double lng;

	/** 최대배달비. */
	private Short maxPrice;

	/** 이미지 경로. */
	private String imgpath;

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getOnner() {
		return onner;
	}

	public void setOnner(String onner) {
		this.onner = onner;
	}

	public Short getPost() {
		return post;
	}

	public void setPost(Short post) {
		this.post = post;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Integer getShopNum() {
		return shopNum;
	}

	public void setShopNum(Integer shopNum) {
		this.shopNum = shopNum;
	}

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public Short getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(Short maxPrice) {
		this.maxPrice = maxPrice;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
}
