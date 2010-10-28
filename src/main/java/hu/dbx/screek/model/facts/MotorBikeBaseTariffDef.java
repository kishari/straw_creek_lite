package hu.dbx.screek.model.facts;

public class MotorBikeBaseTariffDef extends BaseDef {

	private Integer durationType;
	private Integer cubicCapacityMin;
	private Integer cubicCapacityMax;
	private Integer powerMin;
	private Integer powerMax;
	private Integer value;
	
	
	public Integer getDurationType() {
		return durationType;
	}
	
	public void setDurationType(Integer durationType) {
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

	public void setPowerMin(Integer powerMin) {
		this.powerMin = powerMin;
	}

	public Integer getPowerMin() {
		return powerMin;
	}

	public void setPowerMax(Integer powerMax) {
		this.powerMax = powerMax;
	}

	public Integer getPowerMax() {
		return powerMax;
	}

}
