package hu.dbx.screek.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import au.com.bytecode.opencsv.CSVReader;

public class GenerateCSV {
	
	private List<String[]> l1;
	private List<String[]> l2;
	
	private List<RowObject> generateRows(String[] row, boolean workWithL1) {
		List<RowObject> rowObjects = new ArrayList<RowObject>();
		
		for (int col = 1; col < row.length - 2; col++) {
			RowObject r = new RowObject();
			
			r.setMakeCode(row[0]);
			if (workWithL1) {
				r.setMinKW(l1.get(0)[col].split("_")[1]);
				r.setMaxKW(l1.get(0)[col].split("_")[2]);
			}
			else {
				r.setMinKW(l2.get(0)[col].split("_")[1]);
				r.setMaxKW(l2.get(0)[col].split("_")[2]);
			}
			r.setValue(row[col]);			
			r.setValidFrom(row[row.length - 2]);			
			r.setValidTo(row[row.length - 1]);
			
			rowObjects.add(r);
		}
		return rowObjects;
	}
	
	private void buildNewCSV(String path, String fileName) throws IOException {
		File genCSVFile = new File(path, fileName);
		Writer writer = null;
		writer = new BufferedWriter(new FileWriter(genCSVFile));
		
		writer.write("\"MAKE_CODE\";\"MIN_KW\";\"MAX_KW\";\"VALUE\";\"VALID_FROM\";\"VALID_TO\"\n");
		
		for (int row = 1; row < l1.size(); row++) {
				
				List<RowObject> rowObjects = generateRows(l1.get(row), true);
				
				for (RowObject h : rowObjects) {
					writer.write("\"" + h.getMakeCode() + "\";\"" + h.getMinKW() + "\";\"" + h.getMaxKW() + "\";\"" + h.getValue() + 
							"\";\"" + h.getValidFrom() + "\";\"" + h.getValidTo() + "\"\n");
				}
		}
		for (int row = 1; row < l2.size(); row++) {
			
			List<RowObject> rowObjects = generateRows(l2.get(row), false);
			
			for (RowObject h : rowObjects) {
				writer.write("\"" + h.getMakeCode() + "\";\"" + h.getMinKW() + "\";\"" + h.getMaxKW() + "\";\"" + h.getValue() + 
						"\";\"" + h.getValidFrom() + "\";\"" + h.getValidTo() + "\"\n");
			}
	}
			
		writer.close();
	}

	private void parse(String path) throws IOException {
		CSVReader reader = new CSVReader(new FileReader(path), ';');
		if (l1 == null) {
			l1 = reader.readAll();
		}
		else {
			l2 = reader.readAll();
		}		
	}
	
	public static void main(String[] args) {
		GenerateCSV gen = new GenerateCSV();
		try {
			gen.parse("/home/csaba/src/straw_creek/data/PowerModFactorTable2010.csv");
			//gen.buildNewCSV("/home/csaba/src/straw_creek/data/", "PowerModFactorDef2010.csv");
			gen.parse("/home/csaba/src/straw_creek/data/PowerModFactorTable2011.csv");
			//gen.buildNewCSV("/home/csaba/src/straw_creek/data/", "PowerModFactorDef2011.csv");
			gen.buildNewCSV("/home/csaba/src/straw_creek/data/", "PowerModFactorDef.csv");
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	private class RowObject {
		
		private String makeCode;
		private String minKW;
		private String maxKW;
		private String value;
		private String validFrom;
		private String validTo;
		
		public String getMakeCode() {
			return makeCode;
		}
		public void setMakeCode(String makeCode) {
			this.makeCode = makeCode;
		}
		public String getMinKW() {
			return minKW;
		}
		public void setMinKW(String minKW) {
			this.minKW = minKW;
		}
		public String getMaxKW() {
			return maxKW;
		}
		public void setMaxKW(String maxKW) {
			this.maxKW = maxKW;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
		public String getValidFrom() {
			return validFrom;
		}
		public void setValidFrom(String validFrom) {
			this.validFrom = validFrom;
		}
		public String getValidTo() {
			return validTo;
		}
		public void setValidTo(String validTo) {
			this.validTo = validTo;
		}

	}

}
