package hu.dbx.screek.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;

public class Quote {

	private String callerId;
	private Date startDate;
	//private Date endDate;
	private Integer durationType;
	private Partner partner;
	private Vehicle vehicle;
	private Integer paymentFrequency;
	private Integer paymentMethod;
	
	private boolean takeOutWithCasco;
	private boolean childPreference;
	private boolean mkbPartner;
	private boolean online;
	private boolean emailGranted;
	private boolean extraDamageExemption;
	private boolean groupedCollection;
	private String bonusMalus;
	
	private Result result = new Result();
	private MessageList messages = new MessageList();
	private ModFactorList modfactors = new ModFactorList();

	public void setPartner(Partner partner) {
		this.partner = partner;
	}

	public Partner getPartner() {
		return partner;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public Integer getDurationType() {
		return durationType;
	}

	public void setDurationType(Integer durationType) {
		this.durationType = durationType;
	}
	
	public void setPaymentMethod(Integer paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public Integer getPaymentMethod() {
		return paymentMethod;
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

	public Integer getPaymentFrequency() {
		return paymentFrequency;
	}

	public void setPaymentFrequency(Integer paymentFrequency) {
		this.paymentFrequency = paymentFrequency;
	}

	public boolean isExtraDamageExemption() {
		return extraDamageExemption;
	}

	public void setExtraDamageExemption(boolean extraDamageExemption) {
		this.extraDamageExemption = extraDamageExemption;
	}

	public void setGroupedCollection(boolean groupedCollection) {
		this.groupedCollection = groupedCollection;
	}

	public boolean isGroupedCollection() {
		return groupedCollection;
	}
	
	@XmlElement(name = "messages")
	public MessageList getMessages() {
		return messages;
	}

	public void setMessages(MessageList messages) {
		this.messages = messages;
	}
	
	public void addMessage(Message message) {
		this.messages.getMessages().add(message);
	}
	
	@XmlElement(name = "modfactors")
	public ModFactorList getModfactors() {
		return modfactors;
	}

	public void setModfactors(ModFactorList modfactors) {
		this.modfactors = modfactors;
	}
	
	public void addModFactor(ModFactor mf) {
		this.modfactors.getModfactors().add(mf);
	}

	public void setResult(Result result) {
		this.result = result;
	}

	public Result getResult() {
		return result;
	}

	public void setBonusMalus(String bonusMalus) {
		this.bonusMalus = bonusMalus;
	}

	public String getBonusMalus() {
		return bonusMalus;
	}

	public void setCallerId(String callerId) {
		this.callerId = callerId;
	}

	public String getCallerId() {
		return callerId;
	}

	
}
