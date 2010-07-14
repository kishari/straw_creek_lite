package hu.dbx.screek.util;

import java.beans.PropertyEditorManager;
import java.beans.PropertyEditorSupport;
import java.io.Reader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;
import au.com.bytecode.opencsv.bean.CsvToBean;


public class CsvUtil {
	static {
		PropertyEditorManager.registerEditor(java.util.Date.class, CsvUtil.DatePropertyEditor.class);
		PropertyEditorManager.registerEditor(java.lang.Double.class, CsvUtil.DoublePropertyEditor.class);
		PropertyEditorManager.registerEditor(java.lang.Integer.class, CsvUtil.IntegerPropertyEditor.class);
	}
	
	public static List populateBeansFromCsv(Class clazz, String[] columnNames, Reader in) {
		CSVReader reader = new CSVReader(in, ';', '"',1);
		ColumnPositionMappingStrategy strat = new ColumnPositionMappingStrategy();
		strat.setType(clazz);
		strat.setColumnMapping(columnNames);

		CsvToBean csv = new CsvToBean();
		List list = csv.parse(strat, reader);
		return list;
	}
	
	public static class DatePropertyEditor extends PropertyEditorSupport {
		@Override
		public void setAsText(String text) throws IllegalArgumentException {
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date d = null;
			try {
				d = (Date)formatter.parse(text);
				setValue(d);
			} catch (ParseException e) {
				throw new IllegalArgumentException(e);
			}
		}
	}
	
	public static class DoublePropertyEditor extends PropertyEditorSupport {
		@Override
		public void setAsText(String text) throws IllegalArgumentException {

			if ("".equals(text) || text == null) {
				setValue(null);
			}
			else {
				setValue(Double.parseDouble(text));				
			}
		}		
	}
	
	public static class IntegerPropertyEditor extends PropertyEditorSupport {
		@Override
		public void setAsText(String text) throws IllegalArgumentException {
			if ("".equals(text) || text == null) {
				setValue(null);
			}
			else {
				setValue(Integer.parseInt(text));
			}
		}		
	}
}
