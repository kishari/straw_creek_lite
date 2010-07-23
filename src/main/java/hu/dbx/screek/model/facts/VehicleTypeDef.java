package hu.dbx.screek.model.facts;

public class VehicleTypeDef extends BaseDef {

	private Integer typeCode;
	private String description;
	private Integer bonusMalusValid;
	private boolean bonusMalus;
	
	
	public boolean isBonusMalus() {
		return bonusMalus;
	}

	public void setBonusMalus(boolean bonusMalus) {
		this.bonusMalus = bonusMalus;
	}

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
}
