package hu.dbx.screek.iface.model;

import hu.dbx.screek.model.Address;
import hu.dbx.screek.model.TypeOfFinalBonusMalus;
import hu.dbx.screek.model.TypeOfInitialBonusMalus;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;

public class PartnerV1 {

	private Date dateOfBirth;
	private String genderCode;
	private Address address;
	private Integer drivingLicenseSince;
	private TypeOfFinalBonusMalus finalBM;
	private TypeOfInitialBonusMalus initialBM;
	
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

	@XmlElement(name = "finalBonusMalus")
	public TypeOfFinalBonusMalus getFinalBM() {
		return finalBM;
	}

	public void setFinalBM(TypeOfFinalBonusMalus finalBM) {
		this.finalBM = finalBM;
	}

	@XmlElement(name = "initialBonusMalus")
	public TypeOfInitialBonusMalus getInitialBM() {
		return initialBM;
	}

	public void setInitialBM(TypeOfInitialBonusMalus initialBM) {
		this.initialBM = initialBM;
	}

	
}
