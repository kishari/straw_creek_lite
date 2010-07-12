package hu.dbx.screek.model;

import java.util.Date;

public class Quote {

	private Integer startYear;
	private Date startDate;
	private TypeOfDuration insuranceDuration;
	private Partner partner;
	private Vehicle vehicle;

	public void setPartner(Partner partner) {
		this.partner = partner;
	}

	public Partner getPartner() {
		return partner;
	}

	public Integer getStartYear() {
		return startYear;
	}

	public void setStartYear(Integer startYear) {
		this.startYear = startYear;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public TypeOfDuration getInsuranceDuration() {
		return insuranceDuration;
	}

	public void setInsuranceDuration(TypeOfDuration insuranceDuration) {
		this.insuranceDuration = insuranceDuration;
	}
	
	
}
