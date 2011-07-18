package hu.dbx.screek.model.facts;

public class OperationalModalityDef extends BaseDef {
	private String operationalModality;
	private String description;

	public void setOperationalModality(String operationalModality) {
		this.operationalModality = operationalModality;
	}

	public String getOperationalModality() {
		return operationalModality;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
	
}
