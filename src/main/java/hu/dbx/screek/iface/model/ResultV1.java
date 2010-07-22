package hu.dbx.screek.iface.model;

public class ResultV1 {
	private Integer monthlyPremium;
	private Integer yearlyPremium;
	private Integer baseTariff;
	private double discountMultiplier;
	private double surchargeMultiplier;
	private double otherMultiplier;
	private double totalMultiplier;
	
	

	public Integer getBaseTariff() {
		return baseTariff;
	}
	public void setBaseTariff(Integer baseTariff) {
		this.baseTariff = baseTariff;
	}
	public void setDiscountMultiplier(double discountMultiplier) {
		this.discountMultiplier = discountMultiplier;
	}
	public double getDiscountMultiplier() {
		return discountMultiplier;
	}
	public void setSurchargeMultiplier(double surchargeMultiplier) {
		this.surchargeMultiplier = surchargeMultiplier;
	}
	public double getSurchargeMultiplier() {
		return surchargeMultiplier;
	}

	public void setMonthlyPremium(Integer monthlyPremium) {
		this.monthlyPremium = monthlyPremium;
	}
	public Integer getMonthlyPremium() {
		return monthlyPremium;
	}
	public void setYearlyPremium(Integer yearlyPremium) {
		this.yearlyPremium = yearlyPremium;
	}
	public Integer getYearlyPremium() {
		return yearlyPremium;
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
	
	
}
