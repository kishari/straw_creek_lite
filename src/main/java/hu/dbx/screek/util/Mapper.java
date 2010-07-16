package hu.dbx.screek.util;

import java.util.ArrayList;
import java.util.List;

import hu.dbx.screek.iface.assist.TariffQuoteV1;
import hu.dbx.screek.iface.model.MessageListV1;
import hu.dbx.screek.iface.model.MessageV1;
import hu.dbx.screek.iface.model.ModFactorListV1;
import hu.dbx.screek.iface.model.ModFactorV1;
import hu.dbx.screek.iface.model.PartnerV1;
import hu.dbx.screek.iface.model.VehicleV1;
import hu.dbx.screek.model.Message;
import hu.dbx.screek.model.MessageList;
import hu.dbx.screek.model.ModFactor;
import hu.dbx.screek.model.ModFactorList;
import hu.dbx.screek.model.Partner;
import hu.dbx.screek.model.Quote;
import hu.dbx.screek.model.Vehicle;

public class Mapper {
	
	public static Quote mapIn(TariffQuoteV1 tariffQuoteV1) {
		Quote q = new Quote();
		
		q.setStartDate(tariffQuoteV1.getStartDate());
		q.setStartYear(tariffQuoteV1.getStartYear());
		q.setInsuranceDuration(tariffQuoteV1.getDuration());
		
		q.setTakeOutWithCasco(tariffQuoteV1.isTakeOutWithCasco());
		q.setChildPreference(tariffQuoteV1.isChildPreference());
		q.setMkbPartner(tariffQuoteV1.isMkbPartner());
		q.setOnline(tariffQuoteV1.isOnline());
		q.setEmailGranted(tariffQuoteV1.isEmailGranted());
		q.setExtraDamageExemption(tariffQuoteV1.isExtraDamageExemption());
		q.setGroupedCollection(tariffQuoteV1.isGroupedCollection());
		
		q.setPaymentFrequencyCode(tariffQuoteV1.getPaymentFrequencyCode());
		
		q.setPartner(mapIn(tariffQuoteV1.getPartner()));
		q.setVehicle(mapIn(tariffQuoteV1.getVehicle()));
		
		q.setMessages(mapIn(tariffQuoteV1.getMessages(), q));
		q.setModfactors(mapIn(tariffQuoteV1.getModfactors(), q));
		
		return q;
	}
	
	public static Partner mapIn(PartnerV1 partnerV1) {		
		Partner p = new Partner();
		
		p.setDateOfBirth(partnerV1.getDateOfBirth());
		p.setAddress(partnerV1.getAddress());
		p.setDrivingLicenseSince(partnerV1.getDrivingLicenseSince());
		p.setGenderCode(partnerV1.getGenderCode());
		p.setFinalBM(partnerV1.getFinalBM());
		p.setInitialBM(partnerV1.getInitialBM());
		p.setModfactors(mapIn(partnerV1.getModfactors(), p));
		
		return p;
	}
	
	public static Vehicle mapIn(VehicleV1 vehicleV1) {
		Vehicle v = new Vehicle();
	
		v.setCubicCapacity(vehicleV1.getCubicCapacity());
		v.setDateOfPurchase(vehicleV1.getDateOfPurchase());
		v.setFirstPutIntoTraffic(vehicleV1.getFirstPutIntoTraffic());
		v.setMakeCode(vehicleV1.getMakeCode());
		v.setMaximumAllowedWeigth(vehicleV1.getMaximumAllowedWeigth());
		v.setMaximumNettoPower(vehicleV1.getMaximumNettoPower());
		v.setOwnWeight(vehicleV1.getOwnWeight());
		v.setSeatingCapacity(vehicleV1.getSeatingCapacity());
		v.setTypeCode(vehicleV1.getTypeCode());
		v.setUseOfVehicleCode(vehicleV1.getUseOfVehicleCode());
		
		v.setModfactors(mapIn(vehicleV1.getModfactors(), v));
		
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
		
		q.setStartDate(quote.getStartDate());
		q.setStartYear(quote.getStartYear());
		q.setDuration(quote.getInsuranceDuration());
		
		q.setTakeOutWithCasco(quote.isTakeOutWithCasco());
		q.setChildPreference(quote.isChildPreference());
		q.setMkbPartner(quote.isMkbPartner());
		q.setOnline(quote.isOnline());
		q.setEmailGranted(quote.isEmailGranted());
		q.setExtraDamageExemption(quote.isExtraDamageExemption());
		q.setGroupedCollection(quote.isGroupedCollection());
		
		q.setPaymentFrequencyCode(quote.getPaymentFrequencyCode());

		
		q.setPartner(mapOut(quote.getPartner()));
		q.setVehicle(mapOut(quote.getVehicle()));
		q.setMessages( mapOut(quote.getMessages()) );
		q.setModfactors(mapOut(quote.getModfactors()));
		
		return q;
		
	}
	
	public static PartnerV1 mapOut(Partner partner) {
		PartnerV1 p = new PartnerV1();
		
		p.setDateOfBirth(partner.getDateOfBirth());
		p.setAddress(partner.getAddress());
		p.setDrivingLicenseSince(partner.getDrivingLicenseSince());
		p.setGenderCode(partner.getGenderCode());
		p.setFinalBM(partner.getFinalBM());
		p.setInitialBM(partner.getInitialBM());
		
		p.setModfactors(mapOut(partner.getModfactors()));
		
		return p;
	}
	
	public static VehicleV1 mapOut(Vehicle vehicle) {
		VehicleV1 v = new VehicleV1();
		
		v.setCubicCapacity(vehicle.getCubicCapacity());
		v.setDateOfPurchase(vehicle.getDateOfPurchase());
		v.setFirstPutIntoTraffic(vehicle.getFirstPutIntoTraffic());
		v.setMakeCode(vehicle.getMakeCode());
		v.setMaximumAllowedWeigth(vehicle.getMaximumAllowedWeigth());
		v.setMaximumNettoPower(vehicle.getMaximumNettoPower());
		v.setOwnWeight(vehicle.getOwnWeight());
		v.setSeatingCapacity(vehicle.getSeatingCapacity());
		v.setTypeCode(vehicle.getTypeCode());
		v.setUseOfVehicleCode(vehicle.getUseOfVehicleCode());
		
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
		
		return modfactorV1;
	}

}
