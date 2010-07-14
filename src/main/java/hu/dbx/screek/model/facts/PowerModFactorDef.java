package hu.dbx.screek.model.facts;

public class PowerModFactorDef extends BaseDef {
	
	private String makeCode;
	private Double[] modfactors = new Double[11];
	
	public String getMakeCode() {
		return makeCode;
	}

	public void setMakeCode(String makeCode) {
		this.makeCode = makeCode;
	}

	public Double[] getModfactors() {
		return modfactors;
	}

	public void setModfactors(Double[] modfactors) {
		this.modfactors = modfactors;
	}

}
