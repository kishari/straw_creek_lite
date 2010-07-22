package hu.dbx.screek.model.facts;

public class ModFactorDef extends BaseDef {
	private Integer modfactorType;
	private String description;
	private Double value;
	
	public void setModfactorType(Integer modfactorType) {
		this.modfactorType = modfactorType;
	}
	public Integer getModfactorType() {
		return modfactorType;
	}
	public void setValue(Double value) {
		this.value = value;
	}
	public Double getValue() {
		return value;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDescription() {
		return description;
	}

}
