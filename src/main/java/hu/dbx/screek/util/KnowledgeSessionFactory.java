package hu.dbx.screek.util;

import hu.dbx.screek.model.facts.MakeDef;

import java.io.FileNotFoundException;
import java.io.FileReader;
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
	}

	private void addFacts(StatefulKnowledgeSession sess, Class clazz, String[] columnNames, Reader in){
		List l = CsvUtil.populateBeansFromCsv(clazz, columnNames, in);
		for (Object o : l){
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
		return new FileReader(String.format("%s/%s.csv", this.getCsvPath(), fact));
	}
}
