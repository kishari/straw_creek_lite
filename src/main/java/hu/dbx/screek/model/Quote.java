package hu.dbx.screek.model;

import java.util.Date;

public class Quote {

	private Partner partner;
	private Integer startYear;
	private Date startDate;
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
	
	
}
