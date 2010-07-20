package hu.dbx.screek.iface.model;

import hu.dbx.screek.model.TypeOfFinalBonusMalus;
import hu.dbx.screek.model.TypeOfInitialBonusMalus;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;

public class PartnerV1 {

	private Date dateOfBirth;
	private String genderCode;
	private Integer postCode;
	private Integer yearOfDrivingLicense;
	
	private ModFactorListV1 modfactors = new ModFactorListV1();
	
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
	
	@XmlElement(name = "modfactors")
	public ModFactorListV1 getModfactors() {
		return modfactors;
	}

	public void setModfactors(ModFactorListV1 modfactors) {
		this.modfactors = modfactors;
	}

	public void setPostCode(Integer postCode) {
		this.postCode = postCode;
	}

	public Integer getPostCode() {
		return postCode;
	}

	public void setYearOfDrivingLicense(Integer yearOfDrivingLicense) {
		this.yearOfDrivingLicense = yearOfDrivingLicense;
	}

	public Integer getYearOfDrivingLicense() {
		return yearOfDrivingLicense;
	}
	
}
