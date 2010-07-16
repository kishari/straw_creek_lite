package hu.dbx.screek.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;

public class Partner {

	private Quote quote;
	private Date dateOfBirth;
	private String genderCode;
	private Address address;
	private Integer drivingLicenseSince;
	private TypeOfFinalBonusMalus finalBM;
	private TypeOfInitialBonusMalus initialBM;
	
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

	public TypeOfFinalBonusMalus getFinalBM() {
		return finalBM;
	}

	public void setFinalBM(TypeOfFinalBonusMalus finalBM) {
		this.finalBM = finalBM;
	}

	public TypeOfInitialBonusMalus getInitialBM() {
		return initialBM;
	}

	public void setInitialBM(TypeOfInitialBonusMalus initialBM) {
		this.initialBM = initialBM;
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
	
}
