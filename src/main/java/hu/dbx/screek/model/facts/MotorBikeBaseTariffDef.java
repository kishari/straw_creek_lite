package hu.dbx.screek.model.facts;

public class MotorBikeBaseTariffDef extends BaseDef {

	private String durationType;
	private Integer cubicCapacityMin;
	private Integer cubicCapacityMax;
	private Integer value;
	
	
	public String getDurationType() {
		return durationType;
	}
	
	public void setDurationType(String durationType) {
		this.durationType = durationType;
	}
	
	public Integer getCubicCapacityMin() {
		return cubicCapacityMin;
	}
	
	public void setCubicCapacityMin(Integer cubicCapacityMin) {
		this.cubicCapacityMin = cubicCapacityMin;
	}
	
	public Integer getCubicCapacityMax() {
		return cubicCapacityMax;
	}
	
	public void setCubicCapacityMax(Integer cubicCapacityMax) {
		this.cubicCapacityMax = cubicCapacityMax;
	}
	
	public Integer getValue() {
		return value;
	}
	
	public void setValue(Integer value) {
		this.value = value;
	}

}
