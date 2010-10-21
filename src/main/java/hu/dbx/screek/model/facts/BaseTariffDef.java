package hu.dbx.screek.model.facts;

public class BaseTariffDef extends BaseDef{
	
	private String vehicleType;
	private Integer durationType;
	private Integer value;
	
	
	public String getVehicleType() {
		return vehicleType;
	}
	
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	
	public Integer getDurationType() {
		return durationType;
	}
	
	public void setDurationType(Integer durationType) {
		this.durationType = durationType;
	}
	
	public Integer getValue() {
		return value;
	}
	
	public void setValue(Integer value) {
		this.value = value;
	}

}
