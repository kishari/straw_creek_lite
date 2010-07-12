package hu.dbx.screek.model;

import java.util.Date;

public class Partner {

	private Quote quote;
	private Date dateOfBirth;
	private String genderCode;
	private Address address;
	private Integer drivingLicenseSince;
	private String closingBonusMalus;

	public void setQuote(Quote quote) {
		this.quote = quote;
	}

	public Quote getQuote() {
		return quote;
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

	public void setClosingBonusMalus(String closingBonusMalus) {
		this.closingBonusMalus = closingBonusMalus;
	}

	public String getClosingBonusMalus() {
		return closingBonusMalus;
	}
	

}
