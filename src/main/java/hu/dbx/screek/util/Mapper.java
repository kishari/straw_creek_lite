package hu.dbx.screek.util;

import java.util.ArrayList;
import java.util.List;

import hu.dbx.screek.iface.assist.QuoteV1;
import hu.dbx.screek.iface.assist.TariffQuoteV1;
import hu.dbx.screek.iface.assist.TariffQuoteV2;
import hu.dbx.screek.iface.model.MessageListV1;
import hu.dbx.screek.iface.model.MessageV1;
import hu.dbx.screek.iface.model.ModFactorListV1;
import hu.dbx.screek.iface.model.ModFactorV1;
import hu.dbx.screek.iface.model.PartnerThinV1;
import hu.dbx.screek.iface.model.PartnerV1;
import hu.dbx.screek.iface.model.ResultV1;
import hu.dbx.screek.iface.model.VehicleV1;
import hu.dbx.screek.model.Message;
import hu.dbx.screek.model.MessageList;
import hu.dbx.screek.model.ModFactor;
import hu.dbx.screek.model.ModFactorList;
import hu.dbx.screek.model.Partner;
import hu.dbx.screek.model.Quote;
import hu.dbx.screek.model.Result;
import hu.dbx.screek.model.Vehicle;

public class Mapper {
	
	private static String int2String(Integer value) {		
		if (value != null) {
			return Integer.toString(value);
		}
		return null;
	}
	
	private static Integer string2Int(String value) {		
		if (value != null && "".equals(value)) {
			return Integer.valueOf(value);
		}
		return null;
	}

	
	
	public static Quote mapIn(TariffQuoteV1 tariffQuote) {
		Quote q = new Quote();
		
		q.setCallerId(tariffQuote.getCallerId());
		q.setStartDate(tariffQuote.getStartDate());

		q.setDurationType(tariffQuote.getDurationType());
		
		q.setTakeOutWithCasco(tariffQuote.isTakeOutWithCasco());
		q.setChildPreference(tariffQuote.isChild());
		q.setMkbPartner(tariffQuote.isMkbPartner());
		q.setOnline(tariffQuote.isOnline());
		q.setEmailGranted(tariffQuote.isEmailGranted());
		q.setExtraDamageExemption(tariffQuote.isExtraDamageExemption());
		q.setPaymentMethod(tariffQuote.getPaymentMethod());
		q.setBonusMalus(tariffQuote.getBonusMalus());
		
		q.setPaymentFrequency(tariffQuote.getPaymentFrequency());
		
		q.setPartner(mapIn(tariffQuote.getPartner()));
		q.setVehicle(mapIn(tariffQuote.getVehicle()));
		
		q.setMessages(mapIn(tariffQuote.getMessages(), q));
		q.setModfactors(mapIn(tariffQuote.getModfactors(), q));
		
		return q;
	}
	
	public static Quote mapIn(TariffQuoteV2 tariffQuote) {
		Quote q = new Quote();
		
		q.setCallerId(tariffQuote.getCallerId());
		q.setStartDate(tariffQuote.getStartDate());

		q.setDurationType(tariffQuote.getDurationType());
		
		q.setTakeOutWithCasco(tariffQuote.isTakeOutWithCasco());
		q.setChildPreference(tariffQuote.isChild());
		q.setMkbPartner(tariffQuote.isMkbPartner());
		q.setOnline(tariffQuote.isOnline());
		q.setEmailGranted(tariffQuote.isEmailGranted());
		q.setExtraDamageExemption(tariffQuote.isExtraDamageExemption());
		q.setPaymentMethod(tariffQuote.getPaymentMethod());
		q.setBonusMalus(tariffQuote.getBonusMalus());
		
		q.setPaymentFrequency(tariffQuote.getPaymentFrequency());
		
		q.setPartner(mapIn(tariffQuote.getPartner()));
		q.setVehicle(mapIn(tariffQuote.getVehicle()));
		
		q.setMessages(mapIn(tariffQuote.getMessages(), q));
		q.setModfactors(mapIn(tariffQuote.getModfactors(), q));
		
		return q;
	}
	
