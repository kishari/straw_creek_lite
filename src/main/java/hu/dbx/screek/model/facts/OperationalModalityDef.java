package hu.dbx.screek.model.facts;

public class OperationalModalityDef extends BaseDef {
	private Integer operationalModality;
	private String description;

	public void setOperationalModality(Integer operationalModality) {
		this.operationalModality = operationalModality;
	}

	public Integer getOperationalModality() {
		return operationalModality;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
	
}
