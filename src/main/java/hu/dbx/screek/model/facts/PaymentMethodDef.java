package hu.dbx.screek.model.facts;

public class PaymentMethodDef extends BaseDef {
	
	private Integer paymentMethod;
	private String description;
	

	public void setPaymentMethod(Integer paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public Integer getPaymentMethod() {
		return paymentMethod;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

}
