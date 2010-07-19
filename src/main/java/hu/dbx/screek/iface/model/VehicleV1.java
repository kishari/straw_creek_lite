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
	private Double cubicCapacity;
	
	//Saját tömeg
	private Double ownWeight;
	
	//Maximálisan megengedett össztömeg
	private Double maximumAllowedWeight;
	
	//Teljesítmény
	private Double maximumNettoPower;
	
	//Első forgalomba helyezés dátuma
	private Date dateOfFirstPutIntoTraffic;
	
	//Tulajdonszerzés dátuma
	private Date dateOfPurchase;
	
	//Üzemeltetés jellege
	private String useOfVehicleCode;
	
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
	
	@XmlElement(name = "modfactors")
	public ModFactorListV1 getModfactors() {
		return modfactors;
	}

	public void setModfactors(ModFactorListV1 modfactors) {
		this.modfactors = modfactors;
	}
	
}
