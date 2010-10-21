package hu.dbx.screek.model.facts;

public class PaymentFreqModFactorDef extends BaseDef {
	
	private String frequencyCode;
	private Double value;
	
	public String getFrequencyCode() {
		return frequencyCode;
	}
	
	public void setFrequencyCode(String frequencyCode) {
		this.frequencyCode = frequencyCode;
	}
	
	public Double getValue() {
		return value;
	}
	
	public void setValue(Double value) {
		this.value = value;
	}

}
