package hu.dbx.screek.model;

public class Result {
	
	//private Integer monthlyPremium;
	private Integer yearlyPremium;
	private Integer installmentPremium;
	private Integer totalPremium;
	private Integer baseTariff;
	private double discountMultiplier;
	private double surchargeMultiplier;
	private double otherMultiplier;
	private double totalMultiplier;

	public Integer getYearlyPremium() {
		return yearlyPremium;
	}

	public void setYearlyPremium(Integer yearlyPremium) {
		this.yearlyPremium = yearlyPremium;
	}

	public Integer getBaseTariff() {
		return baseTariff;
	}

	public void setBaseTariff(Integer baseTariff) {
		this.baseTariff = baseTariff;
	}

	public double getDiscountMultiplier() {
		return discountMultiplier;
	}

	public void setDiscountMultiplier(double discountMultiplier) {
		this.discountMultiplier = discountMultiplier;
	}

	public double getSurchargeMultiplier() {
		return surchargeMultiplier;
	}

	public void setSurchargeMultiplier(double surchargeMultiplier) {
		this.surchargeMultiplier = surchargeMultiplier;
	}

	public void setOtherMultiplier(double otherMultiplier) {
		this.otherMultiplier = otherMultiplier;
	}

	public double getOtherMultiplier() {
		return otherMultiplier;
	}

	public void setTotalMultiplier(double totalMultiplier) {
		this.totalMultiplier = totalMultiplier;
	}

	public double getTotalMultiplier() {
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
