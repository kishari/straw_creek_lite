package hu.dbx.screek.model.facts;

public class DrivingLicenseModFactorDef extends BaseDef {
	
	private Integer sinceMin;
	private Integer sinceMax;
	private Double value;
	
	
	public Integer getSinceMin() {
		return sinceMin;
	}

	public void setSinceMin(Integer sinceMin) {
		this.sinceMin = sinceMin;
	}

	public Integer getSinceMax() {
		return sinceMax;
	}

	public void setSinceMax(Integer sinceMax) {
		this.sinceMax = sinceMax;
	}

	public Double getValue() {
		return value;
	}
	
	public void setValue(Double value) {
		this.value = value;
	}
}
