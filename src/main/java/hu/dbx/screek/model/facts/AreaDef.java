package hu.dbx.screek.model.facts;

import java.util.ArrayList;
import java.util.List;

public class AreaDef extends BaseDef {
	
	private Integer postCode;
	
	//tariffCode = 1, 2, 3 vagy 4, postCode-tól függően
	private Integer tariffCode;
	private List<Integer> postCodes = new ArrayList<Integer>(); 
	
	
	public Integer getPostCode() {
		return postCode;
	}
	
	public void setPostCode(Integer postCode) {
		this.postCode = postCode;
	}

	public void setPostCodes(List<Integer> postCodes) {
		this.postCodes = postCodes;
	}

	public List<Integer> getPostCodes() {
		return postCodes;
	}

	public void setTariffCode(Integer tariffCode) {
		this.tariffCode = tariffCode;
	}

	public Integer getTariffCode() {
		return tariffCode;
	}
	
}
