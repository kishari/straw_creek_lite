package hu.dbx.screek.model.facts;

public class AreaDef extends BaseDef {
	
	private Integer postCode;
	
	//areaCode = 1, 2, 3 vagy 4, postCode-tól függően
	private Integer areaCode; 
	
	public Integer getPostCode() {
		return postCode;
	}
	
	public void setPostCode(Integer postCode) {
		this.postCode = postCode;
	}

	public void setAreaCode(Integer areaCode) {
		this.areaCode = areaCode;
	}

	public Integer getAreaCode() {
		return areaCode;
	}

	
}
