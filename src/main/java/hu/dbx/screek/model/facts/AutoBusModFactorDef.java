package hu.dbx.screek.model.facts;

public class AutoBusModFactorDef extends BaseDef{
	
	private Integer seatingCapacityMin;
	private Integer seatingCapacityMax;
	private Double value;
	
	public Integer getSeatingCapacityMin() {
		return seatingCapacityMin;
	}
	
	public void setSeatingCapacityMin(Integer seatingCapacityMin) {
		this.seatingCapacityMin = seatingCapacityMin;
	}
	
	public Integer getSeatingCapacityMax() {
		return seatingCapacityMax;
	}
	
	public void setSeatingCapacityMax(Integer seatingCapacityMax) {
		this.seatingCapacityMax = seatingCapacityMax;
	}
	
	public Double getValue() {
		return value;
	}
	
	public void setValue(Double value) {
		this.value = value;
	}

}
