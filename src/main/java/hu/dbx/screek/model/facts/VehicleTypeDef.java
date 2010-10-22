package hu.dbx.screek.model.facts;

public class VehicleTypeDef extends BaseDef {

	private String typeCode;
	private String description;
	private String constantName;
	private Integer bonusMalusValid;
	private boolean bonusMalus;
	
	
	public boolean isBonusMalus() {
		return bonusMalus;
	}

	public void setBonusMalus(boolean bonusMalus) {
		this.bonusMalus = bonusMalus;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setBonusMalusValid(Integer bonusMalusValid) {
		this.bonusMalusValid = bonusMalusValid;
		if ( bonusMalusValid == 1 ) {
			this.bonusMalus = true;
		}
		else {
			this.bonusMalus = false;
		}
	}

	public Integer getBonusMalusValid() {
		return bonusMalusValid;
	}

	public void setConstantName(String constantName) {
		this.constantName = constantName;
	}

	public String getConstantName() {
		return constantName;
	}
}
