package hu.dbx.screek.iface.assist;

import hu.dbx.screek.iface.model.*;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;


public class TariffQuoteV1 {
	
	private Integer startYear;
	private Date startDate;
	private String durationType;
	private PartnerV1 partner;
	private VehicleV1 vehicle;
	private String paymentFrequency;
	private String paymentMethod;
	
	//módosító paraméterek
	private boolean takeOutWithCasco;
	private boolean childPreference;
	private boolean mkbPartner;
	private boolean online;
	private boolean emailGranted;
	private boolean extraDamageExemption;
	
	private ResultV1 result;
	private MessageListV1 messages = new MessageListV1();
	private ModFactorListV1 modfactors = new ModFactorListV1();
	
	
	public Integer getStartYear() {
		return startYear;
	}
	
	public void setStartYear(Integer startYear) {
		this.startYear = startYear;
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public PartnerV1 getPartner() {
		return partner;
	}
	
	public void setPartner(PartnerV1 partner) {
		this.partner = partner;
	}
	
	public VehicleV1 getVehicle() {
		return vehicle;
	}
	
	public void setVehicle(VehicleV1 vehicle) {
		this.vehicle = vehicle;
	}

	public String getDurationType() {
		return durationType;
	}

	public void setDurationType(String durationType) {
		this.durationType = durationType;
	}

	public boolean isTakeOutWithCasco() {
		return takeOutWithCasco;
	}

	public void setTakeOutWithCasco(boolean takeOutWithCasco) {
		this.takeOutWithCasco = takeOutWithCasco;
	}

	public boolean isChildPreference() {
		return childPreference;
	}

	public void setChildPreference(boolean childPreference) {
		this.childPreference = childPreference;
	}

	public boolean isMkbPartner() {
		return mkbPartner;
	}

	public void setMkbPartner(boolean mkbPartner) {
		this.mkbPartner = mkbPartner;
	}

	public boolean isOnline() {
		return online;
	}

	public void setOnline(boolean online) {
		this.online = online;
	}

	public boolean isEmailGranted() {
		return emailGranted;
	}

	public void setEmailGranted(boolean emailGranted) {
		this.emailGranted = emailGranted;
	}

	public String getPaymentFrequency() {
		return paymentFrequency;
	}

	public void setPaymentFrequency(String paymentFrequency) {
		this.paymentFrequency = paymentFrequency;
	}

	public boolean isExtraDamageExemption() {
		return extraDamageExemption;
	}

	public void setExtraDamageExemption(boolean extraDamageExemption) {
		this.extraDamageExemption = extraDamageExemption;
	}
	
	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public void addMessage(MessageV1 message) {
		this.messages.getMessages().add(message);
	}
	
	@XmlElement(name = "messages")
	public MessageListV1 getMessages() {
		return messages;
	}

	public void setMessages(MessageListV1 messages) {
		this.messages = messages;
	}

	public ModFactorListV1 getModfactors() {
		return modfactors;
	}

	public void setModfactors(ModFactorListV1 modfactors) {
		this.modfactors = modfactors;
	}

	public void setResult(ResultV1 result) {
		this.result = result;
	}

	public ResultV1 getResult() {
		return result;
	}

	
	
}
