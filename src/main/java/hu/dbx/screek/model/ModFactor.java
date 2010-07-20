package hu.dbx.screek.model;

import javax.xml.bind.annotation.XmlTransient;

public class ModFactor {

	private String code;
	private Double value;
	
	private boolean discount;
	private Quote quote;
	private Partner partner;
	private Vehicle vehicle;
	
	
	public ModFactor() {}
	
	public ModFactor(String code, Double value, Quote quote) {
		this.code = code;
		this.value = value;
		this.quote = quote;
	}
	
	public ModFactor(String code, Double value, Partner partner) {
		this.code = code;
		this.value = value;
		this.partner = partner;
	}
	
	public ModFactor(String code, Double value, Vehicle vehicle) {
		this.code = code;
		this.value = value;
		this.vehicle = vehicle;
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

	public void setDiscount(boolean discount) {
		this.discount = discount;
	}

	public boolean isDiscount() {
		return discount;
	}
	
	
}
