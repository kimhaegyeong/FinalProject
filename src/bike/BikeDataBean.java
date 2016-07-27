package bike;

public class BikeDataBean {
	/** 번호판. */
	private String id;

	/** 보험. */
	private int ins;
	
	private int did;

	public String getId() {
		return id;
	} 

	public void setId(String id) {
		this.id = id;
	}


	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public int getIns() {
		return ins;
	}

	public void setIns(int ins) {
		this.ins = ins;
	}

	
}
