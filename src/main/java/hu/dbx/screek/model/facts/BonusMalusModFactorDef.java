package hu.dbx.screek.model.facts;

public class BonusMalusModFactorDef extends BaseDef {

	private String bonusMalus;
	private Double value;
	
	
	public Double getValue() {
		return value;
	}
	
	public void setValue(Double value) {
		this.value = value;
	}

	public void setBonusMalus(String bonusMalus) {
		this.bonusMalus = bonusMalus;
	}

	public String getBonusMalus() {
		return bonusMalus;
	}
	
}
