package hu.dbx.screek.model.facts;

public class BonusMalusModFactorDef extends BaseDef {

	private String bmCode;
	private Double value;
	
	
	public String getBmCode() {
		return bmCode;
	}
	
	public void setBmCode(String bmCode) {
		this.bmCode = bmCode;
	}
	
	public Double getValue() {
		return value;
	}
	
	public void setValue(Double value) {
		this.value = value;
	}
	
}
