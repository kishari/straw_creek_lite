package hu.dbx.screek.iface.model;

import java.util.Date;

public class VehicleV1 {
	//Típus
	private String typeCode;
	
	//Gyártmány
	private String makeCode;
	
	//Szállítható személyek száma
	private Integer seatingCapacity;
	
	//Hengerűrtartalom
	private Double cubicCapacity;
	
	//Saját tömeg
	private Double ownWeight;
	
	//Maximálisan megengedett össztömeg
	private Double maximumAllowedWeigth;
	
	//Teljesítmény
	private Double maximumNettoPower;
	
	//Első forgalomba helyezés dátuma
	private Date firstPutIntoTraffic;
	
	//Tulajdonszerzés dátuma
	private Date dateOfPurchaseOrOperation;
	
	//Üzemeltetés jellege
	private String useOfVehicleCode;

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getMakeCode() {
		return makeCode;
	}

	public void setMakeCode(String makeCode) {
		this.makeCode = makeCode;
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

	public Double getMaximumAllowedWeigth() {
		return maximumAllowedWeigth;
	}

	public void setMaximumAllowedWeigth(Double maximumAllowedWeigth) {
		this.maximumAllowedWeigth = maximumAllowedWeigth;
	}

	public Double getMaximumNettoPower() {
		return maximumNettoPower;
	}

	public void setMaximumNettoPower(Double maximumNettoPower) {
		this.maximumNettoPower = maximumNettoPower;
	}

	public Date getFirstPutIntoTraffic() {
		return firstPutIntoTraffic;
	}

	public void setFirstPutIntoTraffic(Date firstPutIntoTraffic) {
		this.firstPutIntoTraffic = firstPutIntoTraffic;
	}

	public Date getDateOfPurchaseOrOperation() {
		return dateOfPurchaseOrOperation;
	}

	public void setDateOfPurchaseOrOperation(Date dateOfPurchaseOrOperation) {
		this.dateOfPurchaseOrOperation = dateOfPurchaseOrOperation;
	}

	public String getUseOfVehicleCode() {
		return useOfVehicleCode;
	}

	public void setUseOfVehicleCode(String useOfVehicleCode) {
		this.useOfVehicleCode = useOfVehicleCode;
	}
	
}
