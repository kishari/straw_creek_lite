package hu.dbx.screek.iface.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;

public class PartnerV1 {

	private Date dateOfBirth;
	private Integer genderCode;
	private String postCode;
	private Integer yearOfDrivingLicense;
	
	private ModFactorListV1 modfactors = new ModFactorListV1();
	
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	
	public Integer getGenderCode() {
		return genderCode;
	}
	
	public void setGenderCode(Integer genderCode) {
		this.genderCode = genderCode;
	}
	
	@XmlElement(name = "modfactors")
	public ModFactorListV1 getModfactors() {
		return modfactors;
	}

	public void setModfactors(ModFactorListV1 modfactors) {
		this.modfactors = modfactors;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setYearOfDrivingLicense(Integer yearOfDrivingLicense) {
		this.yearOfDrivingLicense = yearOfDrivingLicense;
	}

	public Integer getYearOfDrivingLicense() {
		return yearOfDrivingLicense;
	}
	
}
