package hu.dbx.screek.iface.model;

import hu.dbx.screek.model.Address;
import hu.dbx.screek.model.TypeOfClosingBM;
import hu.dbx.screek.model.TypeOfInitialBM;

import java.util.Date;

public class PartnerV1 {

	private Date dateOfBirth;
	private String genderCode;
	private Address address;
	private Integer drivingLicenseSince;
	private TypeOfClosingBM closingBonusMalus;
	private TypeOfInitialBM initialBonusMalus;
	
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	
	public String getGenderCode() {
		return genderCode;
	}
	
	public void setGenderCode(String genderCode) {
		this.genderCode = genderCode;
	}
	
	public Address getAddress() {
		return address;
	}
	
	public void setAddress(Address address) {
		this.address = address;
	}
	
	public Integer getDrivingLicenseSince() {
		return drivingLicenseSince;
	}
	
	public void setDrivingLicenseSince(Integer drivingLicenseSince) {
		this.drivingLicenseSince = drivingLicenseSince;
	}
	
	public void setClosingBonusMalus(TypeOfClosingBM closingBonusMalus) {
		this.closingBonusMalus = closingBonusMalus;
	}
	
	public TypeOfClosingBM getClosingBonusMalus() {
		return closingBonusMalus;
	}

	public void setInitialBonusMalus(TypeOfInitialBM initialBonusMalus) {
		this.initialBonusMalus = initialBonusMalus;
	}

	public TypeOfInitialBM getInitialBonusMalus() {
		return initialBonusMalus;
	}
	
}
