package hu.dbx.screek.model;

import javax.xml.bind.annotation.XmlTransient;

public class ModFactor {

	private String code;
	private Double value;
	
	//type = MULTIPLIER, DISCOUNT, SURCHARGE
	private String type;
	private Quote quote;
	private Partner partner;
	private Vehicle vehicle;
	
	private boolean discount;
	private boolean surcharge;
	
	
	public boolean isSurcharge() {
		return surcharge;
	}

	public void setSurcharge(boolean surcharge) {
		this.surcharge = surcharge;
	}

	public ModFactor() {}
	
	public ModFactor(String code, Double value, Quote quote, String type) {
		this.code = code;
		this.value = value;
		this.quote = quote;
		this.type = type;
		
		if ("SURCHARGE".equals(type)) {
			this.surcharge = true;
		}
		else if ("DISCOUNT".equals(type)) {
			this.discount = true;
		}
	}
	
	public ModFactor(String code, Double value, Partner partner, String type) {
		this.code = code;
		this.value = value;
		this.partner = partner;
		this.type = type;
		
		if ("SURCHARGE".equals(type)) {
			this.surcharge = true;
		}
		else if ("DISCOUNT".equals(type)) {
			this.discount = true;
		}
	}
	
	public ModFactor(String code, Double value, Vehicle vehicle, String type) {
		this.code = code;
		this.value = value;
		this.vehicle = vehicle;
		this.type = type;
		
		if ("SURCHARGE".equals(type)) {
			this.surcharge = true;
		}
		else if ("DISCOUNT".equals(type)) {
			this.discount = true;
		}
	}
	
	public void setValue(Double value) {
		this.value = value;
	}
	
	public Double getValue() {
		return value;
	}

	@XmlTransient
	public Quote getQuote() {
		return quote;
	}

	public void setQuote(Quote quote) {
		this.quote = quote;
	}

	public Partner getPartner() {
		return partner;
	}

	public void setPartner(Partner partner) {
		this.partner = partner;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setDiscount(boolean discount) {
		this.discount = discount;
	}

	public boolean isDiscount() {
		return discount;
	}
	
	
}
