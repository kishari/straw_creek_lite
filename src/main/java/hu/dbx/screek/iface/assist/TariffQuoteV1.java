package hu.dbx.screek.iface.assist;

import hu.dbx.screek.iface.model.*;
import hu.dbx.screek.model.TypeOfDuration;

import java.util.Date;

public class TariffQuoteV1 {
	
	private Integer startYear;
	private Date startDate;
	private TypeOfDuration insuranceDuration;
	private PartnerV1 partner;
	private VehicleV1 vehicle;
	
	
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
	
	public PartnerV1 getPartner() {
		return partner;
	}
	
	public void setPartner(PartnerV1 partner) {
		this.partner = partner;
	}
	
	public VehicleV1 getVehicle() {
		return vehicle;
	}
	
	public void setVehicle(VehicleV1 vehicle) {
		this.vehicle = vehicle;
	}

	public void setDuration(TypeOfDuration duration) {
		this.insuranceDuration = duration;
	}

	public TypeOfDuration getDuration() {
		return insuranceDuration;
	}

}
