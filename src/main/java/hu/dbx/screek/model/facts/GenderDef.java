package hu.dbx.screek.model.facts;

public class GenderDef extends BaseDef {

	private Integer genderCode;
	private String description;

	public void setGenderCode(Integer genderCode) {
		this.genderCode = genderCode;
	}

	public Integer getGenderCode() {
		return genderCode;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
	
}
