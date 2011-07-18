package hu.dbx.screek.iface.model;

public class ResultV1 {
	//private Integer monthlyPremium;
	private Integer installmentPremium;
	private Integer yearlyPremium;
	private Integer totalPremium;
	private Integer baseTariff;
	private Double discountMultiplier;
	private Double surchargeMultiplier;
	private Double otherMultiplier;
	private Double totalMultiplier;
	
	

	public Integer getBaseTariff() {
		return baseTariff;
	}
	public void setBaseTariff(Integer baseTariff) {
		this.baseTariff = baseTariff;
	}
	public void setDiscountMultiplier(Double discountMultiplier) {
		this.discountMultiplier = discountMultiplier;
	}
	public Double getDiscountMultiplier() {
		return discountMultiplier;
	}
	public void setSurchargeMultiplier(Double surchargeMultiplier) {
		this.surchargeMultiplier = surchargeMultiplier;
	}
	public Double getSurchargeMultiplier() {
		return surchargeMultiplier;
	}

	public void setYearlyPremium(Integer yearlyPremium) {
		this.yearlyPremium = yearlyPremium;
	}
	public Integer getYearlyPremium() {
		return yearlyPremium;
	}
	public void setOtherMultiplier(Double otherMultiplier) {
		this.otherMultiplier = otherMultiplier;
	}
	public Double getOtherMultiplier() {
		return otherMultiplier;
	}
	public void setTotalMultiplier(Double totalMultiplier) {
		this.totalMultiplier = totalMultiplier;
	}
	public Double getTotalMultiplier() {
		return totalMultiplier;
	}
	public void setTotalPremium(Integer totalPremium) {
		this.totalPremium = totalPremium;
	}
	public Integer getTotalPremium() {
		return totalPremium;
	}
	public void setInstallmentPremium(Integer installmentPremium) {
		this.installmentPremium = installmentPremium;
	}
	public Integer getInstallmentPremium() {
		return installmentPremium;
	}
	
	
}
