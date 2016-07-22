package delivery;

public class DeliveryDataBean {
	/** did. */
	private Integer did;

	/** email+id. */
	private String email;
 
	/** 비번. */
	private String passwd;

	/** 가게명. */
	private String shopName;

	/** 사업주. */
	private String owner;

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

	/** 배달비용. */
	private Integer dprice;

	/** 실사용가능오토바이. */
	private Integer bike;

	/** 이미지경로. */
	private String imgpath;

	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
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

	public String getowner() {
		return owner;
	}

	public void setowner(String owner) {
		this.owner = owner;
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

	public Integer getDprice() {
		return dprice;
	}

	public void setDprice(Integer dprice) {
		this.dprice = dprice;
	}

	public Integer getBike() {
		return bike;
	}

	public void setBike(Integer bike) {
		this.bike = bike;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	
}
