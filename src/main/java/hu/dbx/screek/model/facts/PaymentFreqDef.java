package hu.dbx.screek.model.facts;

public class PaymentFreqDef extends BaseDef{

	private Integer frequencyCode;
	private Integer	installmentDivisor;
	private String description;

	public void setFrequencyCode(Integer frequencyCode) {
		this.frequencyCode = frequencyCode;
	}

	public Integer getFrequencyCode() {
		return frequencyCode;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setInstallmentDivisor(Integer installmentDivisor) {
		this.installmentDivisor = installmentDivisor;
	}

	public Integer getInstallmentDivisor() {
		return installmentDivisor;
	}
	
}
