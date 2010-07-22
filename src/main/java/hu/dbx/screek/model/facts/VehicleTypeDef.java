package hu.dbx.screek.model.facts;

public class VehicleTypeDef extends BaseDef {

	private Integer typeCode;
	private String description;
	

	public void setTypeCode(Integer typeCode) {
		this.typeCode = typeCode;
	}

	public Integer getTypeCode() {
		return typeCode;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
}
