package hu.dbx.screek.model.facts;

public class BaseTariffDef extends BaseDef{
	
	private Integer vehicleType;
	private String durationType;
	private Integer value;
	
	
	public Integer getVehicleType() {
		return vehicleType;
	}
	
	public void setVehicleType(Integer vehicleType) {
		this.vehicleType = vehicleType;
	}
	
	public String getDurationType() {
		return durationType;
	}
	
	public void setDurationType(String durationType) {
		this.durationType = durationType;
	}
	
	public Integer getValue() {
		return value;
	}
	
	public void setValue(Integer value) {
		this.value = value;
	}

}
