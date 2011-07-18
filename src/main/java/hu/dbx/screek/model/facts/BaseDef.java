package hu.dbx.screek.model.facts;

import java.util.Date;

public class BaseDef {
	
	private Date validFrom;
	private Date validTo;
	private boolean valid;
	
	public Date getValidFrom() {
		return validFrom;
	}
	
	public void setValidFrom(Date validFrom) {
		this.validFrom = validFrom;
	}
	
	public Date getValidTo() {
		return validTo;
	}
	
	public void setValidTo(Date validTo) {
		this.validTo = validTo;
	}
	
	public boolean isValid(Date startDate) {
		if (startDate != null) {
			setValid( firstDateIsBiggerOrEqualsThanSecondDate(startDate, this.validFrom) &&
					  firstDateIsSmallerOrEqualsThanSecondDate(startDate, this.validTo) );
		}
		else {
			setValid(false);
		}
		return valid;
	}
	
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
	private boolean firstDateIsBiggerOrEqualsThanSecondDate(Date q, Date v) {
		return ( q.after(v) || q.equals(v) );
	}

	private boolean firstDateIsSmallerOrEqualsThanSecondDate(Date q, Date v) {
		return ( q.before(v) || q.equals(v) );
	}
	
}
