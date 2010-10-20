package hu.dbx.screek.iface.model;

import java.util.Date;

public class PartnerV1 {
	private Integer genderCode;
	private String name;
	private String phone;
	private String mobilePhone;
	private String email;
	private String nationality;
	
	private Date dateOfBirth;
	private String placeOfBirth;
	private String birthName;
	private String mothersName;
	
	
	private String postCode;
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

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
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
