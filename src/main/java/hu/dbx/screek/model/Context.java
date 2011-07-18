package hu.dbx.screek.model;

public class Context {
	private String action;
	private String version;
	
	public Context(String action, String version) {
		this.action = action;
		this.version = version;
	}
	
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	
}
