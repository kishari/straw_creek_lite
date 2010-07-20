package hu.dbx.screek.model.facts;

public class AutoBusBaseTariffDef extends BaseDef {

	private String durationType;
	private Integer seatingCapacityMin;
	private Integer seatingCapacityMax;
	private Integer value;
	
	
	public String getDurationType() {
		return durationType;
	}
	public void setDurationType(String durationType) {
		this.durationType = durationType;
	}
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
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	
	
}
