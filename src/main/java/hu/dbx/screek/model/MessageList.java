package hu.dbx.screek.model;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;

public class MessageList {
	private List<Message> messages = new ArrayList<Message>();
	
	
	@XmlElement(name = "message")
	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}
	
	
}