	//Ajánlatot mappel
	public static Quote mapIn(QuoteV1 approveQuote) {
		Quote q = new Quote();
		
		q.setCallerId(approveQuote.getCallerId());
		q.setStartDate(approveQuote.getStartDate());

		q.setDurationType(approveQuote.getDurationType());
		
		q.setTakeOutWithCasco(approveQuote.isTakeOutWithCasco());
		q.setChildPreference(approveQuote.isChild());
		q.setMkbPartner(approveQuote.isMkbPartner());
		q.setOnline(approveQuote.isOnline());
		q.setEmailGranted(approveQuote.isEmailGranted());
		q.setExtraDamageExemption(approveQuote.isExtraDamageExemption());
		q.setPaymentMethod(approveQuote.getPaymentMethod());
		q.setBonusMalus(approveQuote.getBonusMalus());
		
		q.setPaymentFrequency(approveQuote.getPaymentFrequency());
		
		q.setPartner(mapIn(approveQuote.getPartner()));
		q.setVehicle(mapIn(approveQuote.getVehicle()));
		
		q.setMessages(mapIn(approveQuote.getMessages(), q));
		q.setModfactors(mapIn(approveQuote.getModfactors(), q));
		
		return q;
	}
	
	private static Partner mapIn(PartnerThinV1 partnerV1) {		
		Partner p = new Partner();
		if (partnerV1 != null) {
			p.setDateOfBirth(partnerV1.getDateOfBirth());
			p.setPostCode(partnerV1.getPostCode());
			p.setYearOfDrivingLicense(partnerV1.getYearOfDrivingLicense());
			
			if (partnerV1.getGenderCode() != null && partnerV1.getGenderCode() == 0) { // 0 genderCode-ot null-nak tekintjük
				partnerV1.setGenderCode(null);
			}
			
			p.setGenderCode(int2String(partnerV1.getGenderCode()));
			p.setModfactors(mapIn(partnerV1.getModfactors(), p));
		}
		return p;
	}
	
	private static Partner mapIn(PartnerV1 partnerV1) {		
		Partner p = new Partner();
		if (partnerV1 != null) {
			p.setDateOfBirth(partnerV1.getDateOfBirth());
			p.setPostCode(partnerV1.getPostCode());
			p.setYearOfDrivingLicense(partnerV1.getYearOfDrivingLicense());
			p.setGenderCode(int2String(partnerV1.getGenderCode()));
			p.setModfactors(mapIn(partnerV1.getModfactors(), p));
		}
		return p;
	}
	
	private static Vehicle mapIn(VehicleV1 vehicleV1) {
		Vehicle v = new Vehicle();
		if (vehicleV1 != null) {
			v.setCubicCapacity(vehicleV1.getCubicCapacity());
			v.setCarryingCapacity(vehicleV1.getCarryingCapacity());
			v.setDateOfPurchase(vehicleV1.getDateOfPurchase());
			v.setYearOfProduction(vehicleV1.getYearOfProduction());
			v.setMake(vehicleV1.getMake());
			v.setMaximumAllowedWeight(vehicleV1.getMaximumAllowedWeight());
			v.setMaximumNettoPower(vehicleV1.getMaximumNettoPower());
			v.setOwnWeight(vehicleV1.getOwnWeight());
			v.setSeatingCapacity(vehicleV1.getSeatingCapacity());
			v.setTypeCode(vehicleV1.getTypeCode());
			v.setOperationalModality(vehicleV1.getOperationalModality());
		
			v.setModfactors(mapIn(vehicleV1.getModfactors(), v));
		}
		return v;
	}
		
	//MessageListet mappel
	private static MessageList mapIn(MessageListV1 messagesV1, Quote quote) {
		List<Message> list = new ArrayList<Message>();
		MessageList messages = new MessageList();
		for (MessageV1 m : messagesV1.getMessages()) {
			list.add(mapIn(m, quote));
		}
		messages.setMessages(list);
		
		return messages;
	}
	
	//Message-ket mappel
	private static Message mapIn(MessageV1 messageV1, Quote quote) {
		Message message = new Message();
		
		message.setCode(messageV1.getCode());
		message.setSeverity(messageV1.getSeverity());
		message.setDescription(messageV1.getDescription());
		message.setContext(messageV1.getContext());
		
		return message;
	}
	
	//ModFactorListet mappel
	private static ModFactorList mapIn(ModFactorListV1 modfactorsV1, Object owner) {
		List<ModFactor> list = new ArrayList<ModFactor>();
		ModFactorList modfactors = new ModFactorList();
		
		for ( ModFactorV1 m : modfactorsV1.getModfactors()) {
			list.add(mapIn(m, owner));
		}
		modfactors.setModfactors(list);
		
		return modfactors;
	}
	
