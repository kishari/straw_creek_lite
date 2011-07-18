package hu.dbx.screek.model.facts;

public class PaymentFreqDef extends BaseDef{

	private String frequencyCode;
	private Integer	installmentDivisor;
	private String description;

	public void setFrequencyCode(String frequencyCode) {
		this.frequencyCode = frequencyCode;
	}

	public String getFrequencyCode() {
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
