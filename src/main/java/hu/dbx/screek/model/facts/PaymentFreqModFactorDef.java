package hu.dbx.screek.model.facts;

public class PaymentFreqModFactorDef extends BaseDef {
	
	private Integer frequencyCode;
	private Double value;
	
	public Integer getFrequencyCode() {
		return frequencyCode;
	}
	
	public void setFrequencyCode(Integer frequencyCode) {
		this.frequencyCode = frequencyCode;
	}
	
	public Double getValue() {
		return value;
	}
	
	public void setValue(Double value) {
		this.value = value;
	}

}
