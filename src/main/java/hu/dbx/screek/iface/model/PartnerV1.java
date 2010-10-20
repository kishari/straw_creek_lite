package hu.dbx.screek.iface.model;

import java.util.Date;

public class PartnerV1 {

	private Date dateOfBirth;
	private Integer genderCode;
	private Integer postCode;
	private Integer yearOfDrivingLicense;
	
	private ModFactorListV1 modfactors = new ModFactorListV1();

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Integer getGenderCode() {
		return genderCode;
	}

	public void setGenderCode(Integer genderCode) {
		this.genderCode = genderCode;
	}

	public Integer getPostCode() {
		return postCode;
	}

	public void setPostCode(Integer postCode) {
		this.postCode = postCode;
	}

	public Integer getYearOfDrivingLicense() {
		return yearOfDrivingLicense;
	}

	public void setYearOfDrivingLicense(Integer yearOfDrivingLicense) {
		this.yearOfDrivingLicense = yearOfDrivingLicense;
	}

	public ModFactorListV1 getModfactors() {
		return modfactors;
	}

	public void setModfactors(ModFactorListV1 modfactors) {
		this.modfactors = modfactors;
	}
		
}
