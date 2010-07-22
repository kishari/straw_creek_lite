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
	private Date dateOfFirstPutIntoTraffic;
	private Date dateOfPurchase;
	private String operationalModality;
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

	public Date getDateOfFirstPutIntoTraffic() {
		return dateOfFirstPutIntoTraffic;
	}

	public void setDateOfFirstPutIntoTraffic(Date dateOfFirstPutIntoTraffic) {
		this.dateOfFirstPutIntoTraffic = dateOfFirstPutIntoTraffic;
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

	public void setOperationalModality(String operationalModality) {
		this.operationalModality = operationalModality;
	}

	public String getOperationalModality() {
		return operationalModality;
	}
	
}
