package hu.dbx.screek.util;

import hu.dbx.screek.model.facts.*;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.List;

import org.apache.commons.pool.BasePoolableObjectFactory;
import org.drools.KnowledgeBase;
import org.drools.KnowledgeBaseFactory;
import org.drools.runtime.Environment;
import org.drools.runtime.KnowledgeSessionConfiguration;
import org.drools.runtime.StatefulKnowledgeSession;

public class KnowledgeSessionFactory extends BasePoolableObjectFactory {

	private KnowledgeBase knowledgeBase;
	
	private String csvPath;

	@Override
	public Object makeObject() throws Exception {
		KnowledgeSessionConfiguration config = KnowledgeBaseFactory.newKnowledgeSessionConfiguration();
		Environment env = KnowledgeBaseFactory.newEnvironment();
		config.setProperty("drools.keepReference", "false");
		StatefulKnowledgeSession sess = knowledgeBase.newStatefulKnowledgeSession(config, env);
		addFacts(sess);
//		sess.addEventListener( new AgendaLogger());
		return sess;
	}
	
	private void addFacts(StatefulKnowledgeSession sess) throws Exception {
		addFacts(sess, MakeDef.class, new String[] {"make", "makeCode", "validFrom", "validTo"}, getReaderFor("MakeDef"));
		addFacts(sess, OtherMakeDef.class, new String[] {"make", "makeCode", "validFrom", "validTo"}, getReaderFor("OtherMakeDef"));
		addFacts(sess, ModFactorDef.class, new String[] {"modfactorType", "description", "value", "validFrom", "validTo"}, getReaderFor("ModFactorDef"));
		addFacts(sess, PowerModFactorDef.class, new String[] {"makeCode", "powerMin", "powerMax", "value", "validFrom", "validTo"}, getReaderFor("PowerModFactorDef"));
		addFacts(sess, CubicCapacityModFactorDef.class, new String[] {"capacityMin", "capacityMax", "value", "validFrom", "validTo"}, getReaderFor("CubicCapacityModFactorDef"));
		addFacts(sess, DrivingLicenseModFactorDef.class, new String[] {"sinceMin", "sinceMax", "value", "validFrom", "validTo"}, getReaderFor("DrivingLicenseModFactorDef"));
		addFacts(sess, LegalModFactorDef.class, new String[] {"areaCode", "value", "validFrom", "validTo"}, getReaderFor("LegalModFactorDef"));
		addFacts(sess, PartnerAgeModFactorDef.class, new String[] {"areaCode", "ageMin", "ageMax", "value", "validFrom", "validTo"}, getReaderFor("PartnerAgeModFactorDef"));
		addFacts(sess, VehicleAgeModFactorDef.class, new String[] {"ageMin", "ageMax", "value", "validFrom", "validTo"}, getReaderFor("VehicleAgeModFactorDef"));
		addFacts(sess, BonusMalusModFactorDef.class, new String[] {"bonusMalus", "value", "validFrom", "validTo"}, getReaderFor("BonusMalusModFactorDef"));
		addFacts(sess, PaymentFreqModFactorDef.class, new String[] {"frequencyCode", "value", "validFrom", "validTo"}, getReaderFor("PaymentFreqModFactorDef"));
		addFacts(sess, PaymentFreqDef.class, new String[] {"frequencyCode", "installmentDivisor", "description", "validFrom", "validTo"}, getReaderFor("PaymentFreqDef"));
		addFacts(sess, AreaDef.class, new String[] {"postCode", "areaCode", "validFrom", "validTo"}, getReaderFor("AreaDef"));
		addFacts(sess, VehicleTypeDef.class, new String[] {"typeCode", "description", "constantName", "bonusMalusValid", "validFrom", "validTo"}, getReaderFor("VehicleTypeDef"));
		addFacts(sess, DurationTypeDef.class, new String[] {"durationType", "description", "validFrom", "validTo"}, getReaderFor("DurationTypeDef"));
		addFacts(sess, OperationalModalityDef.class, new String[] {"operationalModality", "description", "validFrom", "validTo"}, getReaderFor("OperationalModalityDef"));
		addFacts(sess, PaymentMethodDef.class, new String[] {"paymentMethod", "description", "validFrom", "validTo"}, getReaderFor("PaymentMethodDef"));
		addFacts(sess, GenderDef.class, new String[] {"genderCode", "description", "validFrom", "validTo"}, getReaderFor("GenderDef"));
		addFacts(sess, BaseTariffDef.class, new String[] {"vehicleType", "durationType", "value", "validFrom", "validTo"}, getReaderFor("BaseTariffDef"));
		addFacts(sess, MotorBikeBaseTariffDef.class, new String[] {"durationType", "powerMin", "powerMax", "value", "validFrom", "validTo"}, getReaderFor("MotorBikeBaseTariffDef"));
		addFacts(sess, AutoBusBaseTariffDef.class, new String[] {"durationType", "seatingCapacityMin", "seatingCapacityMax", "value", "validFrom", "validTo"}, getReaderFor("AutoBusBaseTariffDef"));
		addFacts(sess, TruckBaseTariffDef.class, new String[] {"durationType", "genderCode", "partnerAgeMin", "partnerAgeMax", "allowedWeightMin", "allowedWeightMax", "value", "validFrom", "validTo"}, getReaderFor("TruckBaseTariffDef"));
		addFacts(sess, MessageDef.class, new String[] {"code", "severity", "description"}, getReaderFor("MessageDef"));
		addFacts(sess, ParamDef.class, new String[] {"key", "value"}, getReaderFor("ParamDef"));
	}

	private void addFacts(StatefulKnowledgeSession sess, Class clazz, String[] columnNames, Reader in){
		List l = CsvUtil.populateBeansFromCsv(clazz, columnNames, in);
		
		for (Object o : l) {
			sess.insert(o);
		}
	}

	public KnowledgeBase getKnowledgeBase() {
		return knowledgeBase;
	}

	public void setKnowledgeBase(KnowledgeBase knowledgeBase) {
		this.knowledgeBase = knowledgeBase;
	}

	public String getCsvPath() {
		return csvPath;
	}

	public void setCsvPath(String csvPath) {
		this.csvPath = csvPath;
	}
	
	private Reader getReaderFor(String fact) throws FileNotFoundException{
		return new BufferedReader(new InputStreamReader( 
						getClass().getClassLoader().getResourceAsStream(String.format("csv/%s.csv", fact) ) )
				   );
	}

}
