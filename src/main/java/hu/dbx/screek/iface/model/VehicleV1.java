package hu.dbx.screek.iface.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;

public class VehicleV1 {
	//Típus
	private Integer typeCode;
	
	//Gyártmány
	private String make;
	
	//Szállítható személyek száma
	private Integer seatingCapacity;
	
	//Hengerűrtartalom
	private Integer cubicCapacity;
	
	//teherbírás
	private Integer carryingCapacity;
	
	//Saját tömeg
	private Double ownWeight;
	
	//Maximálisan megengedett össztömeg
	private Double maximumAllowedWeight;
	
	//Teljesítmény
	private Integer maximumNettoPower;
	
	//Gyártási év
	private Integer yearOfProduction;
	
	//Tulajdonszerzés dátuma
	private Date dateOfPurchase;
	
	//Üzemeltetés jellege
	private Integer operationalModality;
	
	private ModFactorListV1 modfactors = new ModFactorListV1();
	

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

	@XmlElement(name = "modfactors")
	public ModFactorListV1 getModfactors() {
		return modfactors;
	}

	public void setModfactors(ModFactorListV1 modfactors) {
		this.modfactors = modfactors;
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
