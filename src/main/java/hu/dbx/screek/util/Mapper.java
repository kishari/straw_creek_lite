package hu.dbx.screek.util;

import java.util.ArrayList;
import java.util.List;

import hu.dbx.screek.iface.assist.TariffQuoteV1;
import hu.dbx.screek.iface.model.MessageListV1;
import hu.dbx.screek.iface.model.MessageV1;
import hu.dbx.screek.iface.model.ModFactorListV1;
import hu.dbx.screek.iface.model.ModFactorV1;
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
	
	public static Quote mapIn(TariffQuoteV1 tariffQuoteV1) {
		Quote q = new Quote();
		
		q.setCallerId(tariffQuoteV1.getCallerId());
		q.setStartDate(tariffQuoteV1.getStartDate());
		q.setDurationType(tariffQuoteV1.getDurationType());
		
		q.setTakeOutWithCasco(tariffQuoteV1.isTakeOutWithCasco());
		q.setChildPreference(tariffQuoteV1.isChild());
		q.setMkbPartner(tariffQuoteV1.isMkbPartner());
		q.setOnline(tariffQuoteV1.isOnline());
		q.setEmailGranted(tariffQuoteV1.isEmailGranted());
		q.setExtraDamageExemption(tariffQuoteV1.isExtraDamageExemption());
		q.setPaymentMethod(tariffQuoteV1.getPaymentMethod());
		q.setBonusMalus(tariffQuoteV1.getBonusMalus());
		
		q.setPaymentFrequency(tariffQuoteV1.getPaymentFrequency());
		
		q.setPartner(mapIn(tariffQuoteV1.getPartner()));
		q.setVehicle(mapIn(tariffQuoteV1.getVehicle()));
		
		q.setMessages(mapIn(tariffQuoteV1.getMessages(), q));
		q.setModfactors(mapIn(tariffQuoteV1.getModfactors(), q));
		
		return q;
	}
	
	private static Partner mapIn(PartnerV1 partnerV1) {		
		Partner p = new Partner();
		if (partnerV1 != null) {
			p.setDateOfBirth(partnerV1.getDateOfBirth());
			p.setPostCode(partnerV1.getPostCode());
			p.setYearOfDrivingLicense(partnerV1.getYearOfDrivingLicense());
			p.setGenderCode(partnerV1.getGenderCode());
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
			v.setDateOfFirstPutIntoTraffic(vehicleV1.getDateOfFirstPutIntoTraffic());
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
	
	public static TariffQuoteV1 mapOut(Quote quote) {
		TariffQuoteV1 q = new TariffQuoteV1();
		
		q.setCallerId(quote.getCallerId());
		q.setStartDate(quote.getStartDate());
		q.setDurationType(quote.getDurationType());
		q.setPaymentMethod(quote.getPaymentMethod());
		
		q.setTakeOutWithCasco(quote.isTakeOutWithCasco());
		q.setChild(quote.isChildPreference());
		q.setMkbPartner(quote.isMkbPartner());
		q.setOnline(quote.isOnline());
		q.setEmailGranted(quote.isEmailGranted());
		q.setExtraDamageExemption(quote.isExtraDamageExemption());
		q.setResult(mapOut(quote.getResult()));
		
		q.setBonusMalus(quote.getBonusMalus());
		
		q.setPaymentFrequency(quote.getPaymentFrequency());

		
		q.setPartner(mapOut(quote.getPartner()));
		q.setVehicle(mapOut(quote.getVehicle()));
		q.setMessages( mapOut(quote.getMessages()) );
		q.setModfactors(mapOut(quote.getModfactors()));
		
		return q;
		
	}

	private static PartnerV1 mapOut(Partner partner) {
		PartnerV1 p = new PartnerV1();
		
		p.setDateOfBirth(partner.getDateOfBirth());
		p.setPostCode(partner.getPostCode());
		p.setYearOfDrivingLicense(partner.getYearOfDrivingLicense());
		p.setGenderCode(partner.getGenderCode());
		
		p.setModfactors(mapOut(partner.getModfactors()));
		
		return p;
	}
	
	private static VehicleV1 mapOut(Vehicle vehicle) {
		VehicleV1 v = new VehicleV1();
		
		v.setCubicCapacity(vehicle.getCubicCapacity());
		v.setCarryingCapacity(vehicle.getCarryingCapacity());
		v.setDateOfPurchase(vehicle.getDateOfPurchase());
		v.setDateOfFirstPutIntoTraffic(vehicle.getDateOfFirstPutIntoTraffic());
		v.setMake(vehicle.getMake());
		v.setMaximumAllowedWeight(vehicle.getMaximumAllowedWeight());
		v.setMaximumNettoPower(vehicle.getMaximumNettoPower());
		v.setOwnWeight(vehicle.getOwnWeight());
		v.setSeatingCapacity(vehicle.getSeatingCapacity());
		v.setTypeCode(vehicle.getTypeCode());
		v.setOperationalModality(vehicle.getOperationalModality());
		
		v.setModfactors(mapOut(vehicle.getModfactors()));
		
		return v;
	}
	
	private static MessageListV1 mapOut(MessageList messages) {
		List<MessageV1> list = new ArrayList<MessageV1>();
		MessageListV1 messagesV1 = new MessageListV1();
		for (Message m : messages.getMessages()) {
			list.add( mapOut(m) );
		}
		messagesV1.setMessages(list);
		
		return messagesV1;
	}
	
	private static MessageV1 mapOut(Message message) {
		MessageV1 messageV1 = new MessageV1();
		
		messageV1.setCode(message.getCode());
		messageV1.setSeverity(message.getSeverity());
		messageV1.setDescription(message.getDescription());
		messageV1.setContext(message.getContext());
		
		return messageV1;
	}
	
	//ModFactorListet mappel
	private static ModFactorListV1 mapOut(ModFactorList modfactors) {
		List<ModFactorV1> list = new ArrayList<ModFactorV1>();
		ModFactorListV1 modfactorsv1 = new ModFactorListV1();
		
		for ( ModFactor m : modfactors.getModfactors() ) {
			list.add( mapOut(m) );
		}
		modfactorsv1.setModfactors(list);
		
		return modfactorsv1;
	}
	
	//ModFactorokat mappel
	private static ModFactorV1 mapOut(ModFactor modfactor) {
		ModFactorV1 modfactorV1 = new ModFactorV1();
		
		modfactorV1.setCode(modfactor.getCode());
		modfactorV1.setValue(modfactor.getValue());
		modfactorV1.setType(modfactor.getType());
		
		return modfactorV1;
	}
	
	private static ResultV1 mapOut(Result result) {		
		if (result != null) {
			ResultV1 resultV1 = new ResultV1();
			
			resultV1.setBaseTariff(result.getBaseTariff());
			resultV1.setMonthlyPremium(result.getMonthlyPremium());
			resultV1.setYearlyPremium(result.getYearlyPremium());
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
