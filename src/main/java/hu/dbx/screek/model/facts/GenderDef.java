package hu.dbx.screek.model.facts;

public class GenderDef extends BaseDef {

	private String genderCode;
	private String description;

	public void setGenderCode(String genderCode) {
		this.genderCode = genderCode;
	}

	public String getGenderCode() {
		return genderCode;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
	
}
