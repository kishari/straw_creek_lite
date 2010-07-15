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
	private String paymentFrequencyCode;
	
	//módosító paraméterek
	private boolean takeOutWithCasco;
	private boolean childPreference;
	private boolean mkbPartner;
	private boolean online;
	private boolean emailGranted;
	private boolean extraDamageExemption;
	private boolean groupedCollection;
	
	
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

	public TypeOfDuration getInsuranceDuration() {
		return insuranceDuration;
	}

	public void setInsuranceDuration(TypeOfDuration insuranceDuration) {
		this.insuranceDuration = insuranceDuration;
	}

	public boolean isTakeOutWithCasco() {
		return takeOutWithCasco;
	}

	public void setTakeOutWithCasco(boolean takeOutWithCasco) {
		this.takeOutWithCasco = takeOutWithCasco;
	}

	public boolean isChildPreference() {
		return childPreference;
	}

	public void setChildPreference(boolean childPreference) {
		this.childPreference = childPreference;
	}

	public boolean isMkbPartner() {
		return mkbPartner;
	}

	public void setMkbPartner(boolean mkbPartner) {
		this.mkbPartner = mkbPartner;
	}

	public boolean isOnline() {
		return online;
	}

	public void setOnline(boolean online) {
		this.online = online;
	}

	public boolean isEmailGranted() {
		return emailGranted;
	}

	public void setEmailGranted(boolean emailGranted) {
		this.emailGranted = emailGranted;
	}

	public String getPaymentFrequencyCode() {
		return paymentFrequencyCode;
	}

	public void setPaymentFrequencyCode(String paymentFrequencyCode) {
		this.paymentFrequencyCode = paymentFrequencyCode;
	}

	public boolean isExtraDamageExemption() {
		return extraDamageExemption;
	}

	public void setExtraDamageExemption(boolean extraDamageExemption) {
		this.extraDamageExemption = extraDamageExemption;
	}

	public void setGroupedCollection(boolean groupedCollection) {
		this.groupedCollection = groupedCollection;
	}

	public boolean isGroupedCollection() {
		return groupedCollection;
	}

	
}
