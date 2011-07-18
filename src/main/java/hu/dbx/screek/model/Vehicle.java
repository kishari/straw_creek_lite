package hu.dbx.screek.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;

public class Vehicle {
	
	private Quote quote;
	private String typeCode;
	private String make;
	private Integer seatingCapacity;
	private Integer cubicCapacity;
	private Integer ownWeight;
	private Integer maximumAllowedWeight;
	private Integer maximumNettoPower;
	private Integer yearOfProduction;
	private Date dateOfPurchase;
	private String operationalModality;
	private boolean cubicCapacityNotDefined;
	
	private ModFactorList modfactors = new ModFactorList();
	

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public Integer getSeatingCapacity() {
		return seatingCapacity;
	}

	public void setSeatingCapacity(Integer seatingCapacity) {
		this.seatingCapacity = seatingCapacity;
	}

	public Integer getCubicCapacity() {
		return cubicCapacity;
	}

	public void setCubicCapacity(Integer cubicCapacity) {
		this.cubicCapacity = cubicCapacity;
	}

	public Integer getOwnWeight() {
		return ownWeight;
	}

	public void setOwnWeight(Integer ownWeight) {
		this.ownWeight = ownWeight;
	}

	public Integer getMaximumAllowedWeight() {
		return maximumAllowedWeight;
	}

	public void setMaximumAllowedWeight(Integer maximumAllowedWeight) {
		this.maximumAllowedWeight = maximumAllowedWeight;
	}

	public Integer getMaximumNettoPower() {
		return maximumNettoPower;
	}

	public void setMaximumNettoPower(Integer maximumNettoPower) {
		this.maximumNettoPower = maximumNettoPower;
	}

	public Date getDateOfPurchase() {
		return dateOfPurchase;
	}

	public void setDateOfPurchase(Date dateOfPurchase) {
		this.dateOfPurchase = dateOfPurchase;
	}

	@XmlTransient
	public Quote getQuote() {
		return quote;
	}

	public void setQuote(Quote quote) {
		this.quote = quote;
	}

	@XmlElement(name = "modfactors")
	public ModFactorList getModfactors() {
		return modfactors;
	}

	public void setModfactors(ModFactorList modfactors) {
		this.modfactors = modfactors;
	}
	
	public void addModFactor(ModFactor mf){
		this.modfactors.getModfactors().add(mf);
	}

	public void setOperationalModality(String operationalModality) {
		this.operationalModality = operationalModality;
	}

	public String getOperationalModality() {
		return operationalModality;
	}

	public void setYearOfProduction(Integer yearOfProduction) {
		this.yearOfProduction = yearOfProduction;
	}

	public Integer getYearOfProduction() {
		return yearOfProduction;
	}

	public void setCubicCapacityNotDefined(boolean cubicCapacityNotDefined) {
		this.cubicCapacityNotDefined = cubicCapacityNotDefined;
	}

	public boolean isCubicCapacityNotDefined() {
		return cubicCapacityNotDefined;
	}
	
}
