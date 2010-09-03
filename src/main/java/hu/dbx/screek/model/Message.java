package hu.dbx.screek.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.joda.time.DateTime;

public class Message {
	
	public static final int ERROR = 2;
	
	private String code;
	private int severity;
	private String description;
	private List<String> messageParams;
	private List<String> context; 
	
	public Message() {}
	
	public Message(String code, List<String> messageParams) {
		this.code = code;
		if (this.context == null) {
			this.context = new ArrayList<String>();
		} 
		this.setMessageParams(messageParams);
	}
	
	public static Message create2(String code, Date ... params ) {
		List<String> msgParams = new ArrayList<String>();
		
		for (int i = 0; i < params.length; i++) {
			
			DateTime date = new DateTime(params[i]);
			
			String dateAsString = new String(Integer.toString(date.getYear()) + "-"); 
			
			String month = new String(Integer.toString(date.getMonthOfYear()) + "-");		
			if (date.getMonthOfYear() < 10) {
				month = "0" + month;
			}
			
			String day = new String(Integer.toString(date.getDayOfMonth()));
			if (date.getDayOfMonth() < 10) {
				day = "0" + day;
			}
			dateAsString += month + day;
			
			msgParams.add(dateAsString);
		}
				
		return new Message(code, msgParams);
	}
	
	public static Message create(String code, String ... params ) {
		List<String> msgParams = new ArrayList<String>();
		
		for (int i = 0; i < params.length; i++) {
			msgParams.add(params[i]);
		}
				
		return new Message(code, msgParams);
	}

	public List<String> getMessageParams() {
		return messageParams;
	}

	public void setMessageParams(List<String> messageParams) {
		this.messageParams = messageParams;
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
		if (this.messageParams != null) {
			String finalDescription = new String(this.description);
			Iterator<String> i = this.messageParams.iterator();
			int count = 0;
			while( i.hasNext() ) {
				String param = (String) i.next(); 
				count++;
				finalDescription = finalDescription.replaceAll("%" + Integer.toString(count), param );
			}
			return finalDescription;
		}
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
