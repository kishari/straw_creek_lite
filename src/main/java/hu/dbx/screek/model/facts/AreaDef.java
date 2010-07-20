package hu.dbx.screek.model.facts;

public class AreaDef extends BaseDef {
	
	private Integer postCode;
	
	//tariffCode = 1, 2, 3 vagy 4, postCode-tól függően
	private Integer tariffCode; 
	
	
	public Integer getPostCode() {
		return postCode;
	}
	
	public void setPostCode(Integer postCode) {
		this.postCode = postCode;
	}

	public void setTariffCode(Integer tariffCode) {
		this.tariffCode = tariffCode;
	}

	public Integer getTariffCode() {
		return tariffCode;
	}
	
}
