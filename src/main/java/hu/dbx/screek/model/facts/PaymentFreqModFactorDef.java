package hu.dbx.screek.model.facts;

public class PaymentFreqModFactorDef extends BaseDef {
	
	private String frequency;
	private Double value;
	
	public String getFrequency() {
		return frequency;
	}
	
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	
	public Double getValue() {
		return value;
	}
	
	public void setValue(Double value) {
		this.value = value;
	}

}
