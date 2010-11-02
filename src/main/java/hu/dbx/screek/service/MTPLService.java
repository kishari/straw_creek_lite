package hu.dbx.screek.service;

import hu.dbx.screek.iface.assist.TariffQuoteV1;
import hu.dbx.screek.model.Context;
import hu.dbx.screek.model.Quote;
import hu.dbx.screek.util.DroolsHelper;
import hu.dbx.screek.util.Mapper;

import javax.annotation.Resource;
import javax.jws.HandlerChain;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.servlet.ServletContext;
import javax.xml.soap.SOAPException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import javax.xml.ws.soap.SOAPFaultException;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.support.WebApplicationContextUtils;

@WebService(serviceName="MTPLService")
@HandlerChain(file = "handlers.xml")
public class MTPLService implements ApplicationContextAware {
	Logger logger = Logger.getLogger(MTPLService.class);
	
	public DroolsHelper droolsHelper;
	
	@Resource
	private WebServiceContext context;
	private ApplicationContext applicationContext = null;

	@WebMethod
	public TariffQuoteV1 tariff(@WebParam(name="quote")TariffQuoteV1 insurance) {		
		logger.debug("tariff started.");
		try {
			//Context(action, version)
			Context context = new Context("tariff", "1");
			Quote q = Mapper.mapIn(insurance);
			q = getDroolsHelper().compute(q, context);
			TariffQuoteV1 resp = Mapper.mapOut(q);
			logger.debug("tariff finished.");
			
			return resp;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			WSFault f = new WSFault();
			try {
				f.setFaultString(e.getMessage());
			} catch (SOAPException e2) {
				e2.printStackTrace();
			}
			throw new SOAPFaultException(f);
		}
	}

	@WebMethod(exclude = true)
	public DroolsHelper getDroolsHelper() {
		if (droolsHelper == null) {
			droolsHelper = (DroolsHelper)getWebApplicationContext().getBean("droolsHelper");
		}
		return droolsHelper;
	}
	
	@WebMethod(exclude = true)
	public void setDroolsHelper(DroolsHelper droolsHelper) {
		this.droolsHelper = droolsHelper;
	}
	
	@WebMethod(exclude = true)
    private ApplicationContext getWebApplicationContext() throws IllegalStateException {
        if (applicationContext == null) {
            ServletContext servletContext = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
            applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
        }
        return applicationContext;
    }

	@Override
	@WebMethod(exclude = true)
	public void setApplicationContext(ApplicationContext appCtx)
			throws BeansException {
		this.applicationContext = appCtx;
	}
	
	
}