	//ModFactorokat mappel
	private static ModFactor mapIn(ModFactorV1 modfactorV1, Object owner) {
		ModFactor modfactor = new ModFactor();
		
		modfactor.setCode(modfactorV1.getCode());
		modfactor.setValue(modfactorV1.getValue());
		modfactor.setType(modfactorV1.getType());
		
		if (owner instanceof Quote) {
			modfactor.setQuote((Quote)owner);			
		} 
		else if (owner instanceof Partner){
			modfactor.setPartner((Partner)owner);
		}
		else {
			modfactor.setVehicle((Vehicle)owner);
		}
		
		return modfactor;
	}
	
	/********************************************
	 * 				mapOut
	 *******************************************/
	
	public static TariffQuoteV1 mapOutV1(Quote quote) {
		TariffQuoteV1 q = new TariffQuoteV1();
		
		q.setCallerId(quote.getCallerId());
		q.setStartDate(quote.getStartDate());
		//q.setEndDate(quote.getEndDate());
		q.setDurationType(quote.getDurationType());
		q.setPaymentMethod(quote.getPaymentMethod());
		q.setPaymentFrequency(quote.getPaymentFrequency());
		
		q.setTakeOutWithCasco(quote.isTakeOutWithCasco());
		q.setChild(quote.isChildPreference());
		q.setMkbPartner(quote.isMkbPartner());
		q.setOnline(quote.isOnline());
		q.setEmailGranted(quote.isEmailGranted());
		q.setExtraDamageExemption(quote.isExtraDamageExemption());
		q.setResult(mapOutV1(quote.getResult()));
		
		q.setBonusMalus(quote.getBonusMalus());
		
		q.setPartner(mapOutV1(quote.getPartner()));
		q.setVehicle(mapOutV1(quote.getVehicle()));
		q.setMessages( mapOutV1(quote.getMessages()) );
		q.setModfactors(mapOutV1(quote.getModfactors()));
		
		return q;
		
	}
	
	public static TariffQuoteV2 mapOutV2(Quote quote) {
		TariffQuoteV2 q = new TariffQuoteV2();
		
		q.setCallerId(quote.getCallerId());
		q.setStartDate(quote.getStartDate());
		//q.setEndDate(quote.getEndDate());
		q.setDurationType(quote.getDurationType());
		q.setPaymentMethod(quote.getPaymentMethod());
		q.setPaymentFrequency(quote.getPaymentFrequency());
		
		q.setTakeOutWithCasco(quote.isTakeOutWithCasco());
		q.setChild(quote.isChildPreference());
		q.setMkbPartner(quote.isMkbPartner());
		q.setOnline(quote.isOnline());
		q.setEmailGranted(quote.isEmailGranted());
		q.setExtraDamageExemption(quote.isExtraDamageExemption());
		q.setResult(mapOutV1(quote.getResult()));
		
		q.setBonusMalus(quote.getBonusMalus());
		
		q.setPartner(mapOutV1(quote.getPartner()));
		q.setVehicle(mapOutV1(quote.getVehicle()));
		q.setMessages( mapOutV1(quote.getMessages()) );
		q.setModfactors(mapOutV1(quote.getModfactors()));
		
		return q;
		
	}
	
	public static QuoteV1 mapOutApproveV1(Quote quote) {
		QuoteV1 q = new QuoteV1();
		
		q.setCallerId(quote.getCallerId());
		q.setStartDate(quote.getStartDate());
		//q.setEndDate(quote.getEndDate());
		q.setDurationType(quote.getDurationType());
		q.setPaymentMethod(quote.getPaymentMethod());
		q.setPaymentFrequency(quote.getPaymentFrequency());
		
		q.setTakeOutWithCasco(quote.isTakeOutWithCasco());
		q.setChild(quote.isChildPreference());
		q.setMkbPartner(quote.isMkbPartner());
		q.setOnline(quote.isOnline());
		q.setEmailGranted(quote.isEmailGranted());
		q.setExtraDamageExemption(quote.isExtraDamageExemption());
		q.setResult(mapOutV1(quote.getResult()));
		
		q.setBonusMalus(quote.getBonusMalus());
		
		q.setPartner(mapOutApproveV1(quote.getPartner()));
		q.setVehicle(mapOutV1(quote.getVehicle()));
		q.setMessages( mapOutV1(quote.getMessages()) );
		q.setModfactors(mapOutV1(quote.getModfactors()));
		
		return q;
	}

