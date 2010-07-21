package hu.dbx.screek.model;

public class Result {
	
	private int premium;
	private int baseTariff;
	private double discountMultiplier;
	private double surchargeMultiplier;
	private double multiplier;
	
	public int getPremium() {
		return premium;
	}
	
	public void setPremium(int premium) {
		this.premium = premium;
	}
	
	public int getBaseTariff() {
		return baseTariff;
	}
	
	public void setBaseTariff(int baseTariff) {
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

	public double getMultiplier() {
		return multiplier;
	}

	public void setMultiplier(double multiplier) {
		this.multiplier = multiplier;
	}

}
