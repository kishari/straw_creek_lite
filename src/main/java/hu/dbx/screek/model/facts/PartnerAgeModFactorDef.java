package hu.dbx.screek.model.facts;

public class PartnerAgeModFactorDef extends BaseDef {

	private Integer areaCode;
	private Integer ageMin;
	private Integer ageMax;
	private Double value;
	
	
	public Integer getAreaCode() {
		return areaCode;
	}
	
	public void setAreaCode(Integer areaCode) {
		this.areaCode = areaCode;
	}
	
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
