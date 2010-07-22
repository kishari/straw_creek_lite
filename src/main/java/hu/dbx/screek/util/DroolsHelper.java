package hu.dbx.screek.util;

import hu.dbx.screek.model.Context;
import hu.dbx.screek.model.Partner;
import hu.dbx.screek.model.Quote;
import hu.dbx.screek.model.State;
import hu.dbx.screek.model.Vehicle;
import hu.dbx.screek.model.State.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.NoSuchElementException;

import org.apache.commons.pool.ObjectPool;
import org.drools.event.rule.AgendaEventListener;
import org.drools.runtime.rule.FactHandle;
import org.drools.runtime.StatefulKnowledgeSession;

public class DroolsHelper {
	private ObjectPool pool;
	
	public DroolsHelper(){}
	
	public static final void main(String[] args) 
			throws NoSuchElementException, IllegalStateException, Exception { }
	
	public Quote compute(Quote quote, Context context) throws NoSuchElementException, IllegalStateException, Exception {
		StatefulKnowledgeSession ksession = (StatefulKnowledgeSession)pool.borrowObject();
		
//		test(ksession);
		
		Collection facts = new ArrayList();
		facts.add(quote);
		facts.add(context);
		facts.add(new State(States.WF_START));
		
		Partner p = quote.getPartner();
		p.setQuote(quote);
		facts.add(p);
		
		Vehicle v = quote.getVehicle();
		v.setQuote(quote);
		facts.add(v);
		
		
		Collection<FactHandle> factHandles = insertFacts(facts, ksession);
		ksession.fireAllRules();
		
		retractHandles(factHandles, ksession);
		pool.returnObject(ksession);
		
//		test(ksession);
		ksession.dispose();
		
		return quote;
	}

	private Collection<FactHandle> insertFacts(Collection facts, StatefulKnowledgeSession ksession){
		Collection<FactHandle> handles = new ArrayList<FactHandle>();
		for (Object o : facts){
			handles.add(ksession.insert(o));
		}
		return handles;
	}
	
	private void retractHandles(Collection<FactHandle> handles, StatefulKnowledgeSession ksession){
		for(FactHandle h : handles) {
			ksession.retract(h);
		}
	}

	public ObjectPool getPool() {
		return pool;
	}

	public void setPool(ObjectPool pool) {
		this.pool = pool;
	}
	
	private void test(StatefulKnowledgeSession ksession) {
		System.out.println("Test");
		Collection<AgendaEventListener> listeners = ksession.getAgendaEventListeners();
		System.out.println(listeners.size());
		
		for(AgendaEventListener l : listeners) {
			System.out.println(l.getClass().getName());
		}
	}

}
