package hu.dbx.screek.model;

public class Context {
	private String action;
	private Integer version;
	
	public Context(String action, Integer version) {
		this.action = action;
		this.version = version;
	}
	
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	
}
