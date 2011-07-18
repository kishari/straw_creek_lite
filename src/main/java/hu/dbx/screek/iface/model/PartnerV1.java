package hu.dbx.screek.iface.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;

public class PartnerV1 {

	private Date dateOfBirth;
	private Integer genderCode;
	private String postCode;
	private Integer yearOfDrivingLicense;
	private boolean teacher;
	private boolean publicEmployee; //Közalkalmazott
	private boolean governmentEmployee; //köztisztviselő
	private boolean entrepreneur; //kisvállalkozó
	private boolean gerHunCCMember;//német-magyar ipari kamara tag
	
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

	public void setTeacher(boolean teacher) {
		this.teacher = teacher;
	}

	public boolean isTeacher() {
		return teacher;
	}

	public void setGovernmentEmployee(boolean governmentEmployee) {
		this.governmentEmployee = governmentEmployee;
	}

	public boolean isGovernmentEmployee() {
		return governmentEmployee;
	}

	public void setPublicEmployee(boolean publicEmployee) {
		this.publicEmployee = publicEmployee;
	}

	public boolean isPublicEmployee() {
		return publicEmployee;
	}

	public void setEntrepreneur(boolean entrepreneur) {
		this.entrepreneur = entrepreneur;
	}

	public boolean isEntrepreneur() {
		return entrepreneur;
	}

	public void setGerHunCCMember(boolean gerHunCCMember) {
		this.gerHunCCMember = gerHunCCMember;
	}

	public boolean isGerHunCCMember() {
		return gerHunCCMember;
	}
	
}
