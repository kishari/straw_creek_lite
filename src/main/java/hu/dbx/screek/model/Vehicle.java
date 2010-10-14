package hu.dbx.screek.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;

public class Vehicle {
	
	private Quote quote;
	private Integer typeCode;
	private String make;
	private Integer seatingCapacity;
	private Integer cubicCapacity;
	private Integer carryingCapacity;
	private Double ownWeight;
	private Double maximumAllowedWeight;
	private Integer maximumNettoPower;
	private Integer yearOfProduction;
	private Date dateOfPurchase;
	private Integer operationalModality;
	private Integer age;
	
	private ModFactorList modfactors = new ModFactorList();
	

	public Integer getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(Integer typeCode) {
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

	public Double getOwnWeight() {
		return ownWeight;
	}

	public void setOwnWeight(Double ownWeight) {
		this.ownWeight = ownWeight;
	}

	public Double getMaximumAllowedWeight() {
		return maximumAllowedWeight;
	}

	public void setMaximumAllowedWeight(Double maximumAllowedWeight) {
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

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getAge() {
		return age;
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

	public void setCarryingCapacity(Integer carryingCapacity) {
		this.carryingCapacity = carryingCapacity;
	}

	public Integer getCarryingCapacity() {
		return carryingCapacity;
	}

	public void setOperationalModality(Integer operationalModality) {
		this.operationalModality = operationalModality;
	}

	public Integer getOperationalModality() {
		return operationalModality;
	}

	public void setYearOfProduction(Integer yearOfProduction) {
		this.yearOfProduction = yearOfProduction;
	}

	public Integer getYearOfProduction() {
		return yearOfProduction;
	}
	
}
