package hu.dbx.screek.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;

public class Vehicle {
	
	private Quote quote;
	private String typeCode;
	private String make;
	private Integer seatingCapacity;
	private Double cubicCapacity;
	private Double ownWeight;
	private Double maximumAllowedWeight;
	private Double maximumNettoPower;
	private Date dateOfFirstPutIntoTraffic;
	private Date dateOfPurchase;
	private String useOfVehicleCode;
	private Integer age;
	
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

	public Double getCubicCapacity() {
		return cubicCapacity;
	}

	public void setCubicCapacity(Double cubicCapacity) {
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

	public Double getMaximumNettoPower() {
		return maximumNettoPower;
	}

	public void setMaximumNettoPower(Double maximumNettoPower) {
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

	public String getUseOfVehicleCode() {
		return useOfVehicleCode;
	}

	public void setUseOfVehicleCode(String useOfVehicleCode) {
		this.useOfVehicleCode = useOfVehicleCode;
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
	
}
