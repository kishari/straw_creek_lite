package hu.dbx.screek.model.facts;

public class LegalModFactorDef extends BaseDef {

	private Integer tariffCode;
	private Double value;
	
	
	public Double getValue() {
		return value;
	}
	
	public void setValue(Double value) {
		this.value = value;
	}

	public void setTariffCode(Integer tariffCode) {
		this.tariffCode = tariffCode;
	}

	public Integer getTariffCode() {
		return tariffCode;
	}
	
	
}
