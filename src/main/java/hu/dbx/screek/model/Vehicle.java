package hu.dbx.screek.model;

import java.util.Date;

public class Vehicle {
	
	private String typeCode;
	private String makeCode;
	private Integer seatingCapacity;
	private Double cubicCapacity;
	private Double ownWeight;
	private Double maximumAllowedWeigth;
	private Double maximumNettoPower;
	private Date firstPutIntoTraffic;
	private Date dateOfPurchase;
	private String useOfVehicleCode;
	private Integer age;

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

}
