package hu.dbx.screek.util;

import hu.dbx.screek.iface.assist.TariffQuoteV1;
import hu.dbx.screek.iface.model.PartnerV1;
import hu.dbx.screek.iface.model.VehicleV1;
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
		
		return v;
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
		
		return v;
	}

}