	private static PartnerThinV1 mapOutV1(Partner partner) {
		PartnerThinV1 p = new PartnerThinV1();
		
		p.setDateOfBirth(partner.getDateOfBirth());
		p.setPostCode(partner.getPostCode());
		p.setYearOfDrivingLicense(partner.getYearOfDrivingLicense());
		p.setGenderCode(string2Int(partner.getGenderCode()));
		
		p.setModfactors(mapOutV1(partner.getModfactors()));
		
		return p;
	}
	
	private static PartnerV1 mapOutApproveV1(Partner partner) {
		PartnerV1 p = new PartnerV1();
		
		p.setDateOfBirth(partner.getDateOfBirth());
		p.setPostCode(partner.getPostCode());
		p.setYearOfDrivingLicense(partner.getYearOfDrivingLicense());
		p.setGenderCode(string2Int(partner.getGenderCode()));
		
		p.setModfactors(mapOutV1(partner.getModfactors()));
		
		return p;
	}
	
	private static VehicleV1 mapOutV1(Vehicle vehicle) {
		VehicleV1 v = new VehicleV1();
		
		v.setCubicCapacity(vehicle.getCubicCapacity());
		v.setCarryingCapacity(vehicle.getCarryingCapacity());
		v.setDateOfPurchase(vehicle.getDateOfPurchase());
		v.setYearOfProduction(vehicle.getYearOfProduction());
		v.setMake(vehicle.getMake());
		v.setMaximumAllowedWeight(vehicle.getMaximumAllowedWeight());
		v.setMaximumNettoPower(vehicle.getMaximumNettoPower());
		v.setOwnWeight(vehicle.getOwnWeight());
		v.setSeatingCapacity(vehicle.getSeatingCapacity());
		v.setTypeCode(vehicle.getTypeCode());
		v.setOperationalModality(vehicle.getOperationalModality());
		
		v.setModfactors(mapOutV1(vehicle.getModfactors()));
		
		return v;
	}
	
	private static MessageListV1 mapOutV1(MessageList messages) {
		List<MessageV1> list = new ArrayList<MessageV1>();
		MessageListV1 messagesV1 = new MessageListV1();
		for (Message m : messages.getMessages()) {
			list.add( mapOutV1(m) );
		}
		messagesV1.setMessages(list);
		
		return messagesV1;
	}
	
	private static MessageV1 mapOutV1(Message message) {
		MessageV1 messageV1 = new MessageV1();
		
		messageV1.setCode(message.getCode());
		messageV1.setSeverity(message.getSeverity());
		messageV1.setDescription(message.getDescription());
		messageV1.setContext(message.getContext());
		
		return messageV1;
	}
	
	//ModFactorListet mappel
	private static ModFactorListV1 mapOutV1(ModFactorList modfactors) {
		List<ModFactorV1> list = new ArrayList<ModFactorV1>();
		ModFactorListV1 modfactorsv1 = new ModFactorListV1();
		
		for ( ModFactor m : modfactors.getModfactors() ) {
			list.add( mapOutV1(m) );
		}
		modfactorsv1.setModfactors(list);
		
		return modfactorsv1;
	}
	
	//ModFactorokat mappel
	private static ModFactorV1 mapOutV1(ModFactor modfactor) {
		ModFactorV1 modfactorV1 = new ModFactorV1();
		
		modfactorV1.setCode(modfactor.getCode());
		modfactorV1.setValue(modfactor.getValue());
		modfactorV1.setType(modfactor.getType());
		
		return modfactorV1;
	}
	
	private static ResultV1 mapOutV1(Result result) {		
		if (result != null) {
			ResultV1 resultV1 = new ResultV1();
			
			resultV1.setBaseTariff(result.getBaseTariff());
			//resultV1.setMonthlyPremium(result.getMonthlyPremium());
			resultV1.setYearlyPremium(result.getYearlyPremium());
			resultV1.setTotalPremium(result.getTotalPremium());
			resultV1.setInstallmentPremium(result.getInstallmentPremium());
			resultV1.setOtherMultiplier(result.getOtherMultiplier());
			resultV1.setDiscountMultiplier(result.getDiscountMultiplier());
			resultV1.setSurchargeMultiplier(result.getSurchargeMultiplier());
			resultV1.setTotalMultiplier(result.getTotalMultiplier());
			
			return resultV1;
		}
		else 
			return null;
	}

}
