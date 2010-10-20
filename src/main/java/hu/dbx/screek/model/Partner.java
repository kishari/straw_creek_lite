package hu.dbx.screek.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;

public class Partner {

	private Quote quote;
	private Date dateOfBirth;
	private String genderCode;
	private String postCode;
	private Integer yearOfDrivingLicense;
	
	private ModFactorList modfactors = new ModFactorList();

	
	@XmlTransient
	public Quote getQuote() {
		return quote;
	}
	
	public void setQuote(Quote quote) {
		this.quote = quote;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGenderCode() {
		return genderCode;
	}

	public void setGenderCode(String genderCode) {
		this.genderCode = genderCode;
	}

	@XmlElement(name = "modfactors")
	public ModFactorList getModfactors() {
		return modfactors;
	}

	public void setModfactors(ModFactorList modfactors) {
		this.modfactors = modfactors;
	}
	
	public void addModFactor(ModFactor mf){
		this.modfactors.getModfactors().add(mf);
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
