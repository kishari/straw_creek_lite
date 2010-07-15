package hu.dbx.screek.model.facts;

public class CubicCapacityModFactorDef extends BaseDef{

	private Integer capacityMin;
	private Integer capacityMax;
	private Double value;

	
	public Double getValue() {
		return value;
	}
	
	public void setValue(Double value) {
		this.value = value;
	}

	public Integer getCapacityMin() {
		return capacityMin;
	}

	public void setCapacityMin(Integer capacityMin) {
		this.capacityMin = capacityMin;
	}

	public Integer getCapacityMax() {
		return capacityMax;
	}

	public void setCapacityMax(Integer capacityMax) {
		this.capacityMax = capacityMax;
	}

}
