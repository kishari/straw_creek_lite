package hu.dbx.screek.model.facts;

public class PowerModFactorDef extends BaseDef {
	
	private String makeCode;
	private Integer powerMin;
	private Integer powerMax;
	private Double value;
	
	public String getMakeCode() {
		return makeCode;
	}

	public void setMakeCode(String makeCode) {
		this.makeCode = makeCode;
	}

	public Integer getPowerMin() {
		return powerMin;
	}

	public void setPowerMin(Integer powerMin) {
		this.powerMin = powerMin;
	}

	public Integer getPowerMax() {
		return powerMax;
	}

	public void setPowerMax(Integer powerMax) {
		this.powerMax = powerMax;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

}
