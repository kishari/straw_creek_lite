package hu.dbx.screek.iface.model;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;

public class MessageListV1 {
	private List<MessageV1> messages = new ArrayList<MessageV1>();
	
	
	@XmlElement(name = "message")
	public List<MessageV1> getMessages() {
		return messages;
	}

	public void setMessages(List<MessageV1> messages) {
		this.messages = messages;
	}
	
	
}
