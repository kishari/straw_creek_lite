package hu.dbx.screek.model.facts;

public class TruckBaseTariffDef extends BaseDef {

	private Integer durationType;
	private Integer genderCode;
	private Integer partnerAgeMin;
	private Integer partnerAgeMax;
	private Integer allowedWeightMin;
	private Integer allowedWeightMax;
	private Integer value;
	
	
	public Integer getDurationType() {
		return durationType;
	}
	public void setDurationType(Integer durationType) {
		this.durationType = durationType;
	}
	public Integer getGenderCode() {
		return genderCode;
	}
	public void setGenderCode(Integer genderCode) {
		this.genderCode = genderCode;
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
	public void setAllowedWeightMin(Integer allowedWeightMin) {
		this.allowedWeightMin = allowedWeightMin;
	}
	public Integer getAllowedWeightMin() {
		return allowedWeightMin;
	}
	public void setAllowedWeightMax(Integer allowedWeightMax) {
		this.allowedWeightMax = allowedWeightMax;
	}
	public Integer getAllowedWeightMax() {
		return allowedWeightMax;
	}
	
}
