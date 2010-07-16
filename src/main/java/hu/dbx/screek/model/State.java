package hu.dbx.screek.model;

public class State {
	
	public enum States {
			WF_START, 
			WF_CHECK_VALID,
			WF_CLEANUP,
			WF_END,
			VALID_TARIFF_START,
			VALID_TARIFF_END,
			CALCULATE_START,
			CALCULATE_END,
			CLEANUP_START,
			CLEANUP_END
	}


	public static final int WF_START = 0;
	public static final int WF_CHECK_VALID = 1;
	public static final int VALID_TARIFF_START = 2;
	public static final int VALID_TARIFF_END = 3;
	public static final int TARIFFENDED = 4;
	
	private States state;
	
	public State(States state) {

		this.state = state;
	}

	public States getState() {
		return state;
	}

	public void setState(States state) {
		this.state = state;
	}
	
}
