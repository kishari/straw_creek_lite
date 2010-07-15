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
	
	private List<String[]> l;
	
	private List<RowObject> generateRows(String[] row) {
		List<RowObject> rowObjects = new ArrayList<RowObject>();
		
		for (int col = 1; col < row.length - 2; col++) {
			RowObject r = new RowObject();
			
			r.setMakeCode(row[0]);			
			r.setMinKW(l.get(0)[col].split("_")[1]);
			r.setMaxKW(l.get(0)[col].split("_")[2]);
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
		
		for (int row = 1; row < l.size(); row++) {
				
				List<RowObject> rowObjects = generateRows(l.get(row));
				
				for (RowObject h : rowObjects) {
					writer.write("\"" + h.getMakeCode() + "\";\"" + h.getMinKW() + "\";\"" + h.getMaxKW() + "\";\"" + h.getValue() + 
							"\";\"" + h.getValidFrom() + "\";\"" + h.getValidTo() + "\"\n");
				}
		}
			
		writer.close();
	}

	private void parse(String path) throws IOException {
		CSVReader reader = new CSVReader(new FileReader(path), ';');
		l = reader.readAll();
	}
	
	public static void main(String[] args) {
		GenerateCSV gen = new GenerateCSV();
		try {
			
			gen.parse("/home/csaba/src/straw_creek/data/PowerModFactorTable.csv");
			gen.buildNewCSV("/home/csaba/src/straw_creek/src/main/rules/csv/", "PowerModFactorDef.csv");
			
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
