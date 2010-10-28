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
	private String paymentFrequency;
	private String paymentMethod;
	
	private boolean takeOutWithMKBBCasco;
	private boolean nonMKBBCasco;
	private boolean childPreference;
	private boolean mkbPartner;
	private boolean online;
	private boolean emailGranted;
	private boolean extraClaimFree;
	private boolean groupedCollection;
	private boolean marketingPartner;
	private boolean campaign; //kampány kedvezmény
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
	
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public boolean isTakeOutWithMKBBCasco() {
		return takeOutWithMKBBCasco;
	}

	public void setTakeOutWithMKBBCasco(boolean takeOutWithMKBBCasco) {
		this.takeOutWithMKBBCasco = takeOutWithMKBBCasco;
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

	public void setNonMKBBCasco(boolean nonMKBBCasco) {
		this.nonMKBBCasco = nonMKBBCasco;
	}

	public boolean isNonMKBBCasco() {
		return nonMKBBCasco;
	}

	public void setMarketingPartner(boolean marketingPartner) {
		this.marketingPartner = marketingPartner;
	}

	public boolean isMarketingPartner() {
		return marketingPartner;
	}

	public void setExtraClaimFree(boolean extraClaimFree) {
		this.extraClaimFree = extraClaimFree;
	}

	public boolean isExtraClaimFree() {
		return extraClaimFree;
	}

	public void setCampaign(boolean campaign) {
		this.campaign = campaign;
	}

	public boolean isCampaign() {
		return campaign;
	}

	
}
