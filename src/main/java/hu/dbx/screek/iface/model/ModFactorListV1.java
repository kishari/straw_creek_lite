package hu.dbx.screek.iface.model;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;

public class ModFactorListV1 {
	private List<ModFactorV1> modfactors = new ArrayList<ModFactorV1>();
	
	@XmlElement(name = "modfactor")
	public List<ModFactorV1> getModfactors() {
		return modfactors;
	}

	public void setModfactors(List<ModFactorV1> modfactors) {
		this.modfactors = modfactors;
	}
	
}
