package hu.dbx.screek.iface.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;

public class VehicleV1 {
	//Típus
	private String typeCode;
	
	//Gyártmány
	private String make;
	
	//Szállítható személyek száma
	private Integer seatingCapacity;
	
	//Hengerűrtartalom
	private Integer cubicCapacity;
	
	//Saját tömeg
	private Integer ownWeight;
	
	//Maximálisan megengedett össztömeg
	private Integer maximumAllowedWeight;
	
	//Teljesítmény
	private Integer maximumNettoPower;
	
	//Gyártási év
	private Integer yearOfProduction;
	
	//Tulajdonszerzés dátuma
	private Date dateOfPurchase;
	
	//Üzemeltetés jellege
	private String operationalModality;
	
	private boolean cubicCapacityNotDefined; //A járműre nem értelmezett a hengerűrtartalom érték
	
	private ModFactorListV1 modfactors = new ModFactorListV1();
	

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

	@XmlElement(name = "modfactors")
	public ModFactorListV1 getModfactors() {
		return modfactors;
	}

	public void setModfactors(ModFactorListV1 modfactors) {
		this.modfactors = modfactors;
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
