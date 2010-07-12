package hu.dbx.screek.standalone;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Runner {
	public static void main(String[] argv){
		// create and configure beans
		ApplicationContext context =
		    new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml", "standaloneContext.xml"});
	}
}
