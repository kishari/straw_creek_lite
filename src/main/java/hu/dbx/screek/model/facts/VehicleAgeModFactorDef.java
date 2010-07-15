package hu.dbx.screek.model.facts;

public class VehicleAgeModFactorDef extends BaseDef {

	private Integer ageMin;
	private Integer ageMax;
	private Double value;
	
	
	public Integer getAgeMin() {
		return ageMin;
	}
	
	public void setAgeMin(Integer ageMin) {
		this.ageMin = ageMin;
	}
	
	public Integer getAgeMax() {
		return ageMax;
	}
	
	public void setAgeMax(Integer ageMax) {
		this.ageMax = ageMax;
	}
	
	public Double getValue() {
		return value;
	}
	
	public void setValue(Double value) {
		this.value = value;
	}
}
