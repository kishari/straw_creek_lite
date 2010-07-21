package hu.dbx.screek.model.facts;

public class LegalModFactorDef extends BaseDef {

	private Integer areaCode;
	private Double value;
	
	
	public Double getValue() {
		return value;
	}
	
	public void setValue(Double value) {
		this.value = value;
	}

	public void setAreaCode(Integer areaCode) {
		this.areaCode = areaCode;
	}

	public Integer getAreaCode() {
		return areaCode;
	}
	
	
}
