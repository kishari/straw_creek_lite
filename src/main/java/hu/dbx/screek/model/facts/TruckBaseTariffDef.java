package hu.dbx.screek.model.facts;

public class TruckBaseTariffDef extends BaseDef {

	private String durationType;
	private String genderCode;
	private Integer carryingCapacityMin;
	private Integer carryingCapacityMax;
	private Integer partnerAgeMin;
	private Integer partnerAgeMax;
	private Integer value;
	
	
	public String getDurationType() {
		return durationType;
	}
	public void setDurationType(String durationType) {
		this.durationType = durationType;
	}
	public String getGenderCode() {
		return genderCode;
	}
	public void setGenderCode(String genderCode) {
		this.genderCode = genderCode;
	}
	public Integer getCarryingCapacityMin() {
		return carryingCapacityMin;
	}
	public void setCarryingCapacityMin(Integer carryingCapacityMin) {
		this.carryingCapacityMin = carryingCapacityMin;
	}
	public Integer getCarryingCapacityMax() {
		return carryingCapacityMax;
	}
	public void setCarryingCapacityMax(Integer carryingCapacityMax) {
		this.carryingCapacityMax = carryingCapacityMax;
	}
	public Integer getPartnerAgeMin() {
		return partnerAgeMin;
	}
	public void setPartnerAgeMin(Integer partnerAgeMin) {
		this.partnerAgeMin = partnerAgeMin;
	}
	public Integer getPartnerAgeMax() {
		return partnerAgeMax;
	}
	public void setPartnerAgeMax(Integer partnerAgeMax) {
		this.partnerAgeMax = partnerAgeMax;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	
}
