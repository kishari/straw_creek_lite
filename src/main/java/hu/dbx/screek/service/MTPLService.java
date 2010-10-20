package hu.dbx.screek.service;

import hu.dbx.screek.iface.assist.*;
import hu.dbx.screek.model.*;
import hu.dbx.screek.util.*;

import java.util.NoSuchElementException;

import javax.annotation.Resource;
import javax.jws.HandlerChain;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.servlet.ServletContext;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

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
			Context context = new Context("tariff", 1);
			Quote q = Mapper.mapIn(insurance);
			q = getDroolsHelper().compute(q, context);
			TariffQuoteV1 resp = Mapper.mapOutV1(q);
			logger.debug("tariff finished.");
			
			return resp;
		} catch (NoSuchElementException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@WebMethod
	public TariffQuoteV2 tariffV2(@WebParam(name="quote")TariffQuoteV2 insurance) {
		logger.debug("tariffV2 started.");
		try {
			//Context(action, version)
			Context context = new Context("tariff", 2);
			Quote q = Mapper.mapIn(insurance);
			q = getDroolsHelper().compute(q, context);
			TariffQuoteV2 resp = Mapper.mapOutV2(q);
			logger.debug("tariffV2 finished.");
			
			return resp;
		} catch (NoSuchElementException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@WebMethod
	public QuoteV1 approve(@WebParam(name="quote")QuoteV1 insurance) {
		logger.debug("approve started.");
		try {
			//Context(action, version)
			Context context = new Context("approve", 1);
			Quote q = Mapper.mapIn(insurance);
			q = getDroolsHelper().compute(q, context);
			QuoteV1 resp = Mapper.mapOutApproveV1(q);
			logger.debug("approve finished.");
			
			return resp;
		} catch (NoSuchElementException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
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
