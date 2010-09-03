package hu.dbx.screek.model;

public class State {
	
	public enum States {
			WF_START,
			WF_VALIDATE,
			WF_CHECK_VALID,
			WF_CALCULATE,			
			WF_CLEANUP,
			WF_END,
			AGENDA_PREPROCESS_START,
			AGENDA_PREPROCESS_END,
			AGENDA_VALIDATE_START,
			AGENDA_VALIDATE_END,
			AGENDA_CALCULATE_START,
			AGENDA_CALCULATE_END,
			AGENDA_CLEANUP_START,
			AGENDA_CLEANUP_END
	}

/*
	public static final int WF_START = 0;
	public static final int WF_CHECK_VALID = 1;
	public static final int VALID_TARIFF_START = 2;
	public static final int VALID_TARIFF_END = 3;
	public static final int TARIFFENDED = 4;
*/	
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
