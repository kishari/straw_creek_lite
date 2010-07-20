package hu.dbx.screek.model.facts;

public class ModFactorDef extends BaseDef {
	private String modfactorType;
	private Double value;
	
	public void setModfactorType(String modfactorType) {
		this.modfactorType = modfactorType;
	}
	public String getModfactorType() {
		return modfactorType;
	}
	public void setValue(Double value) {
		this.value = value;
	}
	public Double getValue() {
		return value;
	}

}
