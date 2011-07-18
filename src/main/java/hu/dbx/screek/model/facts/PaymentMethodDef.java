package hu.dbx.screek.model.facts;

public class PaymentMethodDef extends BaseDef {
	
	private String paymentMethod;
	private String description;
	

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

}
