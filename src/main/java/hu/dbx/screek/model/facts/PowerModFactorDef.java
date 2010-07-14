package hu.dbx.screek.model.facts;

public class PowerModFactorDef extends BaseDef {
	
	private String makeCode;
	private Integer minPower;
	private Integer maxPower;
	private Double value;
	
	public String getMakeCode() {
		return makeCode;
	}

	public void setMakeCode(String makeCode) {
		this.makeCode = makeCode;
	}

	public Integer getMinPower() {
		return minPower;
	}

	public void setMinPower(Integer minPower) {
		this.minPower = minPower;
	}

	public Integer getMaxPower() {
		return maxPower;
	}

	public void setMaxPower(Integer maxPower) {
		this.maxPower = maxPower;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

}
