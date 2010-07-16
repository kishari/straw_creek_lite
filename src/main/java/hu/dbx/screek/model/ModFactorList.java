package hu.dbx.screek.model;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;

public class ModFactorList {
	private List<ModFactor> modfactors = new ArrayList<ModFactor>();
	
	@XmlElement(name = "modfactor")
	public List<ModFactor> getModfactors() {
		return modfactors;
	}

	public void setModfactors(List<ModFactor> modfactors) {
		this.modfactors = modfactors;
	}
	
}
