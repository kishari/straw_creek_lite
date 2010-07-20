package hu.dbx.screek.iface.model;

public class ModFactorV1 {
	private String code;
	private Double value;
	private boolean discount;
	
	public void setValue(Double value) {
		this.value = value;
	}
	
	public Double getValue() {
		return value;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setDiscount(boolean discount) {
		this.discount = discount;
	}

	public boolean isDiscount() {
		return discount;
	}
	
	
}
