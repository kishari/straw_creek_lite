package hu.dbx.screek.util;

import org.apache.log4j.Logger;
import org.drools.event.rule.ActivationCancelledEvent;
import org.drools.event.rule.ActivationCreatedEvent;
import org.drools.event.rule.AgendaGroupPoppedEvent;
import org.drools.event.rule.AgendaGroupPushedEvent;
import org.drools.event.rule.BeforeActivationFiredEvent;
import org.drools.event.rule.DefaultAgendaEventListener;

public class AgendaLogger extends DefaultAgendaEventListener{
	private String className = AgendaLogger.class.getName();
	
	Logger fireingLogger = Logger.getLogger(className + ".fireing");
	Logger agendGroupLogger = Logger.getLogger(className + ".agendaGroup");
	Logger activationLogger = Logger.getLogger(className + ".activation");
	
	public void beforeActivationFired(BeforeActivationFiredEvent event) {
		fireingLogger.debug("BeforeActivationFiredEvent: " + event.getActivation().getRule().getName() );
	}
	
	public void agendaGroupPushed(AgendaGroupPushedEvent event) {
		agendGroupLogger.debug("AgendaGroupPushedEvent: " + event.getAgendaGroup().getName() );
	}
	
	public void agendaGroupPopped(AgendaGroupPoppedEvent event) {
		agendGroupLogger.debug("AgendaGroupPoppedEvent: " + event.getAgendaGroup().getName() );
	}
	
    public void activationCancelled(ActivationCancelledEvent event) {
        activationLogger.debug("ActivationCancelledEvent: " + event.getActivation().getRule().getName() );
    }

    public void activationCreated(ActivationCreatedEvent event) {
        activationLogger.debug("ActivationCreatedEvent: " + event.getActivation().getRule().getName() );
    }
}
