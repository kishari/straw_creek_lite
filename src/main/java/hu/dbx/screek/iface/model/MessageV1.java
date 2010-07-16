package hu.dbx.screek.iface.model;

import java.util.List;

public class MessageV1 {
	
	public static final int ERROR = 2;
	
	private String code;
	private int severity;
	private String description;
	private List<String> context; 
	
	public MessageV1(String code) {
		this.code = code;
	}
	
	public MessageV1() {
		
	}
	
	public int getSeverity() {
		return severity;
	}

	public void setSeverity(int severity) {
		this.severity = severity;
	}

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<String> getContext() {
		return context;
	}

	public void setContext(List<String> context) {
		this.context = context;
	}

	
}
