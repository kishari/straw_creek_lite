package hu.dbx.screek.model.facts;

public class DurationTypeDef extends BaseDef{
	private Integer durationType;
	private String description;

	public Integer getDurationType() {
		return durationType;
	}

	public void setDurationType(Integer durationType) {
		this.durationType = durationType;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

}
